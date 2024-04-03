import 'package:isar/isar.dart';

part 'coin_model.g.dart';

@collection
class CoinBuyModel {
  @Id()
  late int id;
  late String coinName;
  late String buyPrice;
  late String buyNum;
  late String balanceNum;
  late DateTime buyTime;
  late List<CoinSellModel> coinSellItems;
}

@embedded
class CoinSellModel {
  late int coinBuyId;
  late String sellPrice;
  late String sellNum;
  late DateTime sellTime;
}

@collection
class CoinSellAiModel {
  @Id()
  late int id;
  late String coinName;
  late String sellPrice;
  late String sellNum;
  late String increasePrice;
  late String buyPrice;
}

class CoinBuyOrSell {
  final bool isBuy;
  final CoinBuyModel? coinBuyModel;
  final CoinSellModel? coinSellModel;
  DateTime get time {
    return isBuy ? coinBuyModel!.buyTime : coinSellModel!.sellTime;
  }
  CoinBuyOrSell({required this.isBuy, this.coinBuyModel, this.coinSellModel});
}
