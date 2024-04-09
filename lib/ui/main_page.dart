import 'package:ai_trade/gen/assets.gen.dart';
import 'package:ai_trade/gen/colors.gen.dart';
import 'package:ai_trade/local/constants.dart';
import 'package:ai_trade/providers/coin_riverpod.dart';
import 'package:ai_trade/route/app_router.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:ai_trade/util/show_utils.dart';
import 'package:ai_trade/widgets/asyncvalue_widget.dart';
import 'package:flutter/material.dart';

import '../exports.dart';
import '../models/export_models.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final tabController = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ai Trade"),
        leading: IconButton(
          onPressed: () {
            userAppRouter().push(RoutePath.buyPage);

          },
          icon: ImageIcon(MyAssets.images.icAdd.provider()),
        ),
        actions: [
          IconButton(
            onPressed: () {
              userAppRouter().push(RoutePath.tradeHistoryPage);
            },
            icon: const Icon(Icons.history),
          ),
          IconButton(
            onPressed: () {
              userAppRouter().push(RoutePath.settingPage);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: FutureBuilder(
        future: IsarUtils.insertCoinInfoModel(),
        builder: (context, snapshot) {
          return AsyncValueWidget(ref.watch(buyListProvider), asyncValueBuilder: (items){
            final list = (items ?? []).whereNotNull().toList();
            final sellList = list.expand((e) => e.coinSellItems).toList();
            final buyList = list
                .where((e) =>
            e.balanceNum.toDoubleOrDefault(defaultValue: 0) > 0)
                .toList();
            return RefreshNestedWidget(
              onRefresh: ()=>ref.refresh(buyListProvider.future),
              headerSliver: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverPersistentHeader(
                      delegate: StickyChildDelegate(
                          child: const PreferredSize(
                              preferredSize: Size.fromHeight(80),
                              child: MainHeader()))),
                ];
              },
              child: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs:  [
                      Tab(text: "${context.L?.current_position_data}"),
                      Tab(text: "${context.L?.history_position_data}"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        BuyBodyList(items: buyList),
                        SellBodyList(
                          items: sellList,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        }
      ),
    );
  }
}

class MainHeader extends ConsumerWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final style1 =
        context.textTheme.bodySmall?.copyWith(color: ColorName.textColor9494AD);
    final style2 = context.textTheme.bodyLarge
        ?.copyWith(color: ColorName.themeColor, fontWeight: FontWeight.bold);
    const widgetPadding = WidgetSpan(child: Gap.v(20));
    return RoundWidget(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      color: ColorName.themeColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: AsyncValueWidget(
          ref.watch(buyListProvider),
          asyncValueBuilder: (items){
            final priceData = AppUtils.calculateHearData(items??[]);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: ShowUtils.showLineStr("涨跌幅"), style: style1),
                    widgetPadding,
                    TextSpan(text: ShowUtils.toPercent(priceData.inComeRate), style: style2)
                  ]),
                  textAlign: TextAlign.center,
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: ShowUtils.showLineStr("总资产"), style: style1),
                    widgetPadding,
                    TextSpan(text: ShowUtils.withU(priceData.totalPrice), style: style2)
                  ]),
                  textAlign: TextAlign.center,
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: ShowUtils.showLineStr("利润"), style: style1),
                    widgetPadding,
                    TextSpan(text: ShowUtils.withU(priceData.inCome), style: style2)
                  ]),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BuyBodyList extends HookWidget {
  final List<CoinBuyModel> items;

  const BuyBodyList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (BuildContext context, int index) {
        return ItemBuyBody(
          item: items[index],
        );
      },
      itemCount: items.length,
    );
  }
}

class SellBodyList extends HookWidget {
  final List<CoinSellModel> items;

  const SellBodyList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (BuildContext context, int index) {
        return ItemSellBody(
          item: items[index],
        );
      },
      itemCount: items.length,
    );
  }
}

class ItemBuyBody extends StatelessWidget {
  final CoinBuyModel item;
  const ItemBuyBody({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    final leftStyle = context.textTheme.bodySmall
        ?.copyWith(color: Colors.black.withOpacity(0.5));
     final rateData = AppUtils.calculateRate(item.buyPrice, ShowUtils.getPrice(item.coinName), item.balanceNum);
    ///获取当前价格
    return LayoutBuilder(builder: (context, constraints) {
      final width = (Screens.width - 80) / 2;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap.v(20),
          TextIcon(
            icon: const CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Text(
                "买",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
            text: item.buyTime.formatYYYYMMdd(MMDDHHMM),
            textStyle: leftStyle,
          ),
          RoundWidget(
            color: ColorName.themeColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(
                children: [
                  ItemRow(
                    leftStyle: context.textTheme.bodySmall?.copyWith(color: Colors.black),
                    rightStyle: context.textTheme.bodyMedium,
                    itemRowData: (
                      item.coinName,
                      item.balanceNum,
                      ShowUtils.roundHalfDown(rateData.rateNum.toDouble()),
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            size: 15,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      )
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  ItemRow(
                    rightStyle: context.textTheme.bodySmall?.copyWith(color: Colors.black),
                    itemRowData: (
                      "当前价格",
                      ShowUtils.withU(ShowUtils.getPrice(item.coinName)),
                      ShowUtils.toPercent(rateData.rate),
                      null
                    ),
                  ),
                  ItemRow(
                    itemRowData: (
                      "买入价格",
                      ShowUtils.withU(item.buyPrice, isRemove: false),
                      null,
                      null
                    ),
                  ),
                  ItemRow(
                    itemRowData: (
                      "买入总额",
                      ShowUtils.withU(
                          AppUtils.calculateU(item.buyPrice, item.buyNum)),
                      null,
                      null
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap.v(10),
          SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      userAppRouter().push(RoutePath.aiModelPage, extra: item);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorName.themeColor,
                        foregroundColor: Colors.white),
                    child: const Text("Ai Model"),
                  ),
                ),
                const Gap.h(30),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      userAppRouter().push(RoutePath.sellPage, extra: item);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    child: const Text("卖出"),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}

class ItemSellBody extends StatelessWidget {
  final CoinSellModel item;

  const ItemSellBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final buyModel = IsarUtils.getById(item.coinBuyId);
    final leftStyle = context.textTheme.bodySmall
        ?.copyWith(color: Colors.black.withOpacity(0.5));
    final sellU = AppUtils.calculateU(item.sellPrice, item.sellNum);
    final feeU = AppUtils.calculateFee(sellU.toString());
    final feeRate = AppUtils.calculateRate(
        buyModel!.buyPrice, item.sellPrice, item.sellNum);
    return LayoutBuilder(builder: (context, constraints) {
      final width = (Screens.width - 80) / 2;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap.v(20),
          TextIcon(
            icon: const CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                "卖",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
            text: item.sellTime.formatYYYYMMdd(MMDDHHMM),
            textStyle: leftStyle,
          ),
          RoundWidget(
            color: ColorName.themeColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(
                children: [
                  ItemRow(
                    leftStyle: context.textTheme.bodySmall?.copyWith(color: Colors.black),
                    rightStyle: context.textTheme.bodyMedium,
                    itemRowData: (
                      "卖出${buyModel.coinName}",
                      (item.sellNum),
                      "",
                      null
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  ItemRow(
                    itemRowData: (
                      "卖出价格",
                      ShowUtils.withU(item.sellPrice),
                      null,
                      null
                    ),
                  ),
                  ItemRow(
                    itemRowData: ("卖出总额", ShowUtils.withU(sellU), null, null),
                  ),
                  ItemRow(
                    itemRowData: (
                      "手续费",
                      ShowUtils.withU(feeU.feeNum),
                      null,
                      null
                    ),
                  ),
                  ItemRow(
                    itemRowData: (
                      "盈利",
                      ShowUtils.withU(feeRate.rateNum),
                      null,
                      null
                    ),
                  ),
                  ItemRow(
                    itemRowData: (
                      "收益率",
                      ShowUtils.toPercent(feeRate.rate),
                      null,
                      null
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap.v(10),
          SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      userAppRouter().push(RoutePath.aiModelHistoryPage,
                          extra: RequestParamsAiRecord(
                              coinName: buyModel.coinName, id: buyModel.id));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorName.themeColor.withOpacity(0.3),
                        foregroundColor: Colors.white),
                    child: const Text("Ai Model记录"),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}


class ItemRow extends StatelessWidget {
  final (String, String, String?, Widget?) itemRowData;
  final TextStyle? leftStyle,rightStyle;

  const ItemRow({super.key, required this.itemRowData, this.leftStyle,this.rightStyle});

  @override
  Widget build(BuildContext context) {
    final leftStyle2 = leftStyle ??
        context.textTheme.bodySmall
            ?.copyWith(color: Colors.black.withOpacity(0.5));
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
            itemRowData.$1,
            style: leftStyle2,
          )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  itemRowData.$2,
                  style: rightStyle??leftStyle2,
                ),
              )),
          Expanded(
              flex: 2,
              child: itemRowData.$3 != null
                  ? Text(
                      "${itemRowData.$3}",
                      style: leftStyle2?.copyWith(color: Colors.green),
                    )
                  : const SizedBox.shrink()),
          Expanded(
              child: itemRowData.$4 != null
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: itemRowData.$4!,
                    )
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
