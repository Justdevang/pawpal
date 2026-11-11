// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/dashboard_usecases.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../pets/presentation/providers/pet_providers.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../../../vaccinations/presentation/providers/vaccination_providers.dart';
import '../../../medications/presentation/providers/medication_providers.dart';
import '../../../reminders/presentation/providers/reminder_providers.dart';

part 'dashboard_providers.g.dart';

@riverpod
GetDashboardDataUseCase getDashboardDataUseCase(Ref ref) {
  // This would use repositories from various features
  // For now, we'll create a combined use case
  return GetDashboardDataUseCase(
    petRepository: ref.watch(petRepositoryProvider),
    vaccinationRepository: ref.watch(vaccinationRepositoryProvider),
    medicationRepository: ref.watch(medicationRepositoryProvider),
    reminderRepository: ref.watch(reminderRepositoryProvider),
  );
}

@riverpod
class DashboardData extends _$DashboardData {
  @override
  Future<DashboardDataEntity> build() async {
    final authState = ref.watch(authProvider);
    final user = authState.value;
    final selectedPetId = ref.watch(selectedPetIdProvider);

    if (user == null || selectedPetId == null) {
      return DashboardDataEntity.empty();
    }

    final useCase = ref.watch(getDashboardDataUseCaseProvider);
    final result = await useCase(int.tryParse(user.id) ?? 0, selectedPetId);
    return result.fold((l) => throw l, (r) => r);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}