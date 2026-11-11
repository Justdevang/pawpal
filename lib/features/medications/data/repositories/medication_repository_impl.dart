// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/repositories/medication_repository.dart';
import '../../domain/entities/medication.dart';
import '../../domain/entities/dose_schedule.dart';
import '../../domain/entities/dose_log.dart';
import '../models/medication_models.dart';
import '../models/medication_models_extension.dart';
import '../../../../core/database/daos/medication_dao.dart';
import '../../../../core/database/daos/dose_schedule_dao.dart';
import '../../../../core/database/daos/dose_log_dao.dart';
import '../../../../core/database/database.dart' as db;
import '../../../../core/errors/app_exceptions.dart';

class MedicationRepositoryImpl implements MedicationRepository {
  final MedicationDao _medicationDao;
  final DoseScheduleDao _scheduleDao;
  final DoseLogDao _logDao;
  // ignore: unused_field
  final db.AppDatabase _database;

  MedicationRepositoryImpl(this._medicationDao, this._scheduleDao, this._logDao, this._database);

  @override
  Future<Either<AppException, List<Medication>>> getMedicationsByPetId(int petId, {bool activeOnly = true}) async {
    try {
      final medications = await _medicationDao.getMedicationsByPetId(petId, activeOnly: activeOnly);
      return Right(medications.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get medications: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, List<Medication>>> watchMedicationsByPetId(int petId, {bool activeOnly = true}) {
    try {
      return _medicationDao.watchMedicationsByPetId(petId, activeOnly: activeOnly).map((medications) {
        return Right(medications.map((m) => m.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch medications: $e', originalError: e)));
    }
  }

  @override
  Future<Either<AppException, Medication?>> getMedicationById(int id) async {
    try {
      final medication = await _medicationDao.getMedicationById(id);
      if (medication == null) return const Right(null);
      return Right(medication.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to get medication: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, Medication>> createMedication(Medication medication) async {
    try {
      final model = MedicationModel.fromEntity(medication);
      final id = await _medicationDao.insertMedication(model.toCompanion(insert: true));
      final created = await _medicationDao.getMedicationById(id);
      if (created == null) {
        return Left(DatabaseException('Failed to create medication'));
      }
      return Right(created.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to create medication: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, Medication>> updateMedication(Medication medication) async {
    try {
      final model = MedicationModel.fromEntity(medication.copyWith(updatedAt: DateTime.now()));
      await _medicationDao.updateMedication(model.toCompanion());
      final updated = await _medicationDao.getMedicationById(medication.id);
      if (updated == null) {
        return Left(DatabaseException('Failed to update medication'));
      }
      return Right(updated.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to update medication: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> deleteMedication(int id) async {
    try {
      await _medicationDao.softDeleteMedication(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to delete medication: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<Medication>>> getMedicationsNeedingRefill(int petId) async {
    try {
      final medications = await _medicationDao.getMedicationsNeedingRefill(petId);
      return Right(medications.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get medications needing refill: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<DoseSchedule>>> getSchedulesByMedicationId(int medicationId, {DateTime? from, DateTime? to}) async {
    try {
      final schedules = await _scheduleDao.getSchedulesByMedicationId(medicationId, from: from, to: to);
      return Right(schedules.map((s) => s.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get dose schedules: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, List<DoseSchedule>>> watchSchedulesByMedicationId(int medicationId, {DateTime? from, DateTime? to}) {
    try {
      return _scheduleDao.watchSchedulesByMedicationId(medicationId, from: from, to: to).map((schedules) {
        return Right(schedules.map((s) => s.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch dose schedules: $e', originalError: e)));
    }
  }

  @override
  Future<Either<AppException, List<DoseSchedule>>> getPendingSchedules(int medicationId, DateTime before) async {
    try {
      final schedules = await _scheduleDao.getPendingSchedules(medicationId, before);
      return Right(schedules.map((s) => s.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get pending schedules: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> createSchedules(List<DoseSchedule> schedules) async {
    try {
      final companions = schedules.map((s) => DoseScheduleModel.fromEntity(s).toCompanion(insert: true)).toList();
      await _scheduleDao.insertSchedules(companions);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to create dose schedules: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> markDoseTaken(int scheduleId, DateTime takenAt) async {
    try {
      await _scheduleDao.markAsTaken(scheduleId, takenAt);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to mark dose as taken: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> markDoseSkipped(int scheduleId) async {
    try {
      await _scheduleDao.markAsSkipped(scheduleId);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to mark dose as skipped: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<DoseLog>>> getLogsByMedicationId(int medicationId, {DateTime? from, DateTime? to}) async {
    try {
      final logs = await _logDao.getLogsByMedicationId(medicationId, from: from, to: to);
      return Right(logs.map((l) => l.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get dose logs: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, List<DoseLog>>> watchLogsByMedicationId(int medicationId, {DateTime? from, DateTime? to}) {
    try {
      return _logDao.watchLogsByMedicationId(medicationId, from: from, to: to).map((logs) {
        return Right(logs.map((l) => l.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch dose logs: $e', originalError: e)));
    }
  }

  @override
  Future<Either<AppException, DoseLog>> logDose(DoseLog log) async {
    try {
      final model = DoseLogModel.fromEntity(log);
      await _logDao.insertLog(model.toCompanion(insert: true));
      final created = await _logDao.getLogsByMedicationId(log.medicationId, from: log.scheduledTime, to: log.scheduledTime);
      if (created.isEmpty) {
        return Left(DatabaseException('Failed to log dose'));
      }
      return Right(created.first.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to log dose: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, int>> getAdherenceStreak(int medicationId) async {
    try {
      final streak = await _logDao.getAdherenceStreak(medicationId);
      return Right(streak);
    } catch (e) {
      return Left(DatabaseException('Failed to get adherence streak: $e', originalError: e));
    }
  }
}