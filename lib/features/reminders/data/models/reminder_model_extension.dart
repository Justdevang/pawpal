import 'package:drift/drift.dart';
import '../../../../core/database/database.dart' as db;
import '../../domain/entities/reminder.dart' as domain;
import 'reminder_model.dart';

extension ReminderModelCompanionX on ReminderModel {
  db.RemindersCompanion toCompanion({final bool insert = false}) => db.RemindersCompanion(
      id: insert ? const Value.absent() : Value(id),
      userId: Value(userId),
      petId: Value(petId),
      type: Value(type),
      title: Value(title),
      description: Value(description),
      scheduleRule: Value(scheduleRule),
      payload: Value(payload),
      nextTriggerAt: Value(nextTriggerAt),
      lastTriggeredAt: Value(lastTriggeredAt),
      escalationCount: Value(escalationCount),
      maxEscalations: Value(maxEscalations),
      isEnabled: Value(isEnabled),
      notifyFamily: Value(notifyFamily),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
    );
}

extension DbReminderX on db.Reminder {
  domain.Reminder toEntity() => domain.Reminder(
    id: id,
    userId: userId,
    petId: petId,
    type: type,
    title: title,
    description: description,
    scheduleRule: scheduleRule,
    payload: payload,
    nextTriggerAt: nextTriggerAt,
    lastTriggeredAt: lastTriggeredAt,
    escalationCount: escalationCount,
    maxEscalations: maxEscalations,
    isEnabled: isEnabled,
    notifyFamily: notifyFamily,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}
