import 'package:ai_trade/gen/assets.gen.dart';
import 'package:ai_trade/gen/colors.gen.dart';
import 'package:ai_trade/providers/coin_riverpod.dart';
import 'package:ai_trade/route/app_router.dart';
import 'package:ai_trade/util/app_utils.dart';
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
                delegate: StickyChildDelegate(
                    child: const PreferredSize(
                        preferredSize: Size.fromHeight(80),
                        child: MainHeader()))),
          ];
        },
        body: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: "当前持仓数据"),
                Tab(text: "历史持仓数据"),
              ],
            ),
            Expanded(
              child: AsyncValueWidget(
                ref.watch(buyListProvider),
                asyncValueBuilder: (List<CoinBuyModel?>? items) {
                  final list = (items ?? []).whereNotNull().toList();
                  final sellList = list.expand((e) => e.coinSellItems).toList();
                  return TabBarView(
                    controller: tabController,
                    children: [
                      BuyBodyList(items: list),
                      SellBodyList(
                        items: sellList,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(text: ShowUtils.showLineStr("涨跌幅"), style: style1),
                widgetPadding,
                TextSpan(text: "1%", style: style2)
              ]),
              textAlign: TextAlign.center,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: ShowUtils.showLineStr("总资产"), style: style1),
                widgetPadding,
                TextSpan(text: "1%", style: style2)
              ]),
              textAlign: TextAlign.center,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: ShowUtils.showLineStr("利润"), style: style1),
                widgetPadding,
                TextSpan(text: "200", style: style2)
              ]),
              textAlign: TextAlign.center,
            ),
          ],
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
                    leftStyle: context.textTheme.bodyLarge,
                    itemRowData: (
                      item.coinName,
                      item.buyNum,
                      "100",
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
                    itemRowData: ("当前价格", ShowUtils.withU("4500"), "+ 5.03245%", null),
                  ),
                   ItemRow(
                    itemRowData: ("买入价格", ShowUtils.withU(item.buyPrice), null, null),
                  ),
                   ItemRow(
                    itemRowData: ("买入总额", ShowUtils.withU(AppUtils.calculateU(item.buyPrice,item.buyNum)), null, null),
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
                      userAppRouter().push(RoutePath.aiModelPage,extra: item);
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
                      userAppRouter().push(RoutePath.sellPage,extra: item);
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
    final sellU =  AppUtils.calculateU(item.sellPrice, item.sellNum);
    final feeU =  AppUtils.calculateFee(sellU.toString());
    final feeRate = AppUtils.calculateRate(buyModel!.buyPrice,item.sellPrice,item.sellNum);
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
                    leftStyle: context.textTheme.bodyLarge,
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
                    itemRowData: ("卖出价格", ShowUtils.withU(item.sellPrice), null, null),
                  ),
                   ItemRow(
                    itemRowData: ("卖出总额", ShowUtils.withU(sellU), null, null),
                  ),
                  ItemRow(
                    itemRowData: ("手续费", ShowUtils.withU(feeU.feeNum), null, null),
                  ),
                  ItemRow(
                    itemRowData: ("盈利", ShowUtils.withU(feeRate.rateNum), null, null),
                  ),
                  ItemRow(
                    itemRowData: ("收益率", ShowUtils.toPercent(feeRate.rate), null, null),
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
                      userAppRouter().push(RoutePath.aiModelHistoryPage,extra: buyModel.coinName);
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
  final TextStyle? leftStyle;

  const ItemRow({super.key, required this.itemRowData, this.leftStyle});

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
              child: Text(
            itemRowData.$1,
            style: leftStyle2,
          )),
          Expanded(
              child: Text(
            itemRowData.$2,
            style: leftStyle2,
          )),
          Expanded(
              child: itemRowData.$3 != null
                  ? Text(
                      "${itemRowData.$3}",
                      style: leftStyle2?.copyWith(color: Colors.green),
                    )
                  : const SizedBox.shrink()),
          Expanded(
              child: itemRowData.$4 != null
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: itemRowData.$4!,
                    )
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
