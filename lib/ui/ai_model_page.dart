import 'package:ai_trade/exports.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../gen/export_gen.dart';
import '../local/constants.dart';
import '../models/export_models.dart';
import 'buy_page.dart';

class AiModelPage extends HookConsumerWidget {
  final CoinBuyModel coinBuyModel;

  const AiModelPage({super.key, required this.coinBuyModel});

  @override
  Widget build(BuildContext context, ref) {
    final upPriceC = useTextEditingController();
    final downPriceC = useTextEditingController();
    final coinPriceC = useTextEditingController();
    final coinNumC = useTextEditingController();
    final notifyData = ValueNotifier(false);

    final getStyle = useCallback((Color color) {
      return ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
    }, []);
    final coinSellAiModel = useRef(CoinSellAiModel());

    final titles = useRef([
      "卖出价格",
      "卖出数量",
      "手续费",
      "卖出总额",
      "盈亏",
      "收益率",
      "新增币数"
    ]);
    return Scaffold(
        resizeToAvoidBottomInset:false,
      appBar: AppBar(
        title:  Text('Ai Model(${coinBuyModel.coinName})'),
        actions: [
          ElevatedButton(
            onPressed: () {
              if(notifyData.value){
                IsarUtils.write((isar){
                  final newList = coinBuyModel.sellAiModels.length>4?coinBuyModel.sellAiModels.sublist(0,4):coinBuyModel.sellAiModels;
                  coinBuyModel.sellAiModels = [coinSellAiModel.value,...newList];
                  isar.coinBuyModels.put(coinBuyModel);
                  Utils.showToast("${context.L?.save_success}");
                  userAppRouter().pop();
                });
              }else{
                Utils.showToast("建立卖出模型");
              }
            },
            style: getStyle(ColorName.themeColor),
            child:  Text("${context.L?.save}"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundWidget(
              color: ColorName.themeColor.withOpacity(0.1),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ItemEditContent(
                      controller: coinPriceC,
                      title: "卖出价格",
                      suffix: Constants.U,
                    ),
                    ItemEditContent(controller: coinNumC, title: "卖出数量" ,suffix: "全部",onTap: (){
                      coinNumC.text = coinBuyModel.balanceNum;
                    },),
                    ItemEditContent(
                      controller: upPriceC,
                      title: "涨幅价格",
                      suffix: Constants.U,
                    ),
                    ItemEditContent(
                      controller: downPriceC,
                      title: "反手价格",
                      suffix: Constants.U,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                            final  sellPrice = coinPriceC.text;
                            if (sellPrice.isEmpty) {
                              Utils.showToast("卖出价格不能为空");
                              return;
                            }
                            final coinSellNum = coinNumC.text;
                            if (coinSellNum.isEmpty) {
                              Utils.showToast("卖出数量不能为空");
                              return;
                            }
                            final increasePrice = upPriceC.text;
                            if (increasePrice.isEmpty) {
                              Utils.showToast("涨幅价格不能为空");
                              return;
                            }
                            final downPrice = downPriceC.text;
                            if (downPrice.isEmpty) {
                              Utils.showToast("反手价格不能为空");
                              return;
                            }
                              coinSellAiModel.value
                                ..sellPrice = coinPriceC.text
                                ..coinName = coinBuyModel.coinName
                                ..coinBuyId = coinBuyModel.id
                                ..increasePrice = upPriceC.text
                                ..sellNum = coinNumC.text
                                ..buyPrice = downPriceC.text;
                              notifyData.value = true;
                            },
                            style: getStyle(ColorName.themeColor),
                            child: const Text("建立卖出模型"),
                          ),
                        ),
                        const Gap.h(15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              notifyData.value = false;
                            },
                            style: getStyle(Colors.orange),
                            child: const Text("重置"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "模型数据",
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: ColorName.themeColor),
              ),
            ),
            Row(
             children: titles.value.map((e) => Expanded(child: Center(child: Text(e,style: context.textTheme.bodySmall,)))).toList(),
            ),
            Expanded(
                child: ValueListenableBuilder(
                  builder: (context,v,child) {
                    return v?SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(20, (index) => ItemAiModelPage(item: coinSellAiModel.value,index: index,)),
                        ),
                      ),
                    ):const SizedBox();
                  }, valueListenable: notifyData,
                ))
          ],
        ),
      ),
    );
  }
}


class ItemAiModelPage extends StatelessWidget {
  final CoinSellAiModel item;
  final int index;

  const ItemAiModelPage({super.key, required this.item, required this.index});

  ///
  List<String> calculateSellPrice() {
    ///卖出的价格
    final sellPrice =
        d(item.sellPrice) + d(item.increasePrice) * d("${index + 1}");

    ///卖出的数量
    final sellNum = item.sellNum;

    ///卖出的总额
    final sellU = AppUtils.calculateU(sellPrice.toString(), sellNum);

    ///卖出的手续费 剩下多少币
    final sellFee = AppUtils.calculateFee(sellU.toString());

    ///收益的费率 收益多少币包含了手续费
    final rate =
    AppUtils.calculateRate(item.buyPrice, sellPrice.toString(), sellNum);

    ///可以买多少币
    final increaseNum = (rate.rateNum / d(item.buyPrice))
        .toDecimal(scaleOnInfinitePrecision: 4);

    return [sellPrice.toString(), sellNum,sellFee.feeNum.toStringAsFixed(1),  sellU.toStringAsFixed(1), rate.rateNum.toStringAsFixed(1),ShowUtils.toPercent(rate.rate), increaseNum.toString()];
  }

  double getWidth(index) {
    return switch(index){
      5 => 80,
      1 => 40,
      _=> 60
    };
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: calculateSellPrice().mapIndexed((index,e) => SizedBox(
              width: getWidth(index),
              child: Center(
                child: Text(e,style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.black
                ),),
              ),
            )).toList(),
          ),
          const Divider(
            height: 5,
          )
        ],
      ),
    );
  }
}
