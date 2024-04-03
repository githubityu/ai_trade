import 'dart:ffi';

import 'package:ai_trade/gen/colors.gen.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../exports.dart';
import '../local/constants.dart';
import '../models/export_models.dart';
import 'common/common_export.dart';

class BuyPage extends HookWidget {
  const BuyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final coinNameC = useTextEditingController();
    final coinPriceC = useTextEditingController();
    final coinNumC = useTextEditingController();
    final buyU = useValueNotifier(0.0);
    final buyNum = useRef("0.0");

    useEffect(() {
      void callBack() {
        final coinPrice = coinPriceC.text;
        final coinNum = coinNumC.text;
        if (coinPrice.isNotEmpty && coinNum.isNotEmpty) {
          buyNum.value = coinNum;
          buyU.value = AppUtils.calculateU(coinPrice, coinNum).toDouble();
          "${buyU.value}".log();
        }
      }
      coinPriceC.addListener(callBack);
      coinNumC.addListener(callBack);
      return () {
        coinPriceC.removeListener(callBack);
        coinNumC.removeListener(callBack);
      };
    }, [1]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('买入'),
        actions: [
          ElevatedButton(
            onPressed: () {
              IsarUtils.write((isar){
                final coinBuyModel = CoinBuyModel()
                  ..buyPrice = coinPriceC.text
                  ..buyNum = coinNumC.text
                  ..coinName = coinNameC.text
                  ..balanceNum = coinNumC.text
                  ..buyTime = DateTime.now()
                  ..coinSellItems=[]..id = isar.coinBuyModels.autoIncrement();
                isar.coinBuyModels.put(coinBuyModel);
                Utils.showToast("保存成功");
                userAppRouter().pop();
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.themeColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text("保存"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RoundWidget(
          color: ColorName.themeColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ItemEditContent(
                  controller: coinNameC,
                  title: "币种",
                  isNum: false,
                ),
                ItemEditContent(
                  controller: coinPriceC,
                  title: "买入价格",
                  suffix: Constants.U,
                ),
                ItemEditContent(controller: coinNumC, title: "买入数量"),
                FooterBuyPage(buyU: buyU, buyNum: buyNum)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemEditContent extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? suffix;
  final bool enabled;
  final bool isNum;

  const ItemEditContent(
      {super.key, required this.controller, required this.title, this.suffix,this.enabled=true,this.isNum =true});

  @override
  Widget build(BuildContext context) {
    final r= isNum?r'[0-9.]':r'[a-zA-Z0-9.]';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.bodySmall),
        const Gap.v(10),
        CupertinoTextField(
          enabled: enabled,
          keyboardType: isNum?TextInputType.number:TextInputType.text,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          suffix: suffix != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(suffix!),
                )
              : null,
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r)),
          ],
        ),
        const Gap.v(10),
      ],
    );
  }
}

class FooterBuyPage extends StatelessWidget {
  final ValueNotifier<double> buyU;
  final ObjectRef<String> buyNum;

  const FooterBuyPage({super.key, required this.buyU, required this.buyNum});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodySmall;
    return ValueListenableBuilder(
      valueListenable: buyU,
      builder: (BuildContext context, value, Widget? child) {
        final coinNUm = AppUtils.calculateFee(buyNum.value);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              LeftRightText(
                leading: Text("手续费", style: style),
                title: Text(
                  "${coinNUm.feeNum} BTC",
                ),
              ),
              LeftRightText(
                leading: Text("实际持仓量", style: style),
                title: Text("${coinNUm.resultNum} BTC"),
              ),
              LeftRightText(
                leading: Text("买入总额", style: style),
                title: Text("$value ${Constants.U}"),
              ),
            ],
          ),
        );
      },
    );
  }
}
