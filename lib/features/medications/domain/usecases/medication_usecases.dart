// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../repositories/medication_repository.dart';
import '../../domain/entities/medication.dart';
import '../../domain/entities/dose_schedule.dart';
import '../../domain/entities/dose_log.dart';
import '../../../../core/errors/app_exceptions.dart';

class GetMedicationsUseCase {
  final MedicationRepository repository;

  GetMedicationsUseCase(this.repository);

  Future<Either<AppException, List<Medication>>> call(int petId, {bool activeOnly = true}) {
    return repository.getMedicationsByPetId(petId, activeOnly: activeOnly);
  }
}

class WatchMedicationsUseCase {
  final MedicationRepository repository;

  WatchMedicationsUseCase(this.repository);

  Stream<Either<AppException, List<Medication>>> call(int petId, {bool activeOnly = true}) {
    return repository.watchMedicationsByPetId(petId, activeOnly: activeOnly);
  }
}

class GetMedicationUseCase {
  final MedicationRepository repository;

  GetMedicationUseCase(this.repository);

  Future<Either<AppException, Medication?>> call(int id) {
    return repository.getMedicationById(id);
  }
}

class CreateMedicationUseCase {
  final MedicationRepository repository;

  CreateMedicationUseCase(this.repository);

  Future<Either<AppException, Medication>> call(Medication medication) {
    return repository.createMedication(medication);
  }
}

class UpdateMedicationUseCase {
  final MedicationRepository repository;

  UpdateMedicationUseCase(this.repository);

  Future<Either<AppException, Medication>> call(Medication medication) {
    return repository.updateMedication(medication);
  }
}

class DeleteMedicationUseCase {
  final MedicationRepository repository;

  DeleteMedicationUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.deleteMedication(id);
  }
}

class GetMedicationsNeedingRefillUseCase {
  final MedicationRepository repository;

  GetMedicationsNeedingRefillUseCase(this.repository);

  Future<Either<AppException, List<Medication>>> call(int petId) {
    return repository.getMedicationsNeedingRefill(petId);
  }
}

class GetDoseSchedulesUseCase {
  final MedicationRepository repository;

  GetDoseSchedulesUseCase(this.repository);

  Future<Either<AppException, List<DoseSchedule>>> call(int medicationId, {DateTime? from, DateTime? to}) {
    return repository.getSchedulesByMedicationId(medicationId, from: from, to: to);
  }
}

class WatchDoseSchedulesUseCase {
  final MedicationRepository repository;

  WatchDoseSchedulesUseCase(this.repository);

  Stream<Either<AppException, List<DoseSchedule>>> call(int medicationId, {DateTime? from, DateTime? to}) {
    return repository.watchSchedulesByMedicationId(medicationId, from: from, to: to);
  }
}

class GetPendingSchedulesUseCase {
  final MedicationRepository repository;

  GetPendingSchedulesUseCase(this.repository);

  Future<Either<AppException, List<DoseSchedule>>> call(int medicationId, DateTime before) {
    return repository.getPendingSchedules(medicationId, before);
  }
}

class CreateDoseSchedulesUseCase {
  final MedicationRepository repository;

  CreateDoseSchedulesUseCase(this.repository);

  Future<Either<AppException, void>> call(List<DoseSchedule> schedules) {
    return repository.createSchedules(schedules);
  }
}

class MarkDoseTakenUseCase {
  final MedicationRepository repository;

  MarkDoseTakenUseCase(this.repository);

  Future<Either<AppException, void>> call(int scheduleId, DateTime takenAt) {
    return repository.markDoseTaken(scheduleId, takenAt);
  }
}

class MarkDoseSkippedUseCase {
  final MedicationRepository repository;

  MarkDoseSkippedUseCase(this.repository);

  Future<Either<AppException, void>> call(int scheduleId) {
    return repository.markDoseSkipped(scheduleId);
  }
}

class GetDoseLogsUseCase {
  final MedicationRepository repository;

  GetDoseLogsUseCase(this.repository);

  Future<Either<AppException, List<DoseLog>>> call(int medicationId, {DateTime? from, DateTime? to}) {
    return repository.getLogsByMedicationId(medicationId, from: from, to: to);
  }
}

class WatchDoseLogsUseCase {
  final MedicationRepository repository;

  WatchDoseLogsUseCase(this.repository);

  Stream<Either<AppException, List<DoseLog>>> call(int medicationId, {DateTime? from, DateTime? to}) {
    return repository.watchLogsByMedicationId(medicationId, from: from, to: to);
  }
}

class LogDoseUseCase {
  final MedicationRepository repository;

  LogDoseUseCase(this.repository);

  Future<Either<AppException, DoseLog>> call(DoseLog log) {
    return repository.logDose(log);
  }
}

class GetAdherenceStreakUseCase {
  final MedicationRepository repository;

  GetAdherenceStreakUseCase(this.repository);

  Future<Either<AppException, int>> call(int medicationId) {
    return repository.getAdherenceStreak(medicationId);
  }
}