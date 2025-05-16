// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs_repository.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveThemeModeSharedPrefsHash() =>
    r'8616ed6bdde1a9a36b0362a26858f0d586ffee0a';

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

/// See also [saveThemeModeSharedPrefs].
@ProviderFor(saveThemeModeSharedPrefs)
const saveThemeModeSharedPrefsProvider = SaveThemeModeSharedPrefsFamily();

/// See also [saveThemeModeSharedPrefs].
class SaveThemeModeSharedPrefsFamily extends Family<AsyncValue<bool>> {
  /// See also [saveThemeModeSharedPrefs].
  const SaveThemeModeSharedPrefsFamily();

  /// See also [saveThemeModeSharedPrefs].
  SaveThemeModeSharedPrefsProvider call(
    String themeMode,
    ThemeMode mode,
  ) {
    return SaveThemeModeSharedPrefsProvider(
      themeMode,
      mode,
    );
  }

  @override
  SaveThemeModeSharedPrefsProvider getProviderOverride(
    covariant SaveThemeModeSharedPrefsProvider provider,
  ) {
    return call(
      provider.themeMode,
      provider.mode,
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
  String? get name => r'saveThemeModeSharedPrefsProvider';
}

/// See also [saveThemeModeSharedPrefs].
class SaveThemeModeSharedPrefsProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [saveThemeModeSharedPrefs].
  SaveThemeModeSharedPrefsProvider(
    String themeMode,
    ThemeMode mode,
  ) : this._internal(
          (ref) => saveThemeModeSharedPrefs(
            ref as SaveThemeModeSharedPrefsRef,
            themeMode,
            mode,
          ),
          from: saveThemeModeSharedPrefsProvider,
          name: r'saveThemeModeSharedPrefsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveThemeModeSharedPrefsHash,
          dependencies: SaveThemeModeSharedPrefsFamily._dependencies,
          allTransitiveDependencies:
              SaveThemeModeSharedPrefsFamily._allTransitiveDependencies,
          themeMode: themeMode,
          mode: mode,
        );

  SaveThemeModeSharedPrefsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.themeMode,
    required this.mode,
  }) : super.internal();

  final String themeMode;
  final ThemeMode mode;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SaveThemeModeSharedPrefsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveThemeModeSharedPrefsProvider._internal(
        (ref) => create(ref as SaveThemeModeSharedPrefsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        themeMode: themeMode,
        mode: mode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SaveThemeModeSharedPrefsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveThemeModeSharedPrefsProvider &&
        other.themeMode == themeMode &&
        other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, themeMode.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveThemeModeSharedPrefsRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `themeMode` of this provider.
  String get themeMode;

  /// The parameter `mode` of this provider.
  ThemeMode get mode;
}

class _SaveThemeModeSharedPrefsProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with SaveThemeModeSharedPrefsRef {
  _SaveThemeModeSharedPrefsProviderElement(super.provider);

  @override
  String get themeMode =>
      (origin as SaveThemeModeSharedPrefsProvider).themeMode;
  @override
  ThemeMode get mode => (origin as SaveThemeModeSharedPrefsProvider).mode;
}

String _$getThemeModeSharedPrefsHash() =>
    r'ff1f8b00c1e62732126bc0b48e2d1253b5845747';

/// See also [getThemeModeSharedPrefs].
@ProviderFor(getThemeModeSharedPrefs)
const getThemeModeSharedPrefsProvider = GetThemeModeSharedPrefsFamily();

/// See also [getThemeModeSharedPrefs].
class GetThemeModeSharedPrefsFamily extends Family<AsyncValue<String?>> {
  /// See also [getThemeModeSharedPrefs].
  const GetThemeModeSharedPrefsFamily();

  /// See also [getThemeModeSharedPrefs].
  GetThemeModeSharedPrefsProvider call(
    String themeMode,
  ) {
    return GetThemeModeSharedPrefsProvider(
      themeMode,
    );
  }

  @override
  GetThemeModeSharedPrefsProvider getProviderOverride(
    covariant GetThemeModeSharedPrefsProvider provider,
  ) {
    return call(
      provider.themeMode,
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
  String? get name => r'getThemeModeSharedPrefsProvider';
}

/// See also [getThemeModeSharedPrefs].
class GetThemeModeSharedPrefsProvider
    extends AutoDisposeFutureProvider<String?> {
  /// See also [getThemeModeSharedPrefs].
  GetThemeModeSharedPrefsProvider(
    String themeMode,
  ) : this._internal(
          (ref) => getThemeModeSharedPrefs(
            ref as GetThemeModeSharedPrefsRef,
            themeMode,
          ),
          from: getThemeModeSharedPrefsProvider,
          name: r'getThemeModeSharedPrefsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getThemeModeSharedPrefsHash,
          dependencies: GetThemeModeSharedPrefsFamily._dependencies,
          allTransitiveDependencies:
              GetThemeModeSharedPrefsFamily._allTransitiveDependencies,
          themeMode: themeMode,
        );

  GetThemeModeSharedPrefsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.themeMode,
  }) : super.internal();

  final String themeMode;

  @override
  Override overrideWith(
    FutureOr<String?> Function(GetThemeModeSharedPrefsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetThemeModeSharedPrefsProvider._internal(
        (ref) => create(ref as GetThemeModeSharedPrefsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        themeMode: themeMode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _GetThemeModeSharedPrefsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetThemeModeSharedPrefsProvider &&
        other.themeMode == themeMode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, themeMode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetThemeModeSharedPrefsRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `themeMode` of this provider.
  String get themeMode;
}

class _GetThemeModeSharedPrefsProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with GetThemeModeSharedPrefsRef {
  _GetThemeModeSharedPrefsProviderElement(super.provider);

  @override
  String get themeMode => (origin as GetThemeModeSharedPrefsProvider).themeMode;
}

String _$savePrintTemplateSharedPrefsHash() =>
    r'd5cb53d9f7335254dbeae16099d9b479cc5f0bf1';

/// See also [savePrintTemplateSharedPrefs].
@ProviderFor(savePrintTemplateSharedPrefs)
const savePrintTemplateSharedPrefsProvider =
    SavePrintTemplateSharedPrefsFamily();

/// See also [savePrintTemplateSharedPrefs].
class SavePrintTemplateSharedPrefsFamily extends Family<AsyncValue<bool>> {
  /// See also [savePrintTemplateSharedPrefs].
  const SavePrintTemplateSharedPrefsFamily();

  /// See also [savePrintTemplateSharedPrefs].
  SavePrintTemplateSharedPrefsProvider call(
    String printTemplate,
    String printPath,
  ) {
    return SavePrintTemplateSharedPrefsProvider(
      printTemplate,
      printPath,
    );
  }

  @override
  SavePrintTemplateSharedPrefsProvider getProviderOverride(
    covariant SavePrintTemplateSharedPrefsProvider provider,
  ) {
    return call(
      provider.printTemplate,
      provider.printPath,
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
  String? get name => r'savePrintTemplateSharedPrefsProvider';
}

/// See also [savePrintTemplateSharedPrefs].
class SavePrintTemplateSharedPrefsProvider
    extends AutoDisposeFutureProvider<bool> {
  /// See also [savePrintTemplateSharedPrefs].
  SavePrintTemplateSharedPrefsProvider(
    String printTemplate,
    String printPath,
  ) : this._internal(
          (ref) => savePrintTemplateSharedPrefs(
            ref as SavePrintTemplateSharedPrefsRef,
            printTemplate,
            printPath,
          ),
          from: savePrintTemplateSharedPrefsProvider,
          name: r'savePrintTemplateSharedPrefsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savePrintTemplateSharedPrefsHash,
          dependencies: SavePrintTemplateSharedPrefsFamily._dependencies,
          allTransitiveDependencies:
              SavePrintTemplateSharedPrefsFamily._allTransitiveDependencies,
          printTemplate: printTemplate,
          printPath: printPath,
        );

  SavePrintTemplateSharedPrefsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.printTemplate,
    required this.printPath,
  }) : super.internal();

  final String printTemplate;
  final String printPath;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SavePrintTemplateSharedPrefsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavePrintTemplateSharedPrefsProvider._internal(
        (ref) => create(ref as SavePrintTemplateSharedPrefsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        printTemplate: printTemplate,
        printPath: printPath,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SavePrintTemplateSharedPrefsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavePrintTemplateSharedPrefsProvider &&
        other.printTemplate == printTemplate &&
        other.printPath == printPath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, printTemplate.hashCode);
    hash = _SystemHash.combine(hash, printPath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SavePrintTemplateSharedPrefsRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `printTemplate` of this provider.
  String get printTemplate;

  /// The parameter `printPath` of this provider.
  String get printPath;
}

class _SavePrintTemplateSharedPrefsProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with SavePrintTemplateSharedPrefsRef {
  _SavePrintTemplateSharedPrefsProviderElement(super.provider);

  @override
  String get printTemplate =>
      (origin as SavePrintTemplateSharedPrefsProvider).printTemplate;
  @override
  String get printPath =>
      (origin as SavePrintTemplateSharedPrefsProvider).printPath;
}

String _$getPrintTemplateSharedPrefsHash() =>
    r'd910792a174d39a32a266a03e7dac3f1154a33d5';

/// See also [getPrintTemplateSharedPrefs].
@ProviderFor(getPrintTemplateSharedPrefs)
const getPrintTemplateSharedPrefsProvider = GetPrintTemplateSharedPrefsFamily();

/// See also [getPrintTemplateSharedPrefs].
class GetPrintTemplateSharedPrefsFamily extends Family<AsyncValue<String?>> {
  /// See also [getPrintTemplateSharedPrefs].
  const GetPrintTemplateSharedPrefsFamily();

  /// See also [getPrintTemplateSharedPrefs].
  GetPrintTemplateSharedPrefsProvider call(
    String printTemplate,
  ) {
    return GetPrintTemplateSharedPrefsProvider(
      printTemplate,
    );
  }

  @override
  GetPrintTemplateSharedPrefsProvider getProviderOverride(
    covariant GetPrintTemplateSharedPrefsProvider provider,
  ) {
    return call(
      provider.printTemplate,
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
  String? get name => r'getPrintTemplateSharedPrefsProvider';
}

/// See also [getPrintTemplateSharedPrefs].
class GetPrintTemplateSharedPrefsProvider
    extends AutoDisposeFutureProvider<String?> {
  /// See also [getPrintTemplateSharedPrefs].
  GetPrintTemplateSharedPrefsProvider(
    String printTemplate,
  ) : this._internal(
          (ref) => getPrintTemplateSharedPrefs(
            ref as GetPrintTemplateSharedPrefsRef,
            printTemplate,
          ),
          from: getPrintTemplateSharedPrefsProvider,
          name: r'getPrintTemplateSharedPrefsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPrintTemplateSharedPrefsHash,
          dependencies: GetPrintTemplateSharedPrefsFamily._dependencies,
          allTransitiveDependencies:
              GetPrintTemplateSharedPrefsFamily._allTransitiveDependencies,
          printTemplate: printTemplate,
        );

  GetPrintTemplateSharedPrefsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.printTemplate,
  }) : super.internal();

  final String printTemplate;

  @override
  Override overrideWith(
    FutureOr<String?> Function(GetPrintTemplateSharedPrefsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPrintTemplateSharedPrefsProvider._internal(
        (ref) => create(ref as GetPrintTemplateSharedPrefsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        printTemplate: printTemplate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _GetPrintTemplateSharedPrefsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPrintTemplateSharedPrefsProvider &&
        other.printTemplate == printTemplate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, printTemplate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPrintTemplateSharedPrefsRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `printTemplate` of this provider.
  String get printTemplate;
}

class _GetPrintTemplateSharedPrefsProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with GetPrintTemplateSharedPrefsRef {
  _GetPrintTemplateSharedPrefsProviderElement(super.provider);

  @override
  String get printTemplate =>
      (origin as GetPrintTemplateSharedPrefsProvider).printTemplate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
