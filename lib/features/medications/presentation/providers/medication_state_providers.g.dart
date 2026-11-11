// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMedicationUseCaseHash() =>
    r'fe9b66d5148fb02d77102ba0ee593b62391ddbb5';

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

/// See also [getMedicationUseCase].
@ProviderFor(getMedicationUseCase)
const getMedicationUseCaseProvider = GetMedicationUseCaseFamily();

/// See also [getMedicationUseCase].
class GetMedicationUseCaseFamily extends Family<AsyncValue<Medication?>> {
  /// See also [getMedicationUseCase].
  const GetMedicationUseCaseFamily();

  /// See also [getMedicationUseCase].
  GetMedicationUseCaseProvider call(
    int medicationId,
  ) {
    return GetMedicationUseCaseProvider(
      medicationId,
    );
  }

  @override
  GetMedicationUseCaseProvider getProviderOverride(
    covariant GetMedicationUseCaseProvider provider,
  ) {
    return call(
      provider.medicationId,
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
  String? get name => r'getMedicationUseCaseProvider';
}

/// See also [getMedicationUseCase].
class GetMedicationUseCaseProvider
    extends AutoDisposeFutureProvider<Medication?> {
  /// See also [getMedicationUseCase].
  GetMedicationUseCaseProvider(
    int medicationId,
  ) : this._internal(
          (ref) => getMedicationUseCase(
            ref as GetMedicationUseCaseRef,
            medicationId,
          ),
          from: getMedicationUseCaseProvider,
          name: r'getMedicationUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMedicationUseCaseHash,
          dependencies: GetMedicationUseCaseFamily._dependencies,
          allTransitiveDependencies:
              GetMedicationUseCaseFamily._allTransitiveDependencies,
          medicationId: medicationId,
        );

  GetMedicationUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.medicationId,
  }) : super.internal();

  final int medicationId;

  @override
  Override overrideWith(
    FutureOr<Medication?> Function(GetMedicationUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMedicationUseCaseProvider._internal(
        (ref) => create(ref as GetMedicationUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        medicationId: medicationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Medication?> createElement() {
    return _GetMedicationUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMedicationUseCaseProvider &&
        other.medicationId == medicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, medicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMedicationUseCaseRef on AutoDisposeFutureProviderRef<Medication?> {
  /// The parameter `medicationId` of this provider.
  int get medicationId;
}

class _GetMedicationUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<Medication?>
    with GetMedicationUseCaseRef {
  _GetMedicationUseCaseProviderElement(super.provider);

  @override
  int get medicationId => (origin as GetMedicationUseCaseProvider).medicationId;
}

String _$medicationsListHash() => r'7debc6c5cfa311f61d962f09cd46d40d10cf5c8d';

abstract class _$MedicationsList
    extends BuildlessAutoDisposeAsyncNotifier<List<Medication>> {
  late final int petId;
  late final bool activeOnly;

  FutureOr<List<Medication>> build(
    int petId, {
    bool activeOnly = true,
  });
}

/// See also [MedicationsList].
@ProviderFor(MedicationsList)
const medicationsListProvider = MedicationsListFamily();

/// See also [MedicationsList].
class MedicationsListFamily extends Family<AsyncValue<List<Medication>>> {
  /// See also [MedicationsList].
  const MedicationsListFamily();

  /// See also [MedicationsList].
  MedicationsListProvider call(
    int petId, {
    bool activeOnly = true,
  }) {
    return MedicationsListProvider(
      petId,
      activeOnly: activeOnly,
    );
  }

  @override
  MedicationsListProvider getProviderOverride(
    covariant MedicationsListProvider provider,
  ) {
    return call(
      provider.petId,
      activeOnly: provider.activeOnly,
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
  String? get name => r'medicationsListProvider';
}

/// See also [MedicationsList].
class MedicationsListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MedicationsList, List<Medication>> {
  /// See also [MedicationsList].
  MedicationsListProvider(
    int petId, {
    bool activeOnly = true,
  }) : this._internal(
          () => MedicationsList()
            ..petId = petId
            ..activeOnly = activeOnly,
          from: medicationsListProvider,
          name: r'medicationsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$medicationsListHash,
          dependencies: MedicationsListFamily._dependencies,
          allTransitiveDependencies:
              MedicationsListFamily._allTransitiveDependencies,
          petId: petId,
          activeOnly: activeOnly,
        );

  MedicationsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.petId,
    required this.activeOnly,
  }) : super.internal();

  final int petId;
  final bool activeOnly;

  @override
  FutureOr<List<Medication>> runNotifierBuild(
    covariant MedicationsList notifier,
  ) {
    return notifier.build(
      petId,
      activeOnly: activeOnly,
    );
  }

  @override
  Override overrideWith(MedicationsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: MedicationsListProvider._internal(
        () => create()
          ..petId = petId
          ..activeOnly = activeOnly,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        petId: petId,
        activeOnly: activeOnly,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MedicationsList, List<Medication>>
      createElement() {
    return _MedicationsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MedicationsListProvider &&
        other.petId == petId &&
        other.activeOnly == activeOnly;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, petId.hashCode);
    hash = _SystemHash.combine(hash, activeOnly.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MedicationsListRef
    on AutoDisposeAsyncNotifierProviderRef<List<Medication>> {
  /// The parameter `petId` of this provider.
  int get petId;

  /// The parameter `activeOnly` of this provider.
  bool get activeOnly;
}

class _MedicationsListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MedicationsList,
        List<Medication>> with MedicationsListRef {
  _MedicationsListProviderElement(super.provider);

  @override
  int get petId => (origin as MedicationsListProvider).petId;
  @override
  bool get activeOnly => (origin as MedicationsListProvider).activeOnly;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
