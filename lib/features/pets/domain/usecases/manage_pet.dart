// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../repositories/pet_repository.dart';
import '../../domain/entities/pet.dart';
import '../../../../core/errors/app_exceptions.dart';

class CreatePetUseCase {
  final PetRepository repository;

  CreatePetUseCase(this.repository);

  Future<Either<AppException, Pet>> call(Pet pet) {
    return repository.createPet(pet);
  }
}

class UpdatePetUseCase {
  final PetRepository repository;

  UpdatePetUseCase(this.repository);

  Future<Either<AppException, Pet>> call(Pet pet) {
    return repository.updatePet(pet);
  }
}

class ArchivePetUseCase {
  final PetRepository repository;

  ArchivePetUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.archivePet(id);
  }
}

class DeletePetUseCase {
  final PetRepository repository;

  DeletePetUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.deletePet(id);
  }
}