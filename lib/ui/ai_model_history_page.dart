import 'package:ai_trade/exports.dart';
import 'package:ai_trade/models/export_models.dart';
import 'package:ai_trade/providers/coin_riverpod.dart';
import 'package:ai_trade/util/extension/simple_extension.dart';
import 'package:ai_trade/widgets/asyncvalue_widget.dart';
import 'package:flutter/material.dart';

import 'ai_model_page.dart';

class AiModelHistoryPage extends HookConsumerWidget {
  final RequestParamsAiRecord params;
  const AiModelHistoryPage({required this.params, super.key});

  @override
  Widget build(BuildContext context,ref) {
    final tabC = useTabController(initialLength: 5);
    final tabs = useRef(List.generate(5, (index) => "M${index+1}"));
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
      appBar: AppBar(
        title:  Text('Ai Model(${params.coinName})记录'),
        bottom: TabBar(
          controller: tabC,
          tabs: tabs.value.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      body: Column(
        children: [
          Gap.v(10),
          Row(
            children: titles.value.map((e) => Expanded(child: Center(child: Text(e,style: context.textTheme.bodySmall,)))).toList(),
          ),
          Gap.v(10),
          Expanded(child: AsyncValueWidget(ref.watch(aiModelListProvider(params.id)),asyncValueBuilder: (data) {
            final list = data??[];
            final size = list.length;
            final newList = List.generate(5, (index) => index<size?list[index]:null);
              return TabBarView(
                  controller: tabC,
                  physics: NeverScrollableScrollPhysics(),
                  children: newList.map((e) => AiModelHistoryPageItem(item: e)).toList());
          },))
        ],
      ),
    );
  }
}



class AiModelHistoryPageItem extends HookWidget {
  final CoinSellAiModel? item;
  const AiModelHistoryPageItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    if(item==null){
      return const Center(child: Text("暂无数据"),);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(20, (index) => ItemAiModelPage(item: item!,index: index,)),
        ),
      ),
    );
  }
}




