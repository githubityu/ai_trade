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

