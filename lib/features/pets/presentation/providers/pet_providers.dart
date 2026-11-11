// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/pet_repository.dart';
import '../../domain/usecases/get_pets.dart';
import '../../domain/usecases/manage_pet.dart';
import '../../data/repositories/pet_repository_impl.dart';
import '../../domain/entities/pet.dart';
import '../../../../core/di/providers.dart';

part 'pet_providers.g.dart';

@riverpod
PetRepository petRepository(Ref ref) {
  return PetRepositoryImpl(ref.watch(petDaoProvider), ref.watch(databaseProvider));
}

@riverpod
GetPetsUseCase getPetsUseCase(Ref ref) {
  return GetPetsUseCase(ref.watch(petRepositoryProvider));
}

@riverpod
WatchPetsUseCase watchPetsUseCase(Ref ref) {
  return WatchPetsUseCase(ref.watch(petRepositoryProvider));
}

@riverpod
GetPetUseCase getPetUseCase(Ref ref) {
  return GetPetUseCase(ref.watch(petRepositoryProvider));
}

@riverpod
WatchPetUseCase watchPetUseCase(Ref ref) {
  return WatchPetUseCase(ref.watch(petRepositoryProvider));
}

@riverpod
CreatePetUseCase createPetUseCase(Ref ref) {
  return CreatePetUseCase(ref.watch(petRepositoryProvider));
}

@riverpod
UpdatePetUseCase updatePetUseCase(Ref ref) {
  return UpdatePetUseCase(ref.watch(petRepositoryProvider));
}

@riverpod
ArchivePetUseCase archivePetUseCase(Ref ref) {
  return ArchivePetUseCase(ref.watch(petRepositoryProvider));
}

@riverpod
DeletePetUseCase deletePetUseCase(Ref ref) {
  return DeletePetUseCase(ref.watch(petRepositoryProvider));
}

final petDetailStreamProvider = StreamProvider.family<Pet?, int>((ref, petId) {
  final useCase = ref.watch(watchPetUseCaseProvider);
  return useCase(petId).map((result) => result.fold((l) => null, (r) => r));
});