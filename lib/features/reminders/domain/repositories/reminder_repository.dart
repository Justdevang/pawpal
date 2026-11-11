// ignore_for_file: type=lint
import 'package:dartz/dartz.dart';

import '../../domain/entities/reminder.dart';
import '../../../../core/errors/app_exceptions.dart';

abstract class ReminderRepository {
  Future<Either<AppException, List<Reminder>>> getRemindersByUserId(int userId);
  Stream<Either<AppException, List<Reminder>>> watchRemindersByUserId(int userId);
  Future<Either<AppException, List<Reminder>>> getRemindersByPetId(int petId);
  Future<Either<AppException, List<Reminder>>> getPendingReminders(DateTime before);
  Future<Either<AppException, Reminder?>> getReminderById(int id);
  Future<Either<AppException, Reminder>> createReminder(Reminder reminder);
  Future<Either<AppException, Reminder>> updateReminder(Reminder reminder);
  Future<Either<AppException, void>> deleteReminder(int id);
  Future<Either<AppException, void>> updateNextTrigger(int id, DateTime nextTrigger);
  Future<Either<AppException, void>> incrementEscalation(int id);
}