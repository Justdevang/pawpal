// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../repositories/vaccination_repository.dart';
import '../../domain/entities/vaccine.dart';
import '../../domain/entities/vaccination_record.dart';
import '../../../../core/errors/app_exceptions.dart';

class GetVaccinationRecordsUseCase {
  final VaccinationRepository repository;

  GetVaccinationRecordsUseCase(this.repository);

  Future<Either<AppException, List<VaccinationRecord>>> call(int petId) {
    return repository.getRecordsByPetId(petId);
  }
}

class WatchVaccinationRecordsUseCase {
  final VaccinationRepository repository;

  WatchVaccinationRecordsUseCase(this.repository);

  Stream<Either<AppException, List<VaccinationRecord>>> call(int petId) {
    return repository.watchRecordsByPetId(petId);
  }
}

class GetVaccineTemplatesUseCase {
  final VaccinationRepository repository;

  GetVaccineTemplatesUseCase(this.repository);

  Future<Either<AppException, List<Vaccine>>> call({String species = 'dog', String region = 'global'}) {
    return repository.getVaccineTemplates(species, region: region);
  }
}

class GetCoreVaccinesUseCase {
  final VaccinationRepository repository;

  GetCoreVaccinesUseCase(this.repository);

  Future<Either<AppException, List<Vaccine>>> call({String species = 'dog', String region = 'global'}) {
    return repository.getCoreVaccines(species, region: region);
  }
}

class CreateVaccinationRecordUseCase {
  final VaccinationRepository repository;

  CreateVaccinationRecordUseCase(this.repository);

  Future<Either<AppException, VaccinationRecord>> call(VaccinationRecord record) {
    return repository.createRecord(record);
  }
}

class UpdateVaccinationRecordUseCase {
  final VaccinationRepository repository;

  UpdateVaccinationRecordUseCase(this.repository);

  Future<Either<AppException, VaccinationRecord>> call(VaccinationRecord record) {
    return repository.updateRecord(record);
  }
}

class DeleteVaccinationRecordUseCase {
  final VaccinationRepository repository;

  DeleteVaccinationRecordUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.deleteRecord(id);
  }
}

class GetUpcomingVaccinationsUseCase {
  final VaccinationRepository repository;

  GetUpcomingVaccinationsUseCase(this.repository);

  Future<Either<AppException, List<VaccinationRecord>>> call(int petId, DateTime until) {
    return repository.getUpcomingRecords(petId, until);
  }
}

class GetOverdueVaccinationsUseCase {
  final VaccinationRepository repository;

  GetOverdueVaccinationsUseCase(this.repository);

  Future<Either<AppException, List<VaccinationRecord>>> call(int petId, DateTime asOf) {
    return repository.getOverdueRecords(petId, asOf);
  }
}