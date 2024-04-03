import 'package:ai_trade/exports.dart';
import 'package:ai_trade/gen/export_gen.dart';
import 'package:ai_trade/ui/common/common_export.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../local/constants.dart';
import '../models/export_models.dart';
import 'buy_page.dart';

class SellPage extends HookWidget {
  final CoinBuyModel coinBuyModel;

  const SellPage({
    super.key,
    required this.coinBuyModel,
  });

  @override
  Widget build(BuildContext context) {
    final coinNameC = useTextEditingController();
    final coinPriceC = useTextEditingController();
    final coinNumC = useTextEditingController();
    final sellU = useValueNotifier(0.0);
    final sellNum = useRef("0.0");

    useEffect(() {
      coinNameC.text = coinBuyModel.coinName;
      void callBack() {
        final coinPrice = coinPriceC.text;
        final coinNum = coinNumC.text;
        if (coinPrice.isNotEmpty && coinNum.isNotEmpty) {
          sellNum.value = coinNum;
          sellU.value = AppUtils.calculateU(coinPrice, coinNum).toDouble();
          "${sellU.value}".log();
        }
      }

      coinPriceC.addListener(callBack);
      coinNumC.addListener(callBack);
      return () {
        coinPriceC.removeListener(callBack);
        coinNumC.removeListener(callBack);
      };
    }, [1]);

    final resultRate = useCallback(() {
      final coinPrice = coinPriceC.text;
      final coinNum = coinNumC.text;
      return AppUtils.calculateRate(coinBuyModel.buyPrice, coinPrice, coinNum);
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('卖出'),
        actions: [
          ElevatedButton(
            onPressed: () {
              IsarUtils.write((isar){
                CoinSellModel coinSellModel = CoinSellModel()
                  ..coinBuyId = coinBuyModel.id
                  ..sellNum = sellNum.value
                  ..sellPrice = coinPriceC.text
                  ..sellTime = DateTime.now();
                coinBuyModel.coinSellItems= [...coinBuyModel.coinSellItems,coinSellModel];
                coinBuyModel.balanceNum = (d(coinBuyModel.balanceNum) - d(sellNum.value)).toString();
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
                  enabled: false,
                  isNum: false,
                ),
                ItemEditContent(
                  controller: coinPriceC,
                  title: "卖出价格",
                  suffix: Constants.U,
                ),
                ItemEditContent(controller: coinNumC, title: "卖出数量"),
                FooterSellPage(
                    sellU: sellU, sellNum: sellNum, resultRate: resultRate)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FooterSellPage extends StatelessWidget {
  final ValueNotifier<double> sellU;
  final ObjectRef<String> sellNum;
  final ({Decimal rate, Decimal rateNum}) Function() resultRate;

  const FooterSellPage(
      {super.key,
      required this.sellU,
      required this.sellNum,
      required this.resultRate});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.bodySmall;
    return ValueListenableBuilder(
      valueListenable: sellU,
      builder: (BuildContext context, value, Widget? child) {
        final coinNUm = AppUtils.calculateFee(sellU.value.toString());
        final coinRate = resultRate.call();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              LeftRightText(
                  leading: Text("手续费", style: style),
                  title: Text(ShowUtils.withU(coinNUm.feeNum))),
              LeftRightText(
                  leading: Text("实际持仓量", style: style),
                  title: Text(ShowUtils.withU(coinNUm.resultNum))),
              LeftRightText(
                  leading: Text("预计收益率", style: style),
                  title: Text(ShowUtils.toPercent(coinRate.rate))),
              LeftRightText(
                  leading: Text("预估收益", style: style),
                  title: Text(ShowUtils.withU("${coinRate.rateNum}"))),
            ],
          ),
        );
      },
    );
  }
}
