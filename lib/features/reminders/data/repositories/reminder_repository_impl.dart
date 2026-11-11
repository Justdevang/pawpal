// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/repositories/reminder_repository.dart';
import '../../domain/entities/reminder.dart';
import '../models/reminder_model.dart';
import '../models/reminder_model_extension.dart';
import '../../../../core/database/daos/reminder_dao.dart';
import '../../../../core/database/database.dart' as db;
import '../../../../core/errors/app_exceptions.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderDao _reminderDao;
  // ignore: unused_field
  final db.AppDatabase _database;

  ReminderRepositoryImpl(this._reminderDao, this._database);

  @override
  Future<Either<AppException, List<Reminder>>> getRemindersByUserId(int userId) async {
    try {
      final reminders = await _reminderDao.getRemindersByUserId(userId);
      return Right(reminders.map((r) => r.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get reminders: $e', originalError: e));
    }
  }

  @override
  Stream<Either<AppException, List<Reminder>>> watchRemindersByUserId(int userId) {
    try {
      return _reminderDao.watchRemindersByUserId(userId).map((reminders) {
        return Right(reminders.map((r) => r.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(Left(DatabaseException('Failed to watch reminders: $e', originalError: e)));
    }
  }

  @override
  Future<Either<AppException, List<Reminder>>> getRemindersByPetId(int petId) async {
    try {
      final reminders = await _reminderDao.getRemindersByPetId(petId);
      return Right(reminders.map((r) => r.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get reminders by pet: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, List<Reminder>>> getPendingReminders(DateTime before) async {
    try {
      final reminders = await _reminderDao.getPendingReminders(before);
      return Right(reminders.map((r) => r.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseException('Failed to get pending reminders: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, Reminder?>> getReminderById(int id) async {
    try {
      final reminder = await _reminderDao.getReminderById(id);
      if (reminder == null) return const Right(null);
      return Right(reminder.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to get reminder: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, Reminder>> createReminder(Reminder reminder) async {
    try {
      final model = ReminderModel.fromEntity(reminder);
      final id = await _reminderDao.insertReminder(model.toCompanion(insert: true));
      final created = await _reminderDao.getReminderById(id);
      if (created == null) {
        return Left(DatabaseException('Failed to create reminder'));
      }
      return Right(created.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to create reminder: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, Reminder>> updateReminder(Reminder reminder) async {
    try {
      final model = ReminderModel.fromEntity(reminder.copyWith(updatedAt: DateTime.now()));
      await _reminderDao.updateReminder(model.toCompanion());
      final updated = await _reminderDao.getReminderById(reminder.id);
      if (updated == null) {
        return Left(DatabaseException('Failed to update reminder'));
      }
      return Right(updated.toEntity());
    } catch (e) {
      return Left(DatabaseException('Failed to update reminder: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> deleteReminder(int id) async {
    try {
      await _reminderDao.softDeleteReminder(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to delete reminder: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> updateNextTrigger(int id, DateTime nextTrigger) async {
    try {
      await _reminderDao.updateNextTrigger(id, nextTrigger);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to update next trigger: $e', originalError: e));
    }
  }

  @override
  Future<Either<AppException, void>> incrementEscalation(int id) async {
    try {
      await _reminderDao.incrementEscalation(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseException('Failed to increment escalation: $e', originalError: e));
    }
  }
}