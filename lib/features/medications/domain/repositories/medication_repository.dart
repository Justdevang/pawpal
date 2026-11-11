// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/entities/medication.dart';
import '../../domain/entities/dose_schedule.dart';
import '../../domain/entities/dose_log.dart';
import '../../../../core/errors/app_exceptions.dart';

abstract class MedicationRepository {
  Future<Either<AppException, List<Medication>>> getMedicationsByPetId(int petId, {bool activeOnly = true});
  Stream<Either<AppException, List<Medication>>> watchMedicationsByPetId(int petId, {bool activeOnly = true});
  Future<Either<AppException, Medication?>> getMedicationById(int id);
  Future<Either<AppException, Medication>> createMedication(Medication medication);
  Future<Either<AppException, Medication>> updateMedication(Medication medication);
  Future<Either<AppException, void>> deleteMedication(int id);
  Future<Either<AppException, List<Medication>>> getMedicationsNeedingRefill(int petId);

  // Dose schedules
  Future<Either<AppException, List<DoseSchedule>>> getSchedulesByMedicationId(int medicationId, {DateTime? from, DateTime? to});
  Stream<Either<AppException, List<DoseSchedule>>> watchSchedulesByMedicationId(int medicationId, {DateTime? from, DateTime? to});
  Future<Either<AppException, List<DoseSchedule>>> getPendingSchedules(int medicationId, DateTime before);
  Future<Either<AppException, void>> createSchedules(List<DoseSchedule> schedules);
  Future<Either<AppException, void>> markDoseTaken(int scheduleId, DateTime takenAt);
  Future<Either<AppException, void>> markDoseSkipped(int scheduleId);

  // Dose logs
  Future<Either<AppException, List<DoseLog>>> getLogsByMedicationId(int medicationId, {DateTime? from, DateTime? to});
  Stream<Either<AppException, List<DoseLog>>> watchLogsByMedicationId(int medicationId, {DateTime? from, DateTime? to});
  Future<Either<AppException, DoseLog>> logDose(DoseLog log);
  Future<Either<AppException, int>> getAdherenceStreak(int medicationId);
}