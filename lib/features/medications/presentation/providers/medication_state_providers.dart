// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/medication.dart';
import 'medication_providers.dart';

part 'medication_state_providers.g.dart';

@riverpod
Future<Medication?> getMedicationUseCase(Ref ref, int medicationId) {
  final repository = ref.watch(medicationRepositoryProvider);
  return repository.getMedicationById(medicationId).then((result) => result.fold((l) => throw l, (r) => r));
}

@riverpod
class MedicationsList extends _$MedicationsList {
  @override
  Future<List<Medication>> build(int petId, {bool activeOnly = true}) async {
    final repository = ref.watch(medicationRepositoryProvider);
    final result = await repository.getMedicationsByPetId(petId, activeOnly: activeOnly);
    return result.fold((l) => throw l, (r) => r);
  }

  Future<void> refresh(int petId, {bool activeOnly = true}) async {
    ref.invalidateSelf();
  }
}