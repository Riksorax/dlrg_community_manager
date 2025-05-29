// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_repository.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveMemberRepoHash() => r'cb0029c27f5e4969f64f3fc853bf131f7c22667c';

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

/// See also [saveMemberRepo].
@ProviderFor(saveMemberRepo)
const saveMemberRepoProvider = SaveMemberRepoFamily();

/// See also [saveMemberRepo].
class SaveMemberRepoFamily extends Family<AsyncValue<bool>> {
  /// See also [saveMemberRepo].
  const SaveMemberRepoFamily();

  /// See also [saveMemberRepo].
  SaveMemberRepoProvider call(
    Member member,
  ) {
    return SaveMemberRepoProvider(
      member,
    );
  }

  @override
  SaveMemberRepoProvider getProviderOverride(
    covariant SaveMemberRepoProvider provider,
  ) {
    return call(
      provider.member,
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
  String? get name => r'saveMemberRepoProvider';
}

/// See also [saveMemberRepo].
class SaveMemberRepoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [saveMemberRepo].
  SaveMemberRepoProvider(
    Member member,
  ) : this._internal(
          (ref) => saveMemberRepo(
            ref as SaveMemberRepoRef,
            member,
          ),
          from: saveMemberRepoProvider,
          name: r'saveMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveMemberRepoHash,
          dependencies: SaveMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              SaveMemberRepoFamily._allTransitiveDependencies,
          member: member,
        );

  SaveMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.member,
  }) : super.internal();

  final Member member;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SaveMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveMemberRepoProvider._internal(
        (ref) => create(ref as SaveMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        member: member,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SaveMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveMemberRepoProvider && other.member == member;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, member.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveMemberRepoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `member` of this provider.
  Member get member;
}

class _SaveMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SaveMemberRepoRef {
  _SaveMemberRepoProviderElement(super.provider);

  @override
  Member get member => (origin as SaveMemberRepoProvider).member;
}

String _$getMemberRepoHash() => r'e6c2b749676206c1a29a99c90a3b52330a0ffbb5';

/// See also [getMemberRepo].
@ProviderFor(getMemberRepo)
const getMemberRepoProvider = GetMemberRepoFamily();

/// See also [getMemberRepo].
class GetMemberRepoFamily extends Family<AsyncValue<Member?>> {
  /// See also [getMemberRepo].
  const GetMemberRepoFamily();

  /// See also [getMemberRepo].
  GetMemberRepoProvider call(
    String memberNumber,
  ) {
    return GetMemberRepoProvider(
      memberNumber,
    );
  }

  @override
  GetMemberRepoProvider getProviderOverride(
    covariant GetMemberRepoProvider provider,
  ) {
    return call(
      provider.memberNumber,
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
  String? get name => r'getMemberRepoProvider';
}

/// See also [getMemberRepo].
class GetMemberRepoProvider extends AutoDisposeFutureProvider<Member?> {
  /// See also [getMemberRepo].
  GetMemberRepoProvider(
    String memberNumber,
  ) : this._internal(
          (ref) => getMemberRepo(
            ref as GetMemberRepoRef,
            memberNumber,
          ),
          from: getMemberRepoProvider,
          name: r'getMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMemberRepoHash,
          dependencies: GetMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              GetMemberRepoFamily._allTransitiveDependencies,
          memberNumber: memberNumber,
        );

  GetMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.memberNumber,
  }) : super.internal();

  final String memberNumber;

  @override
  Override overrideWith(
    FutureOr<Member?> Function(GetMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMemberRepoProvider._internal(
        (ref) => create(ref as GetMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        memberNumber: memberNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Member?> createElement() {
    return _GetMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMemberRepoProvider && other.memberNumber == memberNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, memberNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMemberRepoRef on AutoDisposeFutureProviderRef<Member?> {
  /// The parameter `memberNumber` of this provider.
  String get memberNumber;
}

class _GetMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<Member?> with GetMemberRepoRef {
  _GetMemberRepoProviderElement(super.provider);

  @override
  String get memberNumber => (origin as GetMemberRepoProvider).memberNumber;
}

String _$updateMemberRepoHash() => r'e7d5cf74405cf6d9936795240afdb2fd5761c055';

/// See also [updateMemberRepo].
@ProviderFor(updateMemberRepo)
const updateMemberRepoProvider = UpdateMemberRepoFamily();

/// See also [updateMemberRepo].
class UpdateMemberRepoFamily extends Family<AsyncValue<bool>> {
  /// See also [updateMemberRepo].
  const UpdateMemberRepoFamily();

  /// See also [updateMemberRepo].
  UpdateMemberRepoProvider call(
    Member member,
    int? index,
  ) {
    return UpdateMemberRepoProvider(
      member,
      index,
    );
  }

  @override
  UpdateMemberRepoProvider getProviderOverride(
    covariant UpdateMemberRepoProvider provider,
  ) {
    return call(
      provider.member,
      provider.index,
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
  String? get name => r'updateMemberRepoProvider';
}

/// See also [updateMemberRepo].
class UpdateMemberRepoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateMemberRepo].
  UpdateMemberRepoProvider(
    Member member,
    int? index,
  ) : this._internal(
          (ref) => updateMemberRepo(
            ref as UpdateMemberRepoRef,
            member,
            index,
          ),
          from: updateMemberRepoProvider,
          name: r'updateMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMemberRepoHash,
          dependencies: UpdateMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              UpdateMemberRepoFamily._allTransitiveDependencies,
          member: member,
          index: index,
        );

  UpdateMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.member,
    required this.index,
  }) : super.internal();

  final Member member;
  final int? index;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMemberRepoProvider._internal(
        (ref) => create(ref as UpdateMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        member: member,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMemberRepoProvider &&
        other.member == member &&
        other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, member.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateMemberRepoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `member` of this provider.
  Member get member;

  /// The parameter `index` of this provider.
  int? get index;
}

class _UpdateMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with UpdateMemberRepoRef {
  _UpdateMemberRepoProviderElement(super.provider);

  @override
  Member get member => (origin as UpdateMemberRepoProvider).member;
  @override
  int? get index => (origin as UpdateMemberRepoProvider).index;
}

String _$deleteMemberRepoHash() => r'b5e9127782aaf6f23103bbcabf628fbf2f9d3781';

/// See also [deleteMemberRepo].
@ProviderFor(deleteMemberRepo)
const deleteMemberRepoProvider = DeleteMemberRepoFamily();

/// See also [deleteMemberRepo].
class DeleteMemberRepoFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteMemberRepo].
  const DeleteMemberRepoFamily();

  /// See also [deleteMemberRepo].
  DeleteMemberRepoProvider call(
    String memberNumber,
  ) {
    return DeleteMemberRepoProvider(
      memberNumber,
    );
  }

  @override
  DeleteMemberRepoProvider getProviderOverride(
    covariant DeleteMemberRepoProvider provider,
  ) {
    return call(
      provider.memberNumber,
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
  String? get name => r'deleteMemberRepoProvider';
}

/// See also [deleteMemberRepo].
class DeleteMemberRepoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteMemberRepo].
  DeleteMemberRepoProvider(
    String memberNumber,
  ) : this._internal(
          (ref) => deleteMemberRepo(
            ref as DeleteMemberRepoRef,
            memberNumber,
          ),
          from: deleteMemberRepoProvider,
          name: r'deleteMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMemberRepoHash,
          dependencies: DeleteMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              DeleteMemberRepoFamily._allTransitiveDependencies,
          memberNumber: memberNumber,
        );

  DeleteMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.memberNumber,
  }) : super.internal();

  final String memberNumber;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteMemberRepoProvider._internal(
        (ref) => create(ref as DeleteMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        memberNumber: memberNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteMemberRepoProvider &&
        other.memberNumber == memberNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, memberNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteMemberRepoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `memberNumber` of this provider.
  String get memberNumber;
}

class _DeleteMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteMemberRepoRef {
  _DeleteMemberRepoProviderElement(super.provider);

  @override
  String get memberNumber => (origin as DeleteMemberRepoProvider).memberNumber;
}

String _$getAllMembersRepoHash() => r'dafa8696eefbbc9e3e03a622896b81848cfb4583';

/// See also [getAllMembersRepo].
@ProviderFor(getAllMembersRepo)
final getAllMembersRepoProvider =
    AutoDisposeFutureProvider<List<Member>>.internal(
  getAllMembersRepo,
  name: r'getAllMembersRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllMembersRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllMembersRepoRef = AutoDisposeFutureProviderRef<List<Member>>;
String _$getAuthRepoHash() => r'c8d8833bacff2d4e9dbb6a82350f12923326daa0';

/// See also [getAuthRepo].
@ProviderFor(getAuthRepo)
const getAuthRepoProvider = GetAuthRepoFamily();

/// See also [getAuthRepo].
class GetAuthRepoFamily extends Family<AsyncValue<Auth?>> {
  /// See also [getAuthRepo].
  const GetAuthRepoFamily();

  /// See also [getAuthRepo].
  GetAuthRepoProvider call(
    String userUid,
  ) {
    return GetAuthRepoProvider(
      userUid,
    );
  }

  @override
  GetAuthRepoProvider getProviderOverride(
    covariant GetAuthRepoProvider provider,
  ) {
    return call(
      provider.userUid,
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
  String? get name => r'getAuthRepoProvider';
}

/// See also [getAuthRepo].
class GetAuthRepoProvider extends AutoDisposeFutureProvider<Auth?> {
  /// See also [getAuthRepo].
  GetAuthRepoProvider(
    String userUid,
  ) : this._internal(
          (ref) => getAuthRepo(
            ref as GetAuthRepoRef,
            userUid,
          ),
          from: getAuthRepoProvider,
          name: r'getAuthRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAuthRepoHash,
          dependencies: GetAuthRepoFamily._dependencies,
          allTransitiveDependencies:
              GetAuthRepoFamily._allTransitiveDependencies,
          userUid: userUid,
        );

  GetAuthRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userUid,
  }) : super.internal();

  final String userUid;

  @override
  Override overrideWith(
    FutureOr<Auth?> Function(GetAuthRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAuthRepoProvider._internal(
        (ref) => create(ref as GetAuthRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userUid: userUid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Auth?> createElement() {
    return _GetAuthRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAuthRepoProvider && other.userUid == userUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAuthRepoRef on AutoDisposeFutureProviderRef<Auth?> {
  /// The parameter `userUid` of this provider.
  String get userUid;
}

class _GetAuthRepoProviderElement
    extends AutoDisposeFutureProviderElement<Auth?> with GetAuthRepoRef {
  _GetAuthRepoProviderElement(super.provider);

  @override
  String get userUid => (origin as GetAuthRepoProvider).userUid;
}

String _$setAuthRepoHash() => r'baa12633385bef053f1ce485297253667d8512fe';

/// See also [setAuthRepo].
@ProviderFor(setAuthRepo)
const setAuthRepoProvider = SetAuthRepoFamily();

/// See also [setAuthRepo].
class SetAuthRepoFamily extends Family<AsyncValue<bool>> {
  /// See also [setAuthRepo].
  const SetAuthRepoFamily();

  /// See also [setAuthRepo].
  SetAuthRepoProvider call(
    Auth auth,
  ) {
    return SetAuthRepoProvider(
      auth,
    );
  }

  @override
  SetAuthRepoProvider getProviderOverride(
    covariant SetAuthRepoProvider provider,
  ) {
    return call(
      provider.auth,
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
  String? get name => r'setAuthRepoProvider';
}

/// See also [setAuthRepo].
class SetAuthRepoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [setAuthRepo].
  SetAuthRepoProvider(
    Auth auth,
  ) : this._internal(
          (ref) => setAuthRepo(
            ref as SetAuthRepoRef,
            auth,
          ),
          from: setAuthRepoProvider,
          name: r'setAuthRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setAuthRepoHash,
          dependencies: SetAuthRepoFamily._dependencies,
          allTransitiveDependencies:
              SetAuthRepoFamily._allTransitiveDependencies,
          auth: auth,
        );

  SetAuthRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auth,
  }) : super.internal();

  final Auth auth;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SetAuthRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetAuthRepoProvider._internal(
        (ref) => create(ref as SetAuthRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auth: auth,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SetAuthRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetAuthRepoProvider && other.auth == auth;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auth.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SetAuthRepoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `auth` of this provider.
  Auth get auth;
}

class _SetAuthRepoProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SetAuthRepoRef {
  _SetAuthRepoProviderElement(super.provider);

  @override
  Auth get auth => (origin as SetAuthRepoProvider).auth;
}

String _$getListAuthRepoHash() => r'bcc8dea5114c7cc17f4b73e716bad823f5922316';

/// See also [getListAuthRepo].
@ProviderFor(getListAuthRepo)
final getListAuthRepoProvider = AutoDisposeFutureProvider<List<Auth>>.internal(
  getListAuthRepo,
  name: r'getListAuthRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getListAuthRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetListAuthRepoRef = AutoDisposeFutureProviderRef<List<Auth>>;
String _$updateAuthHash() => r'f92b3723cd879e80058434b1ee066128d421fa14';

/// See also [updateAuth].
@ProviderFor(updateAuth)
const updateAuthProvider = UpdateAuthFamily();

/// See also [updateAuth].
class UpdateAuthFamily extends Family<AsyncValue<bool>> {
  /// See also [updateAuth].
  const UpdateAuthFamily();

  /// See also [updateAuth].
  UpdateAuthProvider call(
    Auth auth,
  ) {
    return UpdateAuthProvider(
      auth,
    );
  }

  @override
  UpdateAuthProvider getProviderOverride(
    covariant UpdateAuthProvider provider,
  ) {
    return call(
      provider.auth,
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
  String? get name => r'updateAuthProvider';
}

/// See also [updateAuth].
class UpdateAuthProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateAuth].
  UpdateAuthProvider(
    Auth auth,
  ) : this._internal(
          (ref) => updateAuth(
            ref as UpdateAuthRef,
            auth,
          ),
          from: updateAuthProvider,
          name: r'updateAuthProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAuthHash,
          dependencies: UpdateAuthFamily._dependencies,
          allTransitiveDependencies:
              UpdateAuthFamily._allTransitiveDependencies,
          auth: auth,
        );

  UpdateAuthProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auth,
  }) : super.internal();

  final Auth auth;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateAuthRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAuthProvider._internal(
        (ref) => create(ref as UpdateAuthRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auth: auth,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateAuthProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAuthProvider && other.auth == auth;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auth.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateAuthRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `auth` of this provider.
  Auth get auth;
}

class _UpdateAuthProviderElement extends AutoDisposeFutureProviderElement<bool>
    with UpdateAuthRef {
  _UpdateAuthProviderElement(super.provider);

  @override
  Auth get auth => (origin as UpdateAuthProvider).auth;
}

String _$searchMemberHash() => r'00165c4538f2a03cb7ea1f950f3011ee74e0b4b3';

/// See also [searchMember].
@ProviderFor(searchMember)
const searchMemberProvider = SearchMemberFamily();

/// See also [searchMember].
class SearchMemberFamily extends Family<AsyncValue<List<Member>>> {
  /// See also [searchMember].
  const SearchMemberFamily();

  /// See also [searchMember].
  SearchMemberProvider call(
    String searchText,
  ) {
    return SearchMemberProvider(
      searchText,
    );
  }

  @override
  SearchMemberProvider getProviderOverride(
    covariant SearchMemberProvider provider,
  ) {
    return call(
      provider.searchText,
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
  String? get name => r'searchMemberProvider';
}

/// See also [searchMember].
class SearchMemberProvider extends AutoDisposeFutureProvider<List<Member>> {
  /// See also [searchMember].
  SearchMemberProvider(
    String searchText,
  ) : this._internal(
          (ref) => searchMember(
            ref as SearchMemberRef,
            searchText,
          ),
          from: searchMemberProvider,
          name: r'searchMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMemberHash,
          dependencies: SearchMemberFamily._dependencies,
          allTransitiveDependencies:
              SearchMemberFamily._allTransitiveDependencies,
          searchText: searchText,
        );

  SearchMemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchText,
  }) : super.internal();

  final String searchText;

  @override
  Override overrideWith(
    FutureOr<List<Member>> Function(SearchMemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchMemberProvider._internal(
        (ref) => create(ref as SearchMemberRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchText: searchText,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Member>> createElement() {
    return _SearchMemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMemberProvider && other.searchText == searchText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchText.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchMemberRef on AutoDisposeFutureProviderRef<List<Member>> {
  /// The parameter `searchText` of this provider.
  String get searchText;
}

class _SearchMemberProviderElement
    extends AutoDisposeFutureProviderElement<List<Member>>
    with SearchMemberRef {
  _SearchMemberProviderElement(super.provider);

  @override
  String get searchText => (origin as SearchMemberProvider).searchText;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
