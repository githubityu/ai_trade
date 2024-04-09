import 'package:ai_trade/exports.dart';
import 'package:ai_trade/providers/coin_riverpod.dart';
import 'package:ai_trade/route/app_router.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:ai_trade/widgets/asyncvalue_widget.dart';
import 'package:flutter/material.dart';

import '../gen/export_gen.dart';
import '../local/constants.dart';
import '../providers/providers.dart';
import 'buy_page.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final buyFee = ShowUtils.getFee(isBuyFee: true);
    final sellFee = ShowUtils.getFee(isBuyFee: false);
    final refresh = useState(false);
    const style = TextStyle(
        color: ColorName.textColor525298, fontWeight: FontWeight.bold);
    final titles = useRef([
      "买入手续费率",
      "卖出手续费率",
      "货币",
      "投入成本",
    ]);
    final getListTitle = useCallback((String leading, String title,
        {Widget? trailing, Widget? titleW, VoidCallback? onTap}) {
      return ListTile(
        title: titleW ??
            Text(
              title,
              style: style,
            ),
        leading: SizedBox(
          width: 100,
          child: Text(leading),
        ),
        trailing: trailing,
        onTap: onTap,
      );
    }, []);
    final getTitle = useCallback((int index) {
      return switch (index) {
        0 => ShowUtils.toPercent(d(buyFee), isMul: false),
        1 => ShowUtils.toPercent(d(sellFee), isMul: false),
        2 => Constants.U,
        3 => "",
        _ => "",
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title:  Text("${context.L?.setting}"),
        actions:  const [
          ChangeLanguageButton(),
        ],
      ),
      body: Column(
        children: ListTile.divideTiles(
            context: context,
            tiles: titles.value.mapIndexed((index, e) => getListTitle(
                e, getTitle(index),
                trailing:
                    index != 2 ? const Icon(Icons.arrow_forward_ios) : null,
                onTap: index != 2
                    ? () {
                        switch (index) {
                          case 0:
                            userAppRouter()
                                .push(RoutePath.updateFeePage, extra: true)
                                .then((value) {
                              if (value == true) {
                                refresh.value = !refresh.value;
                              }
                            });
                            break;
                          case 1:
                            userAppRouter()
                                .push(RoutePath.updateFeePage, extra: false)
                                .then((value) {
                              if (value == true) {
                                refresh.value = !refresh.value;
                              }
                            });
                            break;
                          case 3:
                            userAppRouter().push(RoutePath.inputConstPage);
                            break;
                        }
                      }
                    : null,
                titleW: index == 3
                    ? AsyncValueWidget(ref.watch(inputConstTotalProvider),
                        asyncValueBuilder: (value) {
                        return Text(ShowUtils.withU("$value"), style: style);
                      })
                    : null))).toList(),
      ),
    );
  }
}

class UpdateFeePage extends HookWidget {
  final bool isBuyFee;

  const UpdateFeePage({super.key, required this.isBuyFee});

  @override
  Widget build(BuildContext context) {
    final editC = useTextEditingController();
    final title = useRef(isBuyFee ? "买入手续费率" : "卖出手续费率");
    final buyFee = ShowUtils.getFee(isBuyFee: isBuyFee);
    useEffect(() {
      editC.text = buyFee;
      return null;
    }, []);
    return Scaffold(
        appBar: AppBar(
          title: const Text("修改手续费率"),
          actions: [
            ElevatedButton(
              onPressed: () {
                final fee = editC.text;
                if (fee.isNotEmpty) {
                  final feeNum = d(fee);
                  if (feeNum > d("0")) {
                    ShowUtils.updateFee(fee, isBuyFee: isBuyFee);
                    Utils.showToast("${context.L?.save_success}");
                    userAppRouter().pop(true);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.themeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child:  Text("${context.L?.save}"),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ItemEditContent(
            controller: editC,
            title: title.value,
          ),
        ));
  }
}

class ChangeLanguageButton extends HookConsumerWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
   final  title =  useState(ShowUtils.getLocation());
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) {
        return LanguageType.values.map<PopupMenuItem>((e) {
          return PopupMenuItem(
            onTap: () async {
              ref
                  .read(localChange.notifier)
                  .update((state) => state = ShowUtils.updateLocation(e));
              title.value = e.type;
            },
            child: Text(e.type.toUpperCase(),style: TextStyle(color: e.type==title.value?ColorName.themeColor:Colors.black),),
          );
        }).toList(growable: false);
      },
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(title.value.toUpperCase()),
      ),
    );
  }
}
