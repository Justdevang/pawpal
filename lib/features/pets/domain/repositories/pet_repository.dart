// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/entities/pet.dart';
import '../../../../core/errors/app_exceptions.dart';

abstract class PetRepository {
  Future<Either<AppException, List<Pet>>> getAllPets(int userId);
  Stream<Either<AppException, List<Pet>>> watchAllPets(int userId);
  Future<Either<AppException, Pet?>> getPetById(int id);
  Future<Either<AppException, Pet>> createPet(Pet pet);
  Future<Either<AppException, Pet>> updatePet(Pet pet);
  Future<Either<AppException, void>> archivePet(int id);
  Future<Either<AppException, void>> deletePet(int id);
  Stream<Either<AppException, Pet?>> watchPet(int id);
}