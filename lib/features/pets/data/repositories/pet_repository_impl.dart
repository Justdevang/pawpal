// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/repositories/pet_repository.dart';
import '../../domain/entities/pet.dart';
import '../models/pet_model.dart';
import '../models/pet_model_extension.dart';
import '../../../../core/database/daos/pet_dao.dart';
import '../../../../core/database/database.dart' as db;
import '../../../../core/errors/app_exceptions.dart';

class PetRepositoryImpl implements PetRepository {
  final PetDao _petDao;
  // ignore: unused_field
  final db.AppDatabase _database;

  PetRepositoryImpl(this._petDao, this._database);

  @override
  Future<Either<AppException, List<Pet>>> getAllPets(int userId) async {
    try {
      final pets = await _petDao.getAllPets(userId);
      return Right(pets.map((p) => p.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get pets: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, List<Pet>>> watchAllPets(int userId) {
    try {
      return _petDao.watchAllPets(userId).map((pets) {
        return Right(pets.map((p) => p.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch pets: $e', originalError: e)));
    }
  }

  @override
  Future<Either<AppException, Pet?>> getPetById(int id) async {
    try {
      final pet = await _petDao.getPetById(id);
      if (pet == null) return const Right(null);
      return Right(pet.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to get pet: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, Pet>> createPet(Pet pet) async {
    try {
      final model = PetModel.fromEntity(pet);
      final id = await _petDao.insertPet(model.toCompanion(insert: true));
      final created = await _petDao.getPetById(id);
      if (created == null) {
        return Left(DatabaseException('Failed to create pet'));
      }
      return Right(created.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to create pet: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, Pet>> updatePet(Pet pet) async {
    try {
      final model = PetModel.fromEntity(pet.copyWith(updatedAt: DateTime.now()));
      await _petDao.updatePet(model.toCompanion());
      final updated = await _petDao.getPetById(pet.id);
      if (updated == null) {
        return Left(DatabaseException('Failed to update pet'));
      }
      return Right(updated.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to update pet: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> archivePet(int id) async {
    try {
      await _petDao.archivePet(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to archive pet: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> deletePet(int id) async {
    try {
      await _petDao.deletePet(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to delete pet: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, Pet?>> watchPet(int id) {
    try {
      return _petDao.watchPet(id).map((pet) {
        if (pet == null) return const Right<AppException, Pet?>(null);
        return Right(pet.toEntity());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch pet: $e', originalError: e)));
    }
  }
}