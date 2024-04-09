import 'package:ai_trade/exports.dart';
import 'package:ai_trade/gen/assets.gen.dart';
import 'package:ai_trade/gen/colors.gen.dart';
import 'package:ai_trade/local/constants.dart';
import 'package:ai_trade/models/coin_model.dart';
import 'package:ai_trade/providers/coin_riverpod.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:ai_trade/widgets/asyncvalue_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TradeHistoryPage extends HookConsumerWidget {
  const TradeHistoryPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ai Trade'),
      ),
      body: AsyncValueWidget(ref.watch(buyListProvider),
          asyncValueBuilder: (value) {
        final list = <CoinBuyOrSell>[];
        value?.forEach((element) {
          CoinBuyOrSell coinBuyOrSell =
              CoinBuyOrSell(isBuy: true, coinBuyModel: element);
          list.add(coinBuyOrSell);
          for (var element2 in element.coinSellItems) {
            CoinBuyOrSell coinBuyOrSell = CoinBuyOrSell(
                isBuy: false, coinSellModel: element2, coinBuyModel: element);
            list.add(coinBuyOrSell);
          }
        });
        list.sort((a, b) =>
            b.time.millisecondsSinceEpoch - a.time.millisecondsSinceEpoch);
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ItemTradeHistory(item: list[index]);
          },
          itemCount: list.length,
        );
      }),
    );
  }
}

class ItemTradeHistory extends StatelessWidget {
  final CoinBuyOrSell item;

  const ItemTradeHistory({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isBuy = item.isBuy;
    final style = context.textTheme.labelSmall
        ?.copyWith(color: Colors.green, fontWeight: FontWeight.bold);
    final style2 = context.textTheme.labelSmall
        ?.copyWith(color: ColorName.textColor9494AD, height: 2);
    final style3 = style?.copyWith(color: Colors.black, height: 2);
    final buyPrice = item.coinBuyModel?.buyPrice.toString() ?? "0";
    final buyNum = item.coinBuyModel?.buyNum.toString() ?? "0";
    final buyU =
        ShowUtils.removeInvalidZeros(AppUtils.calculateU(buyPrice, buyNum));

    final sellPrice = item.coinSellModel?.sellPrice.toString() ?? "0";
    final sellNum = item.coinSellModel?.sellNum.toString() ?? "0";
    final sellU =
        ShowUtils.removeInvalidZeros(AppUtils.calculateU(sellPrice, sellNum));

    final rate = AppUtils.calculateRate(buyPrice, sellPrice, sellNum);

    return RoundWidget(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      color: ColorName.themeColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${item.coinBuyModel?.coinName}/${Constants.U}",
              style: context.textTheme.bodySmall?.copyWith(
                  color: ColorName.themeColor, fontWeight: FontWeight.bold),
            ),
            Gap.v(10),
            Row(
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: ShowUtils.showLineStr(
                          ShowUtils.removeInvalidZeros(rate.rateNum)),
                      style: style),
                  TextSpan(text: "盈亏", style: style2),
                ])),
                Gap.h(30),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text:
                          ShowUtils.showLineStr(ShowUtils.toPercent(rate.rate)),
                      style: style),
                  TextSpan(text: "收益率", style: style2),
                ])),
              ],
            ),
            Gap.v(10),
            Row(
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: ShowUtils.showLineStr(item.coinBuyModel?.buyPrice),
                      style: style3),
                  TextSpan(text: "买入价", style: style2),
                ])),
                Gap.h(10),
                Text.rich(TextSpan(children: [
                  TextSpan(text: ShowUtils.showLineStr(buyU), style: style3),
                  TextSpan(text: "买入总价", style: style2),
                ])),
                Spacer(),
                Visibility(
                  visible: !isBuy,
                  child: Row(
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: ShowUtils.showLineStr(
                                item.coinSellModel?.sellPrice),
                            style: style3),
                        TextSpan(text: "卖出总价", style: style2),
                      ])),
                      Gap.h(10),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: ShowUtils.showLineStr(sellU), style: style3),
                        TextSpan(text: "卖出总价", style: style2),
                      ]))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${item.coinBuyModel?.buyTime.formatYYYYMMdd(MMDDHHMM)}",
                  style: style2,
                ),
                Expanded(
                    child: Visibility(
                  visible: !isBuy,
                  child: Row(
                    children: [
                      Expanded(
                          child: MyAssets.images.icArrowRight.image(height: 8)),
                      Text(
                        "${item.coinSellModel?.sellTime.formatYYYYMMdd(MMDDHHMM)}",
                        style: style2,
                      ),
                    ],
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
