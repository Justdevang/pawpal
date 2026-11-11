import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/reminder.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';

@freezed
abstract class ReminderModel with _$ReminderModel {

  const factory ReminderModel({
    required final int id,
    required final int userId,
    required final String type, required final String title, required final String scheduleRule, required final DateTime nextTriggerAt, required final DateTime createdAt, required final DateTime updatedAt, final int? petId,
    final String? description,
    final String? payload,
    final DateTime? lastTriggeredAt,
    @Default(0) final int escalationCount,
    @Default(3) final int maxEscalations,
    @Default(true) final bool isEnabled,
    @Default(false) final bool notifyFamily,
    final DateTime? deletedAt,
  }) = _ReminderModel;
  const ReminderModel._();

  factory ReminderModel.fromJson(final Map<String, dynamic> json) => _$ReminderModelFromJson(json);

  factory ReminderModel.fromEntity(final Reminder reminder) => ReminderModel(
      id: reminder.id,
      userId: reminder.userId,
      petId: reminder.petId,
      type: reminder.type,
      title: reminder.title,
      description: reminder.description,
      scheduleRule: reminder.scheduleRule,
      payload: reminder.payload,
      nextTriggerAt: reminder.nextTriggerAt,
      lastTriggeredAt: reminder.lastTriggeredAt,
      escalationCount: reminder.escalationCount,
      maxEscalations: reminder.maxEscalations,
      isEnabled: reminder.isEnabled,
      notifyFamily: reminder.notifyFamily,
      createdAt: reminder.createdAt,
      updatedAt: reminder.updatedAt,
      deletedAt: reminder.deletedAt,
    );

  Reminder toEntity() => Reminder(
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