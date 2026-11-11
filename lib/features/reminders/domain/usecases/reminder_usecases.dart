// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../repositories/reminder_repository.dart';
import '../../domain/entities/reminder.dart';
import '../../../../core/errors/app_exceptions.dart';

class GetRemindersUseCase {
  final ReminderRepository repository;

  GetRemindersUseCase(this.repository);

  Future<Either<AppException, List<Reminder>>> call(int userId) {
    return repository.getRemindersByUserId(userId);
  }
}

class WatchRemindersUseCase {
  final ReminderRepository repository;

  WatchRemindersUseCase(this.repository);

  Stream<Either<AppException, List<Reminder>>> call(int userId) {
    return repository.watchRemindersByUserId(userId);
  }
}

class GetRemindersByPetUseCase {
  final ReminderRepository repository;

  GetRemindersByPetUseCase(this.repository);

  Future<Either<AppException, List<Reminder>>> call(int petId) {
    return repository.getRemindersByPetId(petId);
  }
}

class GetPendingRemindersUseCase {
  final ReminderRepository repository;

  GetPendingRemindersUseCase(this.repository);

  Future<Either<AppException, List<Reminder>>> call(DateTime before) {
    return repository.getPendingReminders(before);
  }
}

class GetReminderUseCase {
  final ReminderRepository repository;

  GetReminderUseCase(this.repository);

  Future<Either<AppException, Reminder?>> call(int id) {
    return repository.getReminderById(id);
  }
}

class CreateReminderUseCase {
  final ReminderRepository repository;

  CreateReminderUseCase(this.repository);

  Future<Either<AppException, Reminder>> call(Reminder reminder) {
    return repository.createReminder(reminder);
  }
}

class UpdateReminderUseCase {
  final ReminderRepository repository;

  UpdateReminderUseCase(this.repository);

  Future<Either<AppException, Reminder>> call(Reminder reminder) {
    return repository.updateReminder(reminder);
  }
}

class DeleteReminderUseCase {
  final ReminderRepository repository;

  DeleteReminderUseCase(this.repository);

  Future<Either<AppException, void>> call(int id) {
    return repository.deleteReminder(id);
  }
}