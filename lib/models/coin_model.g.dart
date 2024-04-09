// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCoinBuyModelCollection on Isar {
  IsarCollection<int, CoinBuyModel> get coinBuyModels => this.collection();
}

const CoinBuyModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CoinBuyModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'coinName',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'buyPrice',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'buyNum',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'balanceNum',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'buyTime',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'coinSellItems',
        type: IsarType.objectList,
        target: 'CoinSellModel',
      ),
      IsarPropertySchema(
        name: 'sellAiModels',
        type: IsarType.objectList,
        target: 'CoinSellAiModel',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, CoinBuyModel>(
    serialize: serializeCoinBuyModel,
    deserialize: deserializeCoinBuyModel,
    deserializeProperty: deserializeCoinBuyModelProp,
  ),
  embeddedSchemas: [CoinSellModelSchema, CoinSellAiModelSchema],
);

@isarProtected
int serializeCoinBuyModel(IsarWriter writer, CoinBuyModel object) {
  IsarCore.writeString(writer, 1, object.coinName);
  IsarCore.writeString(writer, 2, object.buyPrice);
  IsarCore.writeString(writer, 3, object.buyNum);
  IsarCore.writeString(writer, 4, object.balanceNum);
  IsarCore.writeLong(writer, 5, object.buyTime.toUtc().microsecondsSinceEpoch);
  {
    final list = object.coinSellItems;
    final listWriter = IsarCore.beginList(writer, 6, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeCoinSellModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.sellAiModels;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeCoinSellAiModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
CoinBuyModel deserializeCoinBuyModel(IsarReader reader) {
  final object = CoinBuyModel();
  object.id = IsarCore.readId(reader);
  object.coinName = IsarCore.readString(reader, 1) ?? '';
  object.buyPrice = IsarCore.readString(reader, 2) ?? '';
  object.buyNum = IsarCore.readString(reader, 3) ?? '';
  object.balanceNum = IsarCore.readString(reader, 4) ?? '';
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      object.buyTime =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.buyTime =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  {
    final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.coinSellItems = const <CoinSellModel>[];
      } else {
        final list =
            List<CoinSellModel>.filled(length, CoinSellModel(), growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = CoinSellModel();
            } else {
              final embedded = deserializeCoinSellModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        object.coinSellItems = list;
      }
    }
  }
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.sellAiModels = const <CoinSellAiModel>[];
      } else {
        final list = List<CoinSellAiModel>.filled(length, CoinSellAiModel(),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = CoinSellAiModel();
            } else {
              final embedded = deserializeCoinSellAiModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        object.sellAiModels = list;
      }
    }
  }
  return object;
}

@isarProtected
dynamic deserializeCoinBuyModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      return IsarCore.readString(reader, 4) ?? '';
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 6:
      {
        final length = IsarCore.readList(reader, 6, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <CoinSellModel>[];
          } else {
            final list = List<CoinSellModel>.filled(length, CoinSellModel(),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = CoinSellModel();
                } else {
                  final embedded = deserializeCoinSellModel(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 7:
      {
        final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <CoinSellAiModel>[];
          } else {
            final list = List<CoinSellAiModel>.filled(length, CoinSellAiModel(),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = CoinSellAiModel();
                } else {
                  final embedded = deserializeCoinSellAiModel(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CoinBuyModelUpdate {
  bool call({
    required int id,
    String? coinName,
    String? buyPrice,
    String? buyNum,
    String? balanceNum,
    DateTime? buyTime,
  });
}

class _CoinBuyModelUpdateImpl implements _CoinBuyModelUpdate {
  const _CoinBuyModelUpdateImpl(this.collection);

  final IsarCollection<int, CoinBuyModel> collection;

  @override
  bool call({
    required int id,
    Object? coinName = ignore,
    Object? buyPrice = ignore,
    Object? buyNum = ignore,
    Object? balanceNum = ignore,
    Object? buyTime = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (coinName != ignore) 1: coinName as String?,
          if (buyPrice != ignore) 2: buyPrice as String?,
          if (buyNum != ignore) 3: buyNum as String?,
          if (balanceNum != ignore) 4: balanceNum as String?,
          if (buyTime != ignore) 5: buyTime as DateTime?,
        }) >
        0;
  }
}

sealed class _CoinBuyModelUpdateAll {
  int call({
    required List<int> id,
    String? coinName,
    String? buyPrice,
    String? buyNum,
    String? balanceNum,
    DateTime? buyTime,
  });
}

class _CoinBuyModelUpdateAllImpl implements _CoinBuyModelUpdateAll {
  const _CoinBuyModelUpdateAllImpl(this.collection);

  final IsarCollection<int, CoinBuyModel> collection;

  @override
  int call({
    required List<int> id,
    Object? coinName = ignore,
    Object? buyPrice = ignore,
    Object? buyNum = ignore,
    Object? balanceNum = ignore,
    Object? buyTime = ignore,
  }) {
    return collection.updateProperties(id, {
      if (coinName != ignore) 1: coinName as String?,
      if (buyPrice != ignore) 2: buyPrice as String?,
      if (buyNum != ignore) 3: buyNum as String?,
      if (balanceNum != ignore) 4: balanceNum as String?,
      if (buyTime != ignore) 5: buyTime as DateTime?,
    });
  }
}

extension CoinBuyModelUpdate on IsarCollection<int, CoinBuyModel> {
  _CoinBuyModelUpdate get update => _CoinBuyModelUpdateImpl(this);

  _CoinBuyModelUpdateAll get updateAll => _CoinBuyModelUpdateAllImpl(this);
}

sealed class _CoinBuyModelQueryUpdate {
  int call({
    String? coinName,
    String? buyPrice,
    String? buyNum,
    String? balanceNum,
    DateTime? buyTime,
  });
}

class _CoinBuyModelQueryUpdateImpl implements _CoinBuyModelQueryUpdate {
  const _CoinBuyModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CoinBuyModel> query;
  final int? limit;

  @override
  int call({
    Object? coinName = ignore,
    Object? buyPrice = ignore,
    Object? buyNum = ignore,
    Object? balanceNum = ignore,
    Object? buyTime = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (coinName != ignore) 1: coinName as String?,
      if (buyPrice != ignore) 2: buyPrice as String?,
      if (buyNum != ignore) 3: buyNum as String?,
      if (balanceNum != ignore) 4: balanceNum as String?,
      if (buyTime != ignore) 5: buyTime as DateTime?,
    });
  }
}

extension CoinBuyModelQueryUpdate on IsarQuery<CoinBuyModel> {
  _CoinBuyModelQueryUpdate get updateFirst =>
      _CoinBuyModelQueryUpdateImpl(this, limit: 1);

  _CoinBuyModelQueryUpdate get updateAll => _CoinBuyModelQueryUpdateImpl(this);
}

class _CoinBuyModelQueryBuilderUpdateImpl implements _CoinBuyModelQueryUpdate {
  const _CoinBuyModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<CoinBuyModel, CoinBuyModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? coinName = ignore,
    Object? buyPrice = ignore,
    Object? buyNum = ignore,
    Object? balanceNum = ignore,
    Object? buyTime = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (coinName != ignore) 1: coinName as String?,
        if (buyPrice != ignore) 2: buyPrice as String?,
        if (buyNum != ignore) 3: buyNum as String?,
        if (balanceNum != ignore) 4: balanceNum as String?,
        if (buyTime != ignore) 5: buyTime as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension CoinBuyModelQueryBuilderUpdate
    on QueryBuilder<CoinBuyModel, CoinBuyModel, QOperations> {
  _CoinBuyModelQueryUpdate get updateFirst =>
      _CoinBuyModelQueryBuilderUpdateImpl(this, limit: 1);

  _CoinBuyModelQueryUpdate get updateAll =>
      _CoinBuyModelQueryBuilderUpdateImpl(this);
}

extension CoinBuyModelQueryFilter
    on QueryBuilder<CoinBuyModel, CoinBuyModel, QFilterCondition> {
  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition> buyNumEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition> buyNumBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition> buyNumMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyNumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      balanceNumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyTimeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyTimeGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyTimeGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyTimeLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyTimeLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      buyTimeBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinSellItemsIsEmpty() {
    return not().coinSellItemsIsNotEmpty();
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      coinSellItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 6, value: null),
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      sellAiModelsIsEmpty() {
    return not().sellAiModelsIsNotEmpty();
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterFilterCondition>
      sellAiModelsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }
}

extension CoinBuyModelQueryObject
    on QueryBuilder<CoinBuyModel, CoinBuyModel, QFilterCondition> {}

extension CoinBuyModelQuerySortBy
    on QueryBuilder<CoinBuyModel, CoinBuyModel, QSortBy> {
  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByCoinNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBuyPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBuyPriceDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBuyNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBuyNumDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBalanceNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBalanceNumDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBuyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> sortByBuyTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension CoinBuyModelQuerySortThenBy
    on QueryBuilder<CoinBuyModel, CoinBuyModel, QSortThenBy> {
  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByCoinNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBuyPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBuyPriceDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBuyNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBuyNumDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBalanceNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBalanceNumDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBuyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterSortBy> thenByBuyTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension CoinBuyModelQueryWhereDistinct
    on QueryBuilder<CoinBuyModel, CoinBuyModel, QDistinct> {
  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterDistinct> distinctByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterDistinct> distinctByBuyPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterDistinct> distinctByBuyNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterDistinct> distinctByBalanceNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinBuyModel, CoinBuyModel, QAfterDistinct> distinctByBuyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }
}

extension CoinBuyModelQueryProperty1
    on QueryBuilder<CoinBuyModel, CoinBuyModel, QProperty> {
  QueryBuilder<CoinBuyModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinBuyModel, String, QAfterProperty> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinBuyModel, String, QAfterProperty> buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinBuyModel, String, QAfterProperty> buyNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CoinBuyModel, String, QAfterProperty> balanceNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CoinBuyModel, DateTime, QAfterProperty> buyTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CoinBuyModel, List<CoinSellModel>, QAfterProperty>
      coinSellItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<CoinBuyModel, List<CoinSellAiModel>, QAfterProperty>
      sellAiModelsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension CoinBuyModelQueryProperty2<R>
    on QueryBuilder<CoinBuyModel, R, QAfterProperty> {
  QueryBuilder<CoinBuyModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinBuyModel, (R, String), QAfterProperty> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinBuyModel, (R, String), QAfterProperty> buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinBuyModel, (R, String), QAfterProperty> buyNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CoinBuyModel, (R, String), QAfterProperty> balanceNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CoinBuyModel, (R, DateTime), QAfterProperty> buyTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CoinBuyModel, (R, List<CoinSellModel>), QAfterProperty>
      coinSellItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<CoinBuyModel, (R, List<CoinSellAiModel>), QAfterProperty>
      sellAiModelsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension CoinBuyModelQueryProperty3<R1, R2>
    on QueryBuilder<CoinBuyModel, (R1, R2), QAfterProperty> {
  QueryBuilder<CoinBuyModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinBuyModel, (R1, R2, String), QOperations> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinBuyModel, (R1, R2, String), QOperations> buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinBuyModel, (R1, R2, String), QOperations> buyNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CoinBuyModel, (R1, R2, String), QOperations>
      balanceNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CoinBuyModel, (R1, R2, DateTime), QOperations>
      buyTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CoinBuyModel, (R1, R2, List<CoinSellModel>), QOperations>
      coinSellItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<CoinBuyModel, (R1, R2, List<CoinSellAiModel>), QOperations>
      sellAiModelsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCoinInfoModelCollection on Isar {
  IsarCollection<int, CoinInfoModel> get coinInfoModels => this.collection();
}

const CoinInfoModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CoinInfoModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'slug',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'symbol',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'fullname',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, CoinInfoModel>(
    serialize: serializeCoinInfoModel,
    deserialize: deserializeCoinInfoModel,
    deserializeProperty: deserializeCoinInfoModelProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeCoinInfoModel(IsarWriter writer, CoinInfoModel object) {
  IsarCore.writeString(writer, 1, object.slug);
  IsarCore.writeString(writer, 2, object.symbol);
  {
    final value = object.fullname;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  return object.id;
}

@isarProtected
CoinInfoModel deserializeCoinInfoModel(IsarReader reader) {
  final object = CoinInfoModel();
  object.id = IsarCore.readId(reader);
  object.slug = IsarCore.readString(reader, 1) ?? '';
  object.symbol = IsarCore.readString(reader, 2) ?? '';
  object.fullname = IsarCore.readString(reader, 3);
  return object;
}

@isarProtected
dynamic deserializeCoinInfoModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readString(reader, 3);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CoinInfoModelUpdate {
  bool call({
    required int id,
    String? slug,
    String? symbol,
    String? fullname,
  });
}

class _CoinInfoModelUpdateImpl implements _CoinInfoModelUpdate {
  const _CoinInfoModelUpdateImpl(this.collection);

  final IsarCollection<int, CoinInfoModel> collection;

  @override
  bool call({
    required int id,
    Object? slug = ignore,
    Object? symbol = ignore,
    Object? fullname = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (slug != ignore) 1: slug as String?,
          if (symbol != ignore) 2: symbol as String?,
          if (fullname != ignore) 3: fullname as String?,
        }) >
        0;
  }
}

sealed class _CoinInfoModelUpdateAll {
  int call({
    required List<int> id,
    String? slug,
    String? symbol,
    String? fullname,
  });
}

class _CoinInfoModelUpdateAllImpl implements _CoinInfoModelUpdateAll {
  const _CoinInfoModelUpdateAllImpl(this.collection);

  final IsarCollection<int, CoinInfoModel> collection;

  @override
  int call({
    required List<int> id,
    Object? slug = ignore,
    Object? symbol = ignore,
    Object? fullname = ignore,
  }) {
    return collection.updateProperties(id, {
      if (slug != ignore) 1: slug as String?,
      if (symbol != ignore) 2: symbol as String?,
      if (fullname != ignore) 3: fullname as String?,
    });
  }
}

extension CoinInfoModelUpdate on IsarCollection<int, CoinInfoModel> {
  _CoinInfoModelUpdate get update => _CoinInfoModelUpdateImpl(this);

  _CoinInfoModelUpdateAll get updateAll => _CoinInfoModelUpdateAllImpl(this);
}

sealed class _CoinInfoModelQueryUpdate {
  int call({
    String? slug,
    String? symbol,
    String? fullname,
  });
}

class _CoinInfoModelQueryUpdateImpl implements _CoinInfoModelQueryUpdate {
  const _CoinInfoModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CoinInfoModel> query;
  final int? limit;

  @override
  int call({
    Object? slug = ignore,
    Object? symbol = ignore,
    Object? fullname = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (slug != ignore) 1: slug as String?,
      if (symbol != ignore) 2: symbol as String?,
      if (fullname != ignore) 3: fullname as String?,
    });
  }
}

extension CoinInfoModelQueryUpdate on IsarQuery<CoinInfoModel> {
  _CoinInfoModelQueryUpdate get updateFirst =>
      _CoinInfoModelQueryUpdateImpl(this, limit: 1);

  _CoinInfoModelQueryUpdate get updateAll =>
      _CoinInfoModelQueryUpdateImpl(this);
}

class _CoinInfoModelQueryBuilderUpdateImpl
    implements _CoinInfoModelQueryUpdate {
  const _CoinInfoModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<CoinInfoModel, CoinInfoModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? slug = ignore,
    Object? symbol = ignore,
    Object? fullname = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (slug != ignore) 1: slug as String?,
        if (symbol != ignore) 2: symbol as String?,
        if (fullname != ignore) 3: fullname as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension CoinInfoModelQueryBuilderUpdate
    on QueryBuilder<CoinInfoModel, CoinInfoModel, QOperations> {
  _CoinInfoModelQueryUpdate get updateFirst =>
      _CoinInfoModelQueryBuilderUpdateImpl(this, limit: 1);

  _CoinInfoModelQueryUpdate get updateAll =>
      _CoinInfoModelQueryBuilderUpdateImpl(this);
}

extension CoinInfoModelQueryFilter
    on QueryBuilder<CoinInfoModel, CoinInfoModel, QFilterCondition> {
  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition> slugEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition> slugBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition> slugMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      slugIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterFilterCondition>
      fullnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension CoinInfoModelQueryObject
    on QueryBuilder<CoinInfoModel, CoinInfoModel, QFilterCondition> {}

extension CoinInfoModelQuerySortBy
    on QueryBuilder<CoinInfoModel, CoinInfoModel, QSortBy> {
  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortBySlug(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortBySlugDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortBySymbolDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortByFullname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> sortByFullnameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension CoinInfoModelQuerySortThenBy
    on QueryBuilder<CoinInfoModel, CoinInfoModel, QSortThenBy> {
  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenBySlug(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenBySlugDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenBySymbolDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenByFullname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterSortBy> thenByFullnameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension CoinInfoModelQueryWhereDistinct
    on QueryBuilder<CoinInfoModel, CoinInfoModel, QDistinct> {
  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterDistinct> distinctBySlug(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinInfoModel, CoinInfoModel, QAfterDistinct> distinctByFullname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }
}

extension CoinInfoModelQueryProperty1
    on QueryBuilder<CoinInfoModel, CoinInfoModel, QProperty> {
  QueryBuilder<CoinInfoModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinInfoModel, String, QAfterProperty> slugProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinInfoModel, String, QAfterProperty> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinInfoModel, String?, QAfterProperty> fullnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CoinInfoModelQueryProperty2<R>
    on QueryBuilder<CoinInfoModel, R, QAfterProperty> {
  QueryBuilder<CoinInfoModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinInfoModel, (R, String), QAfterProperty> slugProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinInfoModel, (R, String), QAfterProperty> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinInfoModel, (R, String?), QAfterProperty> fullnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CoinInfoModelQueryProperty3<R1, R2>
    on QueryBuilder<CoinInfoModel, (R1, R2), QAfterProperty> {
  QueryBuilder<CoinInfoModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinInfoModel, (R1, R2, String), QOperations> slugProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinInfoModel, (R1, R2, String), QOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinInfoModel, (R1, R2, String?), QOperations>
      fullnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetInputCostModelCollection on Isar {
  IsarCollection<int, InputCostModel> get inputCostModels => this.collection();
}

const InputCostModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'InputCostModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'total',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'time',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, InputCostModel>(
    serialize: serializeInputCostModel,
    deserialize: deserializeInputCostModel,
    deserializeProperty: deserializeInputCostModelProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeInputCostModel(IsarWriter writer, InputCostModel object) {
  IsarCore.writeString(writer, 1, object.total);
  IsarCore.writeLong(writer, 2, object.time.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
InputCostModel deserializeInputCostModel(IsarReader reader) {
  final object = InputCostModel();
  object.id = IsarCore.readId(reader);
  object.total = IsarCore.readString(reader, 1) ?? '';
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      object.time =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.time =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  return object;
}

@isarProtected
dynamic deserializeInputCostModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _InputCostModelUpdate {
  bool call({
    required int id,
    String? total,
    DateTime? time,
  });
}

class _InputCostModelUpdateImpl implements _InputCostModelUpdate {
  const _InputCostModelUpdateImpl(this.collection);

  final IsarCollection<int, InputCostModel> collection;

  @override
  bool call({
    required int id,
    Object? total = ignore,
    Object? time = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (total != ignore) 1: total as String?,
          if (time != ignore) 2: time as DateTime?,
        }) >
        0;
  }
}

sealed class _InputCostModelUpdateAll {
  int call({
    required List<int> id,
    String? total,
    DateTime? time,
  });
}

class _InputCostModelUpdateAllImpl implements _InputCostModelUpdateAll {
  const _InputCostModelUpdateAllImpl(this.collection);

  final IsarCollection<int, InputCostModel> collection;

  @override
  int call({
    required List<int> id,
    Object? total = ignore,
    Object? time = ignore,
  }) {
    return collection.updateProperties(id, {
      if (total != ignore) 1: total as String?,
      if (time != ignore) 2: time as DateTime?,
    });
  }
}

extension InputCostModelUpdate on IsarCollection<int, InputCostModel> {
  _InputCostModelUpdate get update => _InputCostModelUpdateImpl(this);

  _InputCostModelUpdateAll get updateAll => _InputCostModelUpdateAllImpl(this);
}

sealed class _InputCostModelQueryUpdate {
  int call({
    String? total,
    DateTime? time,
  });
}

class _InputCostModelQueryUpdateImpl implements _InputCostModelQueryUpdate {
  const _InputCostModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<InputCostModel> query;
  final int? limit;

  @override
  int call({
    Object? total = ignore,
    Object? time = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (total != ignore) 1: total as String?,
      if (time != ignore) 2: time as DateTime?,
    });
  }
}

extension InputCostModelQueryUpdate on IsarQuery<InputCostModel> {
  _InputCostModelQueryUpdate get updateFirst =>
      _InputCostModelQueryUpdateImpl(this, limit: 1);

  _InputCostModelQueryUpdate get updateAll =>
      _InputCostModelQueryUpdateImpl(this);
}

class _InputCostModelQueryBuilderUpdateImpl
    implements _InputCostModelQueryUpdate {
  const _InputCostModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<InputCostModel, InputCostModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? total = ignore,
    Object? time = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (total != ignore) 1: total as String?,
        if (time != ignore) 2: time as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension InputCostModelQueryBuilderUpdate
    on QueryBuilder<InputCostModel, InputCostModel, QOperations> {
  _InputCostModelQueryUpdate get updateFirst =>
      _InputCostModelQueryBuilderUpdateImpl(this, limit: 1);

  _InputCostModelQueryUpdate get updateAll =>
      _InputCostModelQueryBuilderUpdateImpl(this);
}

extension InputCostModelQueryFilter
    on QueryBuilder<InputCostModel, InputCostModel, QFilterCondition> {
  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      totalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      timeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      timeGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      timeGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      timeLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      timeLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterFilterCondition>
      timeBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension InputCostModelQueryObject
    on QueryBuilder<InputCostModel, InputCostModel, QFilterCondition> {}

extension InputCostModelQuerySortBy
    on QueryBuilder<InputCostModel, InputCostModel, QSortBy> {
  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> sortByTotal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> sortByTotalDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension InputCostModelQuerySortThenBy
    on QueryBuilder<InputCostModel, InputCostModel, QSortThenBy> {
  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> thenByTotal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> thenByTotalDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension InputCostModelQueryWhereDistinct
    on QueryBuilder<InputCostModel, InputCostModel, QDistinct> {
  QueryBuilder<InputCostModel, InputCostModel, QAfterDistinct> distinctByTotal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InputCostModel, InputCostModel, QAfterDistinct>
      distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }
}

extension InputCostModelQueryProperty1
    on QueryBuilder<InputCostModel, InputCostModel, QProperty> {
  QueryBuilder<InputCostModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<InputCostModel, String, QAfterProperty> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<InputCostModel, DateTime, QAfterProperty> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension InputCostModelQueryProperty2<R>
    on QueryBuilder<InputCostModel, R, QAfterProperty> {
  QueryBuilder<InputCostModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<InputCostModel, (R, String), QAfterProperty> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<InputCostModel, (R, DateTime), QAfterProperty> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension InputCostModelQueryProperty3<R1, R2>
    on QueryBuilder<InputCostModel, (R1, R2), QAfterProperty> {
  QueryBuilder<InputCostModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<InputCostModel, (R1, R2, String), QOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<InputCostModel, (R1, R2, DateTime), QOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const CoinSellModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CoinSellModel',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'coinBuyId',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'sellPrice',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'sellNum',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'sellTime',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, CoinSellModel>(
    serialize: serializeCoinSellModel,
    deserialize: deserializeCoinSellModel,
  ),
);

@isarProtected
int serializeCoinSellModel(IsarWriter writer, CoinSellModel object) {
  IsarCore.writeLong(writer, 1, object.coinBuyId);
  IsarCore.writeString(writer, 2, object.sellPrice);
  IsarCore.writeString(writer, 3, object.sellNum);
  IsarCore.writeLong(writer, 4, object.sellTime.toUtc().microsecondsSinceEpoch);
  return 0;
}

@isarProtected
CoinSellModel deserializeCoinSellModel(IsarReader reader) {
  final object = CoinSellModel();
  object.coinBuyId = IsarCore.readLong(reader, 1);
  object.sellPrice = IsarCore.readString(reader, 2) ?? '';
  object.sellNum = IsarCore.readString(reader, 3) ?? '';
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      object.sellTime =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.sellTime =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  return object;
}

extension CoinSellModelQueryFilter
    on QueryBuilder<CoinSellModel, CoinSellModel, QFilterCondition> {
  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      coinBuyIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      coinBuyIdGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      coinBuyIdGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      coinBuyIdLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      coinBuyIdLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      coinBuyIdBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellNumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellTimeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellTimeGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellTimeGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellTimeLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellTimeLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellModel, CoinSellModel, QAfterFilterCondition>
      sellTimeBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension CoinSellModelQueryObject
    on QueryBuilder<CoinSellModel, CoinSellModel, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

const CoinSellAiModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CoinSellAiModel',
    embedded: true,
    properties: [
      IsarPropertySchema(
        name: 'coinBuyId',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'coinName',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'sellPrice',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'sellNum',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'increasePrice',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'buyPrice',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<void, CoinSellAiModel>(
    serialize: serializeCoinSellAiModel,
    deserialize: deserializeCoinSellAiModel,
  ),
);

@isarProtected
int serializeCoinSellAiModel(IsarWriter writer, CoinSellAiModel object) {
  IsarCore.writeLong(writer, 1, object.coinBuyId);
  IsarCore.writeString(writer, 2, object.coinName);
  IsarCore.writeString(writer, 3, object.sellPrice);
  IsarCore.writeString(writer, 4, object.sellNum);
  IsarCore.writeString(writer, 5, object.increasePrice);
  IsarCore.writeString(writer, 6, object.buyPrice);
  return 0;
}

@isarProtected
CoinSellAiModel deserializeCoinSellAiModel(IsarReader reader) {
  final object = CoinSellAiModel();
  object.coinBuyId = IsarCore.readLong(reader, 1);
  object.coinName = IsarCore.readString(reader, 2) ?? '';
  object.sellPrice = IsarCore.readString(reader, 3) ?? '';
  object.sellNum = IsarCore.readString(reader, 4) ?? '';
  object.increasePrice = IsarCore.readString(reader, 5) ?? '';
  object.buyPrice = IsarCore.readString(reader, 6) ?? '';
  return object;
}

extension CoinSellAiModelQueryFilter
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QFilterCondition> {
  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinBuyIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinBuyIdGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinBuyIdGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinBuyIdLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinBuyIdLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinBuyIdBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      coinNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      sellNumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      buyPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }
}

extension CoinSellAiModelQueryObject
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QFilterCondition> {}
