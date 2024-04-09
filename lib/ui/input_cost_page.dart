import 'package:ai_trade/exports.dart';
import 'package:ai_trade/gen/colors.gen.dart';
import 'package:ai_trade/local/constants.dart';
import 'package:ai_trade/models/coin_model.dart';
import 'package:ai_trade/models/export_models.dart';
import 'package:ai_trade/providers/export_providers.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:ai_trade/widgets/asyncvalue_widget.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import 'buy_page.dart';

class InputConstPage extends HookConsumerWidget {
  const InputConstPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selected = useState(<int>{0});
    final tabC = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(
        title: const Text("成本记录"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: SegmentedButton(
              showSelectedIcon: false,
              style: SegmentedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                selectedBackgroundColor: ColorName.themeColor,
                backgroundColor: Colors.white,
                selectedForegroundColor: Colors.white,
                foregroundColor: ColorName.textColor525298,
              ),
              segments: const [
                ButtonSegment(value: 0, label: Text("添加成本")),
                ButtonSegment(value: 1, label: Text("成本记录")),
              ],
              selected: selected.value,
              onSelectionChanged: (value) {
                selected.value = value;
                tabC.index = value.first;
              }),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabC,
        children: const [AddInputConstPage(), InputConstRecordPage()],
      ),
    );
  }
}

class AddInputConstPage extends HookConsumerWidget {
  const AddInputConstPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    useAutomaticKeepAlive();
    final editC = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          ItemEditContent(
            controller: editC,
            isNum: true,
            suffix: Constants.U,
            title: "添加成本",
          ),
          ElevatedButton(
            onPressed: () {
              final num = editC.text;
              if (num.isEmpty) {
                Utils.showToast("数量不能为空");
                return;
              }
              IsarUtils.write((isar) {
                final item = InputCostModel()
                  ..total = num
                  ..time = DateTime.now()
                  ..id = isar.inputCostModels.autoIncrement();
                isar.inputCostModels.put(item);
                ref.invalidate(findInputCostModelProvider);
                Utils.showToast("添加成功");
                editC.text = "";
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.themeColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text("确定"),
          )
        ],
      ),
    );
  }
}

class InputConstRecordPage extends HookConsumerWidget {
  const InputConstRecordPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    useAutomaticKeepAlive();
    return AsyncValueWidget(ref.watch(findInputCostModelProvider),
        asyncValueBuilder: (items) {
      final list = items ?? [];
      final total = list.fold(Decimal.zero,
          (previousValue, element) => previousValue + d(element.total));
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("总计 ${ShowUtils.withU(total)}"),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ItemInputConst(
                item: list[index],
              );
            },
            itemCount: list.length,
          ))
        ],
      );
    });
  }
}

class ItemInputConst extends StatelessWidget {
  final InputCostModel item;

  const ItemInputConst({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final style2 = context.textTheme.labelSmall
        ?.copyWith(color: ColorName.textColor9494AD, height: 2);
    return RoundWidget(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        color: ColorName.themeColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Text(
            item.time.formatYYYYMMdd(MMDDHHMM),
            style: style2,
          ),
          const Gap.v(10),
          Text(ShowUtils.withU(item.total))
                ],
              ),
        ));
  }
}
