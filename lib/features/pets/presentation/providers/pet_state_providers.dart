// ignore_for_file: type=lint
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/pet.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'pet_providers.dart';

part 'pet_state_providers.g.dart';

@riverpod
class CurrentPet extends _$CurrentPet {
  @override
  Pet? build() => null;

  void setPet(Pet? pet) {
    state = pet;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class PetsList extends _$PetsList {
  @override
  Future<List<Pet>> build() async {
    final authState = ref.read(authProvider);
    final user = authState.value;
    if (user == null) return [];

    final result = await ref.watch(getPetsUseCaseProvider)(int.tryParse(user.id) ?? 0);
    return result.fold(
      (error) => throw error,
      (pets) => pets,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

@riverpod
class SelectedPetId extends _$SelectedPetId {
  @override
  int? build() {
    final petsAsync = ref.watch(petsListProvider);
    return petsAsync.whenOrNull(
      data: (pets) => pets.isNotEmpty ? pets.first.id : null,
    );
  }

  void select(int? petId) {
    state = petId;
  }
}

final selectedPetProvider = Provider.autoDispose<Pet?>((ref) {
  final petsAsync = ref.watch(petsListProvider);
  final selectedPetId = ref.watch(selectedPetIdProvider);
  return petsAsync.whenOrNull(
    data: (pets) => pets.cast<Pet?>().firstWhere(
          (p) => p?.id == selectedPetId,
          orElse: () => pets.isNotEmpty ? pets.first : null,
        ),
  );
});