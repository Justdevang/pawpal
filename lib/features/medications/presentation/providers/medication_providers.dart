// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/medication_repository.dart';
import '../../domain/usecases/medication_usecases.dart';
import '../../data/repositories/medication_repository_impl.dart';
import '../../../../core/di/providers.dart';

part 'medication_providers.g.dart';

@riverpod
MedicationRepository medicationRepository(Ref ref) {
  return MedicationRepositoryImpl(
    ref.watch(medicationDaoProvider),
    ref.watch(doseScheduleDaoProvider),
    ref.watch(doseLogDaoProvider),
    ref.watch(databaseProvider),
  );
}

@riverpod
GetMedicationsUseCase getMedicationsUseCase(Ref ref) {
  return GetMedicationsUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
WatchMedicationsUseCase watchMedicationsUseCase(Ref ref) {
  return WatchMedicationsUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
CreateMedicationUseCase createMedicationUseCase(Ref ref) {
  return CreateMedicationUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
UpdateMedicationUseCase updateMedicationUseCase(Ref ref) {
  return UpdateMedicationUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
DeleteMedicationUseCase deleteMedicationUseCase(Ref ref) {
  return DeleteMedicationUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
GetMedicationsNeedingRefillUseCase getMedicationsNeedingRefillUseCase(Ref ref) {
  return GetMedicationsNeedingRefillUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
GetDoseSchedulesUseCase getDoseSchedulesUseCase(Ref ref) {
  return GetDoseSchedulesUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
WatchDoseSchedulesUseCase watchDoseSchedulesUseCase(Ref ref) {
  return WatchDoseSchedulesUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
GetPendingSchedulesUseCase getPendingSchedulesUseCase(Ref ref) {
  return GetPendingSchedulesUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
CreateDoseSchedulesUseCase createDoseSchedulesUseCase(Ref ref) {
  return CreateDoseSchedulesUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
MarkDoseTakenUseCase markDoseTakenUseCase(Ref ref) {
  return MarkDoseTakenUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
MarkDoseSkippedUseCase markDoseSkippedUseCase(Ref ref) {
  return MarkDoseSkippedUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
GetDoseLogsUseCase getDoseLogsUseCase(Ref ref) {
  return GetDoseLogsUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
WatchDoseLogsUseCase watchDoseLogsUseCase(Ref ref) {
  return WatchDoseLogsUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
LogDoseUseCase logDoseUseCase(Ref ref) {
  return LogDoseUseCase(ref.watch(medicationRepositoryProvider));
}

@riverpod
GetAdherenceStreakUseCase getAdherenceStreakUseCase(Ref ref) {
  return GetAdherenceStreakUseCase(ref.watch(medicationRepositoryProvider));
}