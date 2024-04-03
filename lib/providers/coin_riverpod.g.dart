// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buyListHash() => r'0d9ee67f0d2e918333dddfc5159b4dda10b392f9';

/// See also [buyList].
@ProviderFor(buyList)
final buyListProvider = AutoDisposeFutureProvider<List<CoinBuyModel>?>.internal(
  buyList,
  name: r'buyListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$buyListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BuyListRef = AutoDisposeFutureProviderRef<List<CoinBuyModel>?>;
String _$aiModelListHash() => r'c4cbcd8a78b479a53b2d1c84afd17e9c16133f52';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [aiModelList].
@ProviderFor(aiModelList)
const aiModelListProvider = AiModelListFamily();

/// See also [aiModelList].
class AiModelListFamily extends Family<AsyncValue<List<CoinSellAiModel>?>> {
  /// See also [aiModelList].
  const AiModelListFamily();

  /// See also [aiModelList].
  AiModelListProvider call(
    String coinName,
  ) {
    return AiModelListProvider(
      coinName,
    );
  }

  @override
  AiModelListProvider getProviderOverride(
    covariant AiModelListProvider provider,
  ) {
    return call(
      provider.coinName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'aiModelListProvider';
}

/// See also [aiModelList].
class AiModelListProvider
    extends AutoDisposeFutureProvider<List<CoinSellAiModel>?> {
  /// See also [aiModelList].
  AiModelListProvider(
    String coinName,
  ) : this._internal(
          (ref) => aiModelList(
            ref as AiModelListRef,
            coinName,
          ),
          from: aiModelListProvider,
          name: r'aiModelListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$aiModelListHash,
          dependencies: AiModelListFamily._dependencies,
          allTransitiveDependencies:
              AiModelListFamily._allTransitiveDependencies,
          coinName: coinName,
        );

  AiModelListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.coinName,
  }) : super.internal();

  final String coinName;

  @override
  Override overrideWith(
    FutureOr<List<CoinSellAiModel>?> Function(AiModelListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AiModelListProvider._internal(
        (ref) => create(ref as AiModelListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        coinName: coinName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CoinSellAiModel>?> createElement() {
    return _AiModelListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AiModelListProvider && other.coinName == coinName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, coinName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AiModelListRef on AutoDisposeFutureProviderRef<List<CoinSellAiModel>?> {
  /// The parameter `coinName` of this provider.
  String get coinName;
}

class _AiModelListProviderElement
    extends AutoDisposeFutureProviderElement<List<CoinSellAiModel>?>
    with AiModelListRef {
  _AiModelListProviderElement(super.provider);

  @override
  String get coinName => (origin as AiModelListProvider).coinName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
