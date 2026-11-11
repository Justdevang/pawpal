// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../repositories/vaccination_repository.dart';
import '../../domain/entities/vaccination_record.dart';
import '../../../../core/errors/app_exceptions.dart';

class GetVaccinationRecordUseCase {
  final VaccinationRepository repository;

  GetVaccinationRecordUseCase(this.repository);

  Future<Either<AppException, VaccinationRecord?>> call(int id) {
    return repository.getRecordById(id);
  }
}