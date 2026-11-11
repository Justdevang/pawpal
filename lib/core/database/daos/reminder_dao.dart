// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/reminders.dart';

part 'reminder_dao.g.dart';

@DriftAccessor(tables: [Reminders])
class ReminderDao extends DatabaseAccessor<AppDatabase> with _$ReminderDaoMixin {
  ReminderDao(super.db);

  Future<List<Reminder>> getRemindersByUserId(int userId) {
    return (select(reminders)
          ..where((r) => r.userId.equals(userId) & r.deletedAt.isNull())
          ..orderBy([(r) => OrderingTerm.asc(r.nextTriggerAt)]))
        .get();
  }

  Stream<List<Reminder>> watchRemindersByUserId(int userId) {
    return (select(reminders)
          ..where((r) => r.userId.equals(userId) & r.deletedAt.isNull())
          ..orderBy([(r) => OrderingTerm.asc(r.nextTriggerAt)]))
        .watch();
  }

  Future<List<Reminder>> getRemindersByPetId(int petId) {
    return (select(reminders)
          ..where((r) => r.petId.equals(petId) & r.deletedAt.isNull())
          ..orderBy([(r) => OrderingTerm.asc(r.nextTriggerAt)]))
        .get();
  }

  Future<List<Reminder>> getPendingReminders(DateTime before) {
    return (select(reminders)
          ..where((r) =>
              r.nextTriggerAt.isSmallerOrEqualValue(before) &
              r.isEnabled.equals(true) &
              r.deletedAt.isNull())
          ..orderBy([(r) => OrderingTerm.asc(r.nextTriggerAt)]))
        .get();
  }

  Future<Reminder?> getReminderById(int id) {
    return (select(reminders)..where((r) => r.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertReminder(RemindersCompanion reminder) {
    return into(reminders).insert(reminder);
  }

  Future<bool> updateReminder(RemindersCompanion reminder) {
    return update(reminders).replace(reminder);
  }

  Future<int> softDeleteReminder(int id) {
    return (update(reminders)..where((r) => r.id.equals(id)))
        .write(RemindersCompanion(deletedAt: Value(DateTime.now())));
  }

  Future<int> updateNextTrigger(int id, DateTime nextTrigger) {
    return (update(reminders)..where((r) => r.id.equals(id)))
        .write(RemindersCompanion(nextTriggerAt: Value(nextTrigger), lastTriggeredAt: Value(DateTime.now())));
  }

  Future<int> incrementEscalation(int id) async {
    final reminder = await (select(reminders)..where((r) => r.id.equals(id))).getSingleOrNull();
    if (reminder == null) {
      return 0;
    }
    return (update(reminders)..where((r) => r.id.equals(id)))
        .write(RemindersCompanion(escalationCount: Value(reminder.escalationCount + 1)));
  }
}