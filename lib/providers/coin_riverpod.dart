import 'package:ai_trade/exports.dart';
import 'package:ai_trade/local/constants.dart';
import 'package:ai_trade/remote/app_data_source.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:decimal/decimal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ai_trade/models/coin_model.dart';

import 'export_providers.dart';

part 'coin_riverpod.g.dart';

@riverpod
Future<List<CoinBuyModel>?> buyList(BuyListRef ref) async {
  final items = await IsarUtils.findAll();
  final itemsNotNull = items.whereNotNull().toList();
  final datas = ref.read(coinTypeProvider);
  final newSet = <String>{};
  for (var value in itemsNotNull) {
    newSet.add(value.coinName);
  }
  final difference = newSet.difference(datas);
  if (difference.isNotEmpty&&newSet.isNotEmpty) {
    final coinInfoModels = await IsarUtils.findCoinInfoModel(newSet.toList());
    final slugs = coinInfoModels.map((e) => e.slug).join(",");
    final response = await ref.read(appDataSourceProvider).priceS(
        {"slug": slugs, "api_key": "MGUOKLN13X8C3ZBHWLGE1YMGUNERSWRDEGNNMHSW"},
        null);
    for (var value in response) {
      ShowUtils.setPrice(value.S, value.u);
    }
  }
  return itemsNotNull.reversed.toList();
}

@riverpod
Future<List<CoinSellAiModel>?> aiModelList(AiModelListRef ref, int id) async {
  final items = await IsarUtils.findAll2(id);
  return items?.sellAiModels;
}
@riverpod
Future<List<InputCostModel>> findInputCostModel(FindInputCostModelRef ref) async {
  final items = await IsarUtils.findInputCostModel();
  return items;
}

@riverpod
Future<double> inputConstTotal(InputConstTotalRef ref) async {
  final items =  await ref.watch(findInputCostModelProvider.future);
  return items.fold(Decimal.zero, (previousValue, element) => previousValue+d(element.total)).toDouble();
}

