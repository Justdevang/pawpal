// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/entities/vaccine.dart';
import '../../domain/entities/vaccination_record.dart';
import '../../../../core/errors/app_exceptions.dart';

abstract class VaccinationRepository {
  // Vaccine templates
  Future<Either<AppException, List<Vaccine>>> getVaccineTemplates(String species, {String region = 'global'});
  Future<Either<AppException, List<Vaccine>>> getCoreVaccines(String species, {String region = 'global'});

  // Vaccination records
  Future<Either<AppException, List<VaccinationRecord>>> getRecordsByPetId(int petId);
  Stream<Either<AppException, List<VaccinationRecord>>> watchRecordsByPetId(int petId);
  Future<Either<AppException, VaccinationRecord?>> getRecordById(int id);
  Future<Either<AppException, VaccinationRecord>> createRecord(VaccinationRecord record);
  Future<Either<AppException, VaccinationRecord>> updateRecord(VaccinationRecord record);
  Future<Either<AppException, void>> deleteRecord(int id);

  // Upcoming/Overdue
  Future<Either<AppException, List<VaccinationRecord>>> getUpcomingRecords(int petId, DateTime until);
  Future<Either<AppException, List<VaccinationRecord>>> getOverdueRecords(int petId, DateTime asOf);
}