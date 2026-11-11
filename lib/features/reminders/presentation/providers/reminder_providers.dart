// ignore_for_file: type=lint
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/reminder_repository.dart';
import '../../domain/usecases/reminder_usecases.dart';
import '../../data/repositories/reminder_repository_impl.dart';
import '../../domain/entities/reminder.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../../core/di/providers.dart';

part 'reminder_providers.g.dart';

@riverpod
ReminderRepository reminderRepository(Ref ref) {
  return ReminderRepositoryImpl(
    ref.watch(reminderDaoProvider),
    ref.watch(databaseProvider),
  );
}

@riverpod
GetRemindersUseCase getRemindersUseCase(Ref ref) {
  return GetRemindersUseCase(ref.watch(reminderRepositoryProvider));
}

@riverpod
GetReminderUseCase getReminderUseCase(Ref ref) {
  return GetReminderUseCase(ref.watch(reminderRepositoryProvider));
}

@riverpod
WatchRemindersUseCase watchRemindersUseCase(Ref ref) {
  return WatchRemindersUseCase(ref.watch(reminderRepositoryProvider));
}

@riverpod
GetPendingRemindersUseCase getPendingRemindersUseCase(Ref ref) {
  return GetPendingRemindersUseCase(ref.watch(reminderRepositoryProvider));
}

@riverpod
CreateReminderUseCase createReminderUseCase(Ref ref) {
  return CreateReminderUseCase(ref.watch(reminderRepositoryProvider));
}

@riverpod
UpdateReminderUseCase updateReminderUseCase(Ref ref) {
  return UpdateReminderUseCase(ref.watch(reminderRepositoryProvider));
}

@riverpod
DeleteReminderUseCase deleteReminderUseCase(Ref ref) {
  return DeleteReminderUseCase(ref.watch(reminderRepositoryProvider));
}

final reminderDetailProvider = FutureProvider.family<Reminder?, int>((ref, reminderId) async {
  final repo = ref.watch(reminderRepositoryProvider);
  final result = await repo.getReminderById(reminderId);
  return result.fold((l) => null, (r) => r);
});

final userRemindersStreamProvider = StreamProvider<List<Reminder>>((ref) {
  final authState = ref.watch(authProvider);
  final userId = int.tryParse(authState.value?.id ?? '') ?? 0;
  final repo = ref.watch(reminderRepositoryProvider);
  return repo.watchRemindersByUserId(userId).map((result) => result.fold((l) => <Reminder>[], (r) => r));
});