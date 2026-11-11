// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vaccinationRecordDetailHash() =>
    r'd5d89de701f37d87e088be13409f465e05cbe3d4';

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

/// See also [vaccinationRecordDetail].
@ProviderFor(vaccinationRecordDetail)
const vaccinationRecordDetailProvider = VaccinationRecordDetailFamily();

/// See also [vaccinationRecordDetail].
class VaccinationRecordDetailFamily
    extends Family<AsyncValue<VaccinationRecord?>> {
  /// See also [vaccinationRecordDetail].
  const VaccinationRecordDetailFamily();

  /// See also [vaccinationRecordDetail].
  VaccinationRecordDetailProvider call(
    int recordId,
  ) {
    return VaccinationRecordDetailProvider(
      recordId,
    );
  }

  @override
  VaccinationRecordDetailProvider getProviderOverride(
    covariant VaccinationRecordDetailProvider provider,
  ) {
    return call(
      provider.recordId,
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
  String? get name => r'vaccinationRecordDetailProvider';
}

/// See also [vaccinationRecordDetail].
class VaccinationRecordDetailProvider
    extends AutoDisposeFutureProvider<VaccinationRecord?> {
  /// See also [vaccinationRecordDetail].
  VaccinationRecordDetailProvider(
    int recordId,
  ) : this._internal(
          (ref) => vaccinationRecordDetail(
            ref as VaccinationRecordDetailRef,
            recordId,
          ),
          from: vaccinationRecordDetailProvider,
          name: r'vaccinationRecordDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vaccinationRecordDetailHash,
          dependencies: VaccinationRecordDetailFamily._dependencies,
          allTransitiveDependencies:
              VaccinationRecordDetailFamily._allTransitiveDependencies,
          recordId: recordId,
        );

  VaccinationRecordDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recordId,
  }) : super.internal();

  final int recordId;

  @override
  Override overrideWith(
    FutureOr<VaccinationRecord?> Function(VaccinationRecordDetailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VaccinationRecordDetailProvider._internal(
        (ref) => create(ref as VaccinationRecordDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recordId: recordId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<VaccinationRecord?> createElement() {
    return _VaccinationRecordDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VaccinationRecordDetailProvider &&
        other.recordId == recordId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recordId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VaccinationRecordDetailRef
    on AutoDisposeFutureProviderRef<VaccinationRecord?> {
  /// The parameter `recordId` of this provider.
  int get recordId;
}

class _VaccinationRecordDetailProviderElement
    extends AutoDisposeFutureProviderElement<VaccinationRecord?>
    with VaccinationRecordDetailRef {
  _VaccinationRecordDetailProviderElement(super.provider);

  @override
  int get recordId => (origin as VaccinationRecordDetailProvider).recordId;
}

String _$vaccinationRecordsListHash() =>
    r'4f4d71657d813c3a6cd3f5987e40445f3389ce56';

abstract class _$VaccinationRecordsList
    extends BuildlessAutoDisposeAsyncNotifier<List<VaccinationRecord>> {
  late final int petId;

  FutureOr<List<VaccinationRecord>> build(
    int petId,
  );
}

/// See also [VaccinationRecordsList].
@ProviderFor(VaccinationRecordsList)
const vaccinationRecordsListProvider = VaccinationRecordsListFamily();

/// See also [VaccinationRecordsList].
class VaccinationRecordsListFamily
    extends Family<AsyncValue<List<VaccinationRecord>>> {
  /// See also [VaccinationRecordsList].
  const VaccinationRecordsListFamily();

  /// See also [VaccinationRecordsList].
  VaccinationRecordsListProvider call(
    int petId,
  ) {
    return VaccinationRecordsListProvider(
      petId,
    );
  }

  @override
  VaccinationRecordsListProvider getProviderOverride(
    covariant VaccinationRecordsListProvider provider,
  ) {
    return call(
      provider.petId,
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
  String? get name => r'vaccinationRecordsListProvider';
}

/// See also [VaccinationRecordsList].
class VaccinationRecordsListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VaccinationRecordsList,
        List<VaccinationRecord>> {
  /// See also [VaccinationRecordsList].
  VaccinationRecordsListProvider(
    int petId,
  ) : this._internal(
          () => VaccinationRecordsList()..petId = petId,
          from: vaccinationRecordsListProvider,
          name: r'vaccinationRecordsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vaccinationRecordsListHash,
          dependencies: VaccinationRecordsListFamily._dependencies,
          allTransitiveDependencies:
              VaccinationRecordsListFamily._allTransitiveDependencies,
          petId: petId,
        );

  VaccinationRecordsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.petId,
  }) : super.internal();

  final int petId;

  @override
  FutureOr<List<VaccinationRecord>> runNotifierBuild(
    covariant VaccinationRecordsList notifier,
  ) {
    return notifier.build(
      petId,
    );
  }

  @override
  Override overrideWith(VaccinationRecordsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: VaccinationRecordsListProvider._internal(
        () => create()..petId = petId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        petId: petId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VaccinationRecordsList,
      List<VaccinationRecord>> createElement() {
    return _VaccinationRecordsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VaccinationRecordsListProvider && other.petId == petId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, petId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VaccinationRecordsListRef
    on AutoDisposeAsyncNotifierProviderRef<List<VaccinationRecord>> {
  /// The parameter `petId` of this provider.
  int get petId;
}

class _VaccinationRecordsListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VaccinationRecordsList,
        List<VaccinationRecord>> with VaccinationRecordsListRef {
  _VaccinationRecordsListProviderElement(super.provider);

  @override
  int get petId => (origin as VaccinationRecordsListProvider).petId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
