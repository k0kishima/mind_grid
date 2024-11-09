// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameNotifierHash() => r'28935b70e2cf84a4d030fc57595be3f29fd8aa97';

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

abstract class _$GameNotifier extends BuildlessAutoDisposeNotifier<Game> {
  late final int gridWidth;
  late final int gridHeight;

  Game build({
    int gridWidth = 8,
    int gridHeight = 8,
  });
}

/// See also [GameNotifier].
@ProviderFor(GameNotifier)
const gameNotifierProvider = GameNotifierFamily();

/// See also [GameNotifier].
class GameNotifierFamily extends Family<Game> {
  /// See also [GameNotifier].
  const GameNotifierFamily();

  /// See also [GameNotifier].
  GameNotifierProvider call({
    int gridWidth = 8,
    int gridHeight = 8,
  }) {
    return GameNotifierProvider(
      gridWidth: gridWidth,
      gridHeight: gridHeight,
    );
  }

  @override
  GameNotifierProvider getProviderOverride(
    covariant GameNotifierProvider provider,
  ) {
    return call(
      gridWidth: provider.gridWidth,
      gridHeight: provider.gridHeight,
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
  String? get name => r'gameNotifierProvider';
}

/// See also [GameNotifier].
class GameNotifierProvider
    extends AutoDisposeNotifierProviderImpl<GameNotifier, Game> {
  /// See also [GameNotifier].
  GameNotifierProvider({
    int gridWidth = 8,
    int gridHeight = 8,
  }) : this._internal(
          () => GameNotifier()
            ..gridWidth = gridWidth
            ..gridHeight = gridHeight,
          from: gameNotifierProvider,
          name: r'gameNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameNotifierHash,
          dependencies: GameNotifierFamily._dependencies,
          allTransitiveDependencies:
              GameNotifierFamily._allTransitiveDependencies,
          gridWidth: gridWidth,
          gridHeight: gridHeight,
        );

  GameNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gridWidth,
    required this.gridHeight,
  }) : super.internal();

  final int gridWidth;
  final int gridHeight;

  @override
  Game runNotifierBuild(
    covariant GameNotifier notifier,
  ) {
    return notifier.build(
      gridWidth: gridWidth,
      gridHeight: gridHeight,
    );
  }

  @override
  Override overrideWith(GameNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameNotifierProvider._internal(
        () => create()
          ..gridWidth = gridWidth
          ..gridHeight = gridHeight,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gridWidth: gridWidth,
        gridHeight: gridHeight,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<GameNotifier, Game> createElement() {
    return _GameNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameNotifierProvider &&
        other.gridWidth == gridWidth &&
        other.gridHeight == gridHeight;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gridWidth.hashCode);
    hash = _SystemHash.combine(hash, gridHeight.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GameNotifierRef on AutoDisposeNotifierProviderRef<Game> {
  /// The parameter `gridWidth` of this provider.
  int get gridWidth;

  /// The parameter `gridHeight` of this provider.
  int get gridHeight;
}

class _GameNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<GameNotifier, Game>
    with GameNotifierRef {
  _GameNotifierProviderElement(super.provider);

  @override
  int get gridWidth => (origin as GameNotifierProvider).gridWidth;
  @override
  int get gridHeight => (origin as GameNotifierProvider).gridHeight;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
