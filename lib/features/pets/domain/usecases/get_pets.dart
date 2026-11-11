// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../repositories/pet_repository.dart';
import '../../domain/entities/pet.dart';
import '../../../../core/errors/app_exceptions.dart';

class GetPetsUseCase {
  final PetRepository repository;

  GetPetsUseCase(this.repository);

  Future<Either<AppException, List<Pet>>> call(int userId) {
    return repository.getAllPets(userId);
  }
}

class WatchPetsUseCase {
  final PetRepository repository;

  WatchPetsUseCase(this.repository);

  Stream<Either<AppException, List<Pet>>> call(int userId) {
    return repository.watchAllPets(userId);
  }
}

class GetPetUseCase {
  final PetRepository repository;

  GetPetUseCase(this.repository);

  Future<Either<AppException, Pet?>> call(int id) {
    return repository.getPetById(id);
  }
}

class WatchPetUseCase {
  final PetRepository repository;

  WatchPetUseCase(this.repository);

  Stream<Either<AppException, Pet?>> call(int id) {
    return repository.watchPet(id);
  }
}