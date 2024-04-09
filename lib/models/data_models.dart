import 'package:ai_trade/exports.dart';
import 'package:ai_trade/util/app_utils.dart';

class ObjList {
  ObjList({
    required this.total,
    required this.list,
  });

  factory ObjList.fromJson(Map json) {
    final list = json['list'];
    return ObjList(
      total: json['total'],
      list: list,
    );
  }

  final int total;
  final List list;

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'list': list,
    };
  }

  ObjList copyWith({
    int? total,
    List? list,
  }) {
    return ObjList(
      total: total ?? this.total,
      list: list ?? this.list,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjList &&
          runtimeType == other.runtimeType &&
          total == other.total &&
          const DeepCollectionEquality().equals(list, other.list);

  @override
  int get hashCode => Object.hashAll([
        total,
        const DeepCollectionEquality().hash(list),
      ]);
}



class CoinPriceModel{
  final double u;
  final String S;
  CoinPriceModel({
    required this.u,
    required this.S,
  });

  factory CoinPriceModel.fromJson(Map json) {
    return CoinPriceModel(
      u: json['u'],
      S: json['S'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'u': u,
      'S': S,
    };
  }
}


// class CoinPriceModel{
//   final String slug;
//   final String symbol;
//   final String? fullname;
//   CoinPriceModel({
//     required this.slug,
//     required this.symbol,
//     this.fullname,
//   });
//
//   factory CoinPriceModel.fromJson(Map json) {
//     return CoinPriceModel(
//       slug: json['slug'],
//       symbol: json['symbol'],
//       fullname: json['fullname'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'slug': slug,
//       'symbol': symbol,
//       'fullname': fullname,
//     };
//   }
// }
