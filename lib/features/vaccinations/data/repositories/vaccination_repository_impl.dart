// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

import '../../domain/repositories/vaccination_repository.dart';
import '../../domain/entities/vaccine.dart';
import '../../domain/entities/vaccination_record.dart';
import '../models/vaccination_models.dart';
import '../models/vaccination_models_extension.dart';
import '../../../../core/database/daos/vaccine_dao.dart';
import '../../../../core/database/daos/vaccination_record_dao.dart';
import '../../../../core/database/database.dart' as db;
import '../../../../core/errors/app_exceptions.dart';

class VaccinationRepositoryImpl implements VaccinationRepository {
  final VaccineDao _vaccineDao;
  final VaccinationRecordDao _recordDao;
  final db.AppDatabase _database;

  VaccinationRepositoryImpl(this._vaccineDao, this._recordDao, this._database);

  @override
  Future<Either<AppException, List<Vaccine>>> getVaccineTemplates(String species, {String region = 'global'}) async {
    try {
      final vaccines = await _vaccineDao.getVaccinesBySpecies(species, region: region);
      return Right(vaccines.map((v) => v.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get vaccine templates: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<Vaccine>>> getCoreVaccines(String species, {String region = 'global'}) async {
    try {
      final vaccines = await _vaccineDao.getCoreVaccinesBySpecies(species, region: region);
      return Right(vaccines.map((v) => v.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get core vaccines: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<VaccinationRecord>>> getRecordsByPetId(int petId) async {
    try {
      final records = await _recordDao.getRecordsByPetId(petId);
      return Right(records.map((r) => r.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get vaccination records: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, List<VaccinationRecord>>> watchRecordsByPetId(int petId) {
    try {
      return _recordDao.watchRecordsByPetId(petId).map((records) {
        return Right(records.map((r) => r.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch vaccination records: $e', originalError: e)));
    }
  }

  @override
  Future<Either<AppException, VaccinationRecord?>> getRecordById(int id) async {
    try {
      final record = await _recordDao.getRecordById(id);
      if (record == null) return const Right(null);
      return Right(record.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to get vaccination record: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, VaccinationRecord>> createRecord(VaccinationRecord record) async {
    try {
      int effectiveVaccineId = record.vaccineId;
      if (effectiveVaccineId <= 0) {
        final existing = await (_database.select(_database.vaccines)..where((v) => v.name.equals(record.vaccineName))).getSingleOrNull();
        if (existing != null) {
          effectiveVaccineId = existing.id;
        } else {
          effectiveVaccineId = await _database.into(_database.vaccines).insert(
            db.VaccinesCompanion.insert(
              name: record.vaccineName,
              species: 'dog',
              isCore: const Value(true),
            ),
          );
        }
      }
      final fixedRecord = record.copyWith(vaccineId: effectiveVaccineId);
      final model = VaccinationRecordModel.fromEntity(fixedRecord);
      final id = await _recordDao.insertRecord(model.toCompanion(insert: true));
      final created = await _recordDao.getRecordById(id);
      if (created == null) {
        return Left(DatabaseException('Failed to create vaccination record'));
      }
      return Right(created.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to create vaccination record: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, VaccinationRecord>> updateRecord(VaccinationRecord record) async {
    try {
      final model = VaccinationRecordModel.fromEntity(record.copyWith(updatedAt: DateTime.now()));
      await _recordDao.updateRecord(model.toCompanion());
      final updated = await _recordDao.getRecordById(record.id);
      if (updated == null) {
        return Left(DatabaseException('Failed to update vaccination record'));
      }
      return Right(updated.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to update vaccination record: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> deleteRecord(int id) async {
    try {
      await _recordDao.softDeleteRecord(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to delete vaccination record: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<VaccinationRecord>>> getUpcomingRecords(int petId, DateTime until) async {
    try {
      final records = await _recordDao.getUpcomingRecords(petId, until);
      return Right(records.map((r) => r.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get upcoming records: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<VaccinationRecord>>> getOverdueRecords(int petId, DateTime asOf) async {
    try {
      final records = await _recordDao.getOverdueRecords(petId, asOf);
      return Right(records.map((r) => r.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get overdue records: $e', originalError: e));
    }
  }
}