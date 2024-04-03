import 'package:ai_trade/exports.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ai_trade/models/coin_model.dart';

part 'coin_riverpod.g.dart';

@riverpod
Future<List<CoinBuyModel>?> buyList(BuyListRef ref) async {
  final items = await IsarUtils.findAll();
  return items.whereNotNull().toList();
}

@riverpod
Future<List<CoinSellAiModel>?> aiModelList(AiModelListRef ref,String coinName) async {
  final items = await IsarUtils.findAll2(coinName);
  return items.whereNotNull().toList();
}
