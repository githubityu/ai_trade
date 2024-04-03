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
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, CoinBuyModel>(
    serialize: serializeCoinBuyModel,
    deserialize: deserializeCoinBuyModel,
    deserializeProperty: deserializeCoinBuyModelProp,
  ),
  embeddedSchemas: [CoinSellModelSchema],
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
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCoinSellAiModelCollection on Isar {
  IsarCollection<int, CoinSellAiModel> get coinSellAiModels =>
      this.collection();
}

const CoinSellAiModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CoinSellAiModel',
    idName: 'id',
    embedded: false,
    properties: [
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
  converter: IsarObjectConverter<int, CoinSellAiModel>(
    serialize: serializeCoinSellAiModel,
    deserialize: deserializeCoinSellAiModel,
    deserializeProperty: deserializeCoinSellAiModelProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeCoinSellAiModel(IsarWriter writer, CoinSellAiModel object) {
  IsarCore.writeString(writer, 1, object.coinName);
  IsarCore.writeString(writer, 2, object.sellPrice);
  IsarCore.writeString(writer, 3, object.sellNum);
  IsarCore.writeString(writer, 4, object.increasePrice);
  IsarCore.writeString(writer, 5, object.buyPrice);
  return object.id;
}

@isarProtected
CoinSellAiModel deserializeCoinSellAiModel(IsarReader reader) {
  final object = CoinSellAiModel();
  object.id = IsarCore.readId(reader);
  object.coinName = IsarCore.readString(reader, 1) ?? '';
  object.sellPrice = IsarCore.readString(reader, 2) ?? '';
  object.sellNum = IsarCore.readString(reader, 3) ?? '';
  object.increasePrice = IsarCore.readString(reader, 4) ?? '';
  object.buyPrice = IsarCore.readString(reader, 5) ?? '';
  return object;
}

@isarProtected
dynamic deserializeCoinSellAiModelProp(IsarReader reader, int property) {
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
      return IsarCore.readString(reader, 5) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CoinSellAiModelUpdate {
  bool call({
    required int id,
    String? coinName,
    String? sellPrice,
    String? sellNum,
    String? increasePrice,
    String? buyPrice,
  });
}

class _CoinSellAiModelUpdateImpl implements _CoinSellAiModelUpdate {
  const _CoinSellAiModelUpdateImpl(this.collection);

  final IsarCollection<int, CoinSellAiModel> collection;

  @override
  bool call({
    required int id,
    Object? coinName = ignore,
    Object? sellPrice = ignore,
    Object? sellNum = ignore,
    Object? increasePrice = ignore,
    Object? buyPrice = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (coinName != ignore) 1: coinName as String?,
          if (sellPrice != ignore) 2: sellPrice as String?,
          if (sellNum != ignore) 3: sellNum as String?,
          if (increasePrice != ignore) 4: increasePrice as String?,
          if (buyPrice != ignore) 5: buyPrice as String?,
        }) >
        0;
  }
}

sealed class _CoinSellAiModelUpdateAll {
  int call({
    required List<int> id,
    String? coinName,
    String? sellPrice,
    String? sellNum,
    String? increasePrice,
    String? buyPrice,
  });
}

class _CoinSellAiModelUpdateAllImpl implements _CoinSellAiModelUpdateAll {
  const _CoinSellAiModelUpdateAllImpl(this.collection);

  final IsarCollection<int, CoinSellAiModel> collection;

  @override
  int call({
    required List<int> id,
    Object? coinName = ignore,
    Object? sellPrice = ignore,
    Object? sellNum = ignore,
    Object? increasePrice = ignore,
    Object? buyPrice = ignore,
  }) {
    return collection.updateProperties(id, {
      if (coinName != ignore) 1: coinName as String?,
      if (sellPrice != ignore) 2: sellPrice as String?,
      if (sellNum != ignore) 3: sellNum as String?,
      if (increasePrice != ignore) 4: increasePrice as String?,
      if (buyPrice != ignore) 5: buyPrice as String?,
    });
  }
}

extension CoinSellAiModelUpdate on IsarCollection<int, CoinSellAiModel> {
  _CoinSellAiModelUpdate get update => _CoinSellAiModelUpdateImpl(this);

  _CoinSellAiModelUpdateAll get updateAll =>
      _CoinSellAiModelUpdateAllImpl(this);
}

sealed class _CoinSellAiModelQueryUpdate {
  int call({
    String? coinName,
    String? sellPrice,
    String? sellNum,
    String? increasePrice,
    String? buyPrice,
  });
}

class _CoinSellAiModelQueryUpdateImpl implements _CoinSellAiModelQueryUpdate {
  const _CoinSellAiModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CoinSellAiModel> query;
  final int? limit;

  @override
  int call({
    Object? coinName = ignore,
    Object? sellPrice = ignore,
    Object? sellNum = ignore,
    Object? increasePrice = ignore,
    Object? buyPrice = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (coinName != ignore) 1: coinName as String?,
      if (sellPrice != ignore) 2: sellPrice as String?,
      if (sellNum != ignore) 3: sellNum as String?,
      if (increasePrice != ignore) 4: increasePrice as String?,
      if (buyPrice != ignore) 5: buyPrice as String?,
    });
  }
}

extension CoinSellAiModelQueryUpdate on IsarQuery<CoinSellAiModel> {
  _CoinSellAiModelQueryUpdate get updateFirst =>
      _CoinSellAiModelQueryUpdateImpl(this, limit: 1);

  _CoinSellAiModelQueryUpdate get updateAll =>
      _CoinSellAiModelQueryUpdateImpl(this);
}

class _CoinSellAiModelQueryBuilderUpdateImpl
    implements _CoinSellAiModelQueryUpdate {
  const _CoinSellAiModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<CoinSellAiModel, CoinSellAiModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? coinName = ignore,
    Object? sellPrice = ignore,
    Object? sellNum = ignore,
    Object? increasePrice = ignore,
    Object? buyPrice = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (coinName != ignore) 1: coinName as String?,
        if (sellPrice != ignore) 2: sellPrice as String?,
        if (sellNum != ignore) 3: sellNum as String?,
        if (increasePrice != ignore) 4: increasePrice as String?,
        if (buyPrice != ignore) 5: buyPrice as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension CoinSellAiModelQueryBuilderUpdate
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QOperations> {
  _CoinSellAiModelQueryUpdate get updateFirst =>
      _CoinSellAiModelQueryBuilderUpdateImpl(this, limit: 1);

  _CoinSellAiModelQueryUpdate get updateAll =>
      _CoinSellAiModelQueryBuilderUpdateImpl(this);
}

extension CoinSellAiModelQueryFilter
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QFilterCondition> {
  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      idEqualTo(
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
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

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterFilterCondition>
      increasePriceEqualTo(
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
      increasePriceGreaterThan(
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
      increasePriceGreaterThanOrEqualTo(
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
      increasePriceLessThan(
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
      increasePriceLessThanOrEqualTo(
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
      increasePriceBetween(
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
      increasePriceStartsWith(
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
      increasePriceEndsWith(
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
      increasePriceContains(String value, {bool caseSensitive = true}) {
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
      increasePriceMatches(String pattern, {bool caseSensitive = true}) {
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
      increasePriceIsEmpty() {
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
      increasePriceIsNotEmpty() {
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
      buyPriceEqualTo(
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
      buyPriceGreaterThan(
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
      buyPriceGreaterThanOrEqualTo(
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
      buyPriceLessThan(
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
      buyPriceLessThanOrEqualTo(
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
      buyPriceBetween(
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
      buyPriceStartsWith(
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
      buyPriceEndsWith(
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
      buyPriceContains(String value, {bool caseSensitive = true}) {
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
      buyPriceMatches(String pattern, {bool caseSensitive = true}) {
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
      buyPriceIsEmpty() {
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
      buyPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }
}

extension CoinSellAiModelQueryObject
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QFilterCondition> {}

extension CoinSellAiModelQuerySortBy
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QSortBy> {
  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> sortByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      sortByCoinNameDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> sortBySellPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      sortBySellPriceDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> sortBySellNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      sortBySellNumDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      sortByIncreasePrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      sortByIncreasePriceDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> sortByBuyPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      sortByBuyPriceDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension CoinSellAiModelQuerySortThenBy
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QSortThenBy> {
  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> thenByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      thenByCoinNameDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> thenBySellPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      thenBySellPriceDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> thenBySellNum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      thenBySellNumDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      thenByIncreasePrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      thenByIncreasePriceDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy> thenByBuyPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterSortBy>
      thenByBuyPriceDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension CoinSellAiModelQueryWhereDistinct
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QDistinct> {
  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterDistinct>
      distinctByCoinName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterDistinct>
      distinctBySellPrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterDistinct>
      distinctBySellNum({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterDistinct>
      distinctByIncreasePrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinSellAiModel, CoinSellAiModel, QAfterDistinct>
      distinctByBuyPrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }
}

extension CoinSellAiModelQueryProperty1
    on QueryBuilder<CoinSellAiModel, CoinSellAiModel, QProperty> {
  QueryBuilder<CoinSellAiModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinSellAiModel, String, QAfterProperty> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinSellAiModel, String, QAfterProperty> sellPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinSellAiModel, String, QAfterProperty> sellNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CoinSellAiModel, String, QAfterProperty>
      increasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CoinSellAiModel, String, QAfterProperty> buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension CoinSellAiModelQueryProperty2<R>
    on QueryBuilder<CoinSellAiModel, R, QAfterProperty> {
  QueryBuilder<CoinSellAiModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinSellAiModel, (R, String), QAfterProperty>
      coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinSellAiModel, (R, String), QAfterProperty>
      sellPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinSellAiModel, (R, String), QAfterProperty> sellNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CoinSellAiModel, (R, String), QAfterProperty>
      increasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CoinSellAiModel, (R, String), QAfterProperty>
      buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension CoinSellAiModelQueryProperty3<R1, R2>
    on QueryBuilder<CoinSellAiModel, (R1, R2), QAfterProperty> {
  QueryBuilder<CoinSellAiModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CoinSellAiModel, (R1, R2, String), QOperations>
      coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CoinSellAiModel, (R1, R2, String), QOperations>
      sellPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CoinSellAiModel, (R1, R2, String), QOperations>
      sellNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CoinSellAiModel, (R1, R2, String), QOperations>
      increasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CoinSellAiModel, (R1, R2, String), QOperations>
      buyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
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
