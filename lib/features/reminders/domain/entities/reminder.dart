// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@freezed
abstract class Reminder with _$Reminder {
  const factory Reminder({
    required int id,
    required int userId,
    int? petId,
    required String type, // vaccination, medication, appointment, weight, custom
    required String title,
    String? description,
    required String scheduleRule, // cron expression or ISO8601 interval
    String? payload, // JSON for type-specific data
    required DateTime nextTriggerAt,
    DateTime? lastTriggeredAt,
    @Default(0) int escalationCount,
    @Default(3) int maxEscalations,
    @Default(true) bool isEnabled,
    @Default(false) bool notifyFamily,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _Reminder;

  factory Reminder.fromJson(Map<String, dynamic> json) => _$ReminderFromJson(json);
}