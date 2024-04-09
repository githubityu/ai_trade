// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buyListHash() => r'83a1177654e33ea0d4603bf31f4e93c14b01a549';

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
String _$aiModelListHash() => r'2dc3aca01cbb40ae115b39f60b3b0738580afa1d';

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
    int id,
  ) {
    return AiModelListProvider(
      id,
    );
  }

  @override
  AiModelListProvider getProviderOverride(
    covariant AiModelListProvider provider,
  ) {
    return call(
      provider.id,
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
    int id,
  ) : this._internal(
          (ref) => aiModelList(
            ref as AiModelListRef,
            id,
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
          id: id,
        );

  AiModelListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

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
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CoinSellAiModel>?> createElement() {
    return _AiModelListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AiModelListProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AiModelListRef on AutoDisposeFutureProviderRef<List<CoinSellAiModel>?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AiModelListProviderElement
    extends AutoDisposeFutureProviderElement<List<CoinSellAiModel>?>
    with AiModelListRef {
  _AiModelListProviderElement(super.provider);

  @override
  int get id => (origin as AiModelListProvider).id;
}

String _$findInputCostModelHash() =>
    r'590ef53dc4860023ba005ad3c56762f210fa1d15';

/// See also [findInputCostModel].
@ProviderFor(findInputCostModel)
final findInputCostModelProvider =
    AutoDisposeFutureProvider<List<InputCostModel>>.internal(
  findInputCostModel,
  name: r'findInputCostModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findInputCostModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindInputCostModelRef
    = AutoDisposeFutureProviderRef<List<InputCostModel>>;
String _$inputConstTotalHash() => r'0f0dab331f569b6477b6a316c06150d12dafeec0';

/// See also [inputConstTotal].
@ProviderFor(inputConstTotal)
final inputConstTotalProvider = AutoDisposeFutureProvider<double>.internal(
  inputConstTotal,
  name: r'inputConstTotalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inputConstTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InputConstTotalRef = AutoDisposeFutureProviderRef<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
