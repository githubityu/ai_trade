import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';

part 'coin_model.g.dart';

@collection
class CoinBuyModel {
  @Id()
  late int id;
  late String coinName;
  late String buyPrice;
  @Ignore()
  String? nowPrice;
  late String buyNum;
  late String balanceNum;
  late DateTime buyTime;
  late List<CoinSellModel> coinSellItems;
  late List<CoinSellAiModel> sellAiModels;
}
@collection
class CoinInfoModel {
  @Id()
  late int id;
  late String slug;
  late String symbol;
  late String? fullname;
}

@collection
class  InputCostModel{
  @Id()
  late int id;
  late String total;
  late DateTime time;
}

@embedded
class CoinSellModel {
  late int coinBuyId;
  late String sellPrice;
  late String sellNum;
  late DateTime sellTime;
}

@embedded
class CoinSellAiModel {
  late int coinBuyId;
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


class PriceData{
  Decimal totalPrice,inCome;
  Decimal? inComeRate;
  PriceData({required this.totalPrice,required this.inCome,this.inComeRate});
}
