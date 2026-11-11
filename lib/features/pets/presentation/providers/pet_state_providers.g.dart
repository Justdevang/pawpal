// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentPetHash() => r'e58c4e66d1efe1dd655bc570f98c8b1fe5d8041d';

/// See also [CurrentPet].
@ProviderFor(CurrentPet)
final currentPetProvider =
    AutoDisposeNotifierProvider<CurrentPet, Pet?>.internal(
  CurrentPet.new,
  name: r'currentPetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentPetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentPet = AutoDisposeNotifier<Pet?>;
String _$petsListHash() => r'20c37105d0e59052c93058ed95d6d078062e7926';

/// See also [PetsList].
@ProviderFor(PetsList)
final petsListProvider =
    AutoDisposeAsyncNotifierProvider<PetsList, List<Pet>>.internal(
  PetsList.new,
  name: r'petsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$petsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PetsList = AutoDisposeAsyncNotifier<List<Pet>>;
String _$selectedPetIdHash() => r'0c7474d6db3e348a6fd7b0c96d2ac41d03a9c645';

/// See also [SelectedPetId].
@ProviderFor(SelectedPetId)
final selectedPetIdProvider =
    AutoDisposeNotifierProvider<SelectedPetId, int?>.internal(
  SelectedPetId.new,
  name: r'selectedPetIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedPetIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedPetId = AutoDisposeNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
