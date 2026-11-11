// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/vaccination_repository.dart';
import '../../domain/usecases/vaccination_usecases.dart';
import '../../domain/usecases/get_vaccination_record.dart';
import '../../data/repositories/vaccination_repository_impl.dart';
import '../../../../core/di/providers.dart';

part 'vaccination_providers.g.dart';

@riverpod
VaccinationRepository vaccinationRepository(Ref ref) {
  return VaccinationRepositoryImpl(
    ref.watch(vaccineDaoProvider),
    ref.watch(vaccinationRecordDaoProvider),
    ref.watch(databaseProvider),
  );
}

@riverpod
GetVaccinationRecordsUseCase getVaccinationRecordsUseCase(Ref ref) {
  return GetVaccinationRecordsUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
WatchVaccinationRecordsUseCase watchVaccinationRecordsUseCase(Ref ref) {
  return WatchVaccinationRecordsUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
GetVaccineTemplatesUseCase getVaccineTemplatesUseCase(Ref ref) {
  return GetVaccineTemplatesUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
GetCoreVaccinesUseCase getCoreVaccinesUseCase(Ref ref) {
  return GetCoreVaccinesUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
CreateVaccinationRecordUseCase createVaccinationRecordUseCase(Ref ref) {
  return CreateVaccinationRecordUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
UpdateVaccinationRecordUseCase updateVaccinationRecordUseCase(Ref ref) {
  return UpdateVaccinationRecordUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
DeleteVaccinationRecordUseCase deleteVaccinationRecordUseCase(Ref ref) {
  return DeleteVaccinationRecordUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
GetVaccinationRecordUseCase getVaccinationRecordUseCase(Ref ref) {
  return GetVaccinationRecordUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
GetUpcomingVaccinationsUseCase getUpcomingVaccinationsUseCase(Ref ref) {
  return GetUpcomingVaccinationsUseCase(ref.watch(vaccinationRepositoryProvider));
}

@riverpod
GetOverdueVaccinationsUseCase getOverdueVaccinationsUseCase(Ref ref) {
  return GetOverdueVaccinationsUseCase(ref.watch(vaccinationRepositoryProvider));
}