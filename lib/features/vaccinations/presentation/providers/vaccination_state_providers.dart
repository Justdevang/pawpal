// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/app_exceptions.dart';
import '../../domain/entities/vaccination_record.dart';
import 'vaccination_providers.dart';

part 'vaccination_state_providers.g.dart';

@riverpod
Future<VaccinationRecord?> vaccinationRecordDetail(final Ref ref, final int recordId) async {
  final repository = ref.watch(vaccinationRepositoryProvider);
  final result = await repository.getRecordById(recordId);
  return result.fold((final AppException l) => throw l, (final VaccinationRecord? r) => r);
}

@riverpod
class VaccinationRecordsList extends _$VaccinationRecordsList {
  @override
  Future<List<VaccinationRecord>> build(final int petId) async {
    final repository = ref.watch(vaccinationRepositoryProvider);
    final result = await repository.getRecordsByPetId(petId);
    return result.fold((final AppException l) => throw l, (final List<VaccinationRecord> r) => r);
  }

  Future<void> refresh(final int petId) async {
    ref.invalidateSelf();
  }
}