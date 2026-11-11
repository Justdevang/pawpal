// ignore_for_file: type=lint
import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cron/cron.dart';
import 'package:drift/drift.dart' show Value;

import '../../core/notifications/notification_service.dart';
import '../../core/database/daos/reminder_dao.dart';
import '../../core/database/database.dart';
import '../../core/di/providers.dart';

part 'reminder_engine.g.dart';

@riverpod
ReminderEngine reminderEngine(Ref ref) {
  return ReminderEngine(
    ref.watch(reminderDaoProvider),
    ref.watch(databaseProvider),
  );
}

/// Core reminder scheduling engine
class ReminderEngine {
  final ReminderDao _reminderDao;
  // ignore: unused_field
  final AppDatabase _database;
  final NotificationService _notificationService = NotificationService();
  final Cron _cron = Cron();
  Timer? _checkTimer;
  bool _isRunning = false;

  ReminderEngine(this._reminderDao, this._database);

  /// Initialize the engine
  Future<void> initialize() async {
    await _notificationService.initialize();
    _startPeriodicCheck();
  }

  /// Start checking for due reminders every minute
  void _startPeriodicCheck() {
    _checkTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _processDueReminders();
    });
  }

  /// Process all reminders that are due
  Future<void> _processDueReminders() async {
    if (_isRunning) return;
    _isRunning = true;

    try {
      final now = DateTime.now();
      final pendingReminders = await _reminderDao.getPendingReminders(now);

      for (final reminder in pendingReminders) {
        if (!reminder.isEnabled) continue;
        await _triggerReminder(reminder);
      }
    } finally {
      _isRunning = false;
    }
  }

  /// Trigger a single reminder
  Future<void> _triggerReminder(Reminder reminder) async {
    // Schedule local notification
    await _scheduleNotification(reminder);

    // Update last triggered time and calculate next trigger
    final nextTrigger = _calculateNextTrigger(reminder);
    await _reminderDao.updateNextTrigger(reminder.id, nextTrigger);

    // If this was an escalation, increment count
    // (escalation logic handled by notification actions)
  }

  /// Schedule a local notification for a reminder
  Future<void> _scheduleNotification(Reminder reminder) async {
    final payload = _buildPayload(reminder);
    final title = _getNotificationTitle(reminder);
    final body = _getNotificationBody(reminder);

    await _notificationService.scheduleNotification(
      id: reminder.id,
      title: title,
      body: body,
      scheduledDate: reminder.nextTriggerAt,
      payload: payload,
      isExact: true,
    );
  }

  /// Build notification payload JSON
  String _buildPayload(Reminder reminder) {
    return '''
    {
      "reminderId": ${reminder.id},
      "type": "${reminder.type}",
      "petId": ${reminder.petId ?? 'null'},
      "title": "${reminder.title}",
      "scheduleRule": "${reminder.scheduleRule}"
    }
    ''';
  }

  String _getNotificationTitle(Reminder reminder) {
    switch (reminder.type) {
      case 'medication':
        return '💊 Medication Time';
      case 'vaccination':
        return '💉 Vaccination Due';
      case 'appointment':
        return '🏥 Appointment Reminder';
      case 'weight':
        return '⚖️ Weight Check';
      default:
        return '🐾 PawPal Reminder';
    }
  }

  String _getNotificationBody(Reminder reminder) {
    if (reminder.petId != null) {
      return '${reminder.title} for your pet';
    }
    return reminder.title;
  }

  /// Calculate next trigger time based on schedule rule
  DateTime _calculateNextTrigger(Reminder reminder) {
    final scheduleRule = reminder.scheduleRule;
    final lastTrigger = reminder.lastTriggeredAt ?? reminder.nextTriggerAt;
    final now = DateTime.now();

    // Try to parse as cron expression
    try {
      final schedule = Schedule.parse(scheduleRule);
      var candidate = DateTime(lastTrigger.year, lastTrigger.month, lastTrigger.day, lastTrigger.hour, lastTrigger.minute).add(const Duration(minutes: 1));
      for (int i = 0; i < 1440 * 366; i++) {
        if (candidate.isAfter(now) && schedule.shouldRunAt(candidate)) {
          return candidate;
        }
        candidate = candidate.add(const Duration(minutes: 1));
      }
    } catch (e) {
      // Not a cron expression, try ISO8601 interval
    }

    // Try ISO8601 duration (e.g., "P1D", "PT12H", "P7D")
    try {
      final duration = parseISO8601Duration(scheduleRule);
      if (duration != null) {
        var next = lastTrigger.add(duration);
        if (next.isAfter(now)) return next;
        // If in past, find next occurrence
        while (!next.isAfter(now)) {
          next = next.add(duration);
        }
        return next;
      }
    } catch (e) {
      // Not a duration
    }

    // Default: daily at same time
    return _getNextDailyTrigger(lastTrigger);
  }

  /// Parse ISO8601 duration string
  /// Parses the subset of ISO 8601 durations supported by reminder schedules.
  ///
  /// Calendar-dependent units (months and years) are deliberately excluded.
  Duration? parseISO8601Duration(String input) {
    // Simple parser for common formats: P1D, PT12H, P7D, PT30M
    final regex = RegExp(r'^P(?:(\d+)D)?(?:T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?)?$');
    final match = regex.firstMatch(input);
    if (match == null) return null;

    final days = int.tryParse(match.group(1) ?? '0') ?? 0;
    final hours = int.tryParse(match.group(2) ?? '0') ?? 0;
    final minutes = int.tryParse(match.group(3) ?? '0') ?? 0;
    final seconds = int.tryParse(match.group(4) ?? '0') ?? 0;

    return Duration(days: days, hours: hours, minutes: minutes, seconds: seconds);
  }

  /// Get next daily trigger at same time
  DateTime _getNextDailyTrigger(DateTime lastTrigger) {
    final now = DateTime.now();
    var next = DateTime(now.year, now.month, now.day, lastTrigger.hour, lastTrigger.minute);
    if (next.isBefore(now) || next.isAtSameMomentAs(now)) {
      next = next.add(const Duration(days: 1));
    }
    return next;
  }

  /// Schedule all enabled reminders
  Future<void> scheduleAllReminders() async {
    // This would be called on app start or after data changes
    // For now, the periodic check handles it
  }

  /// Reschedule a specific reminder (e.g., after user action)
  Future<void> rescheduleReminder(int reminderId) async {
    final reminder = await _reminderDao.getReminderById(reminderId);
    if (reminder == null || !reminder.isEnabled) return;

    // Cancel existing notification
    await _notificationService.cancelNotification(reminderId);

    // Schedule new notification
    await _scheduleNotification(reminder);
  }

  /// Handle notification action (given/snooze/skip)
  Future<void> handleNotificationAction(String action, int reminderId) async {
    final reminder = await _reminderDao.getReminderById(reminderId);
    if (reminder == null) return;

    switch (action) {
      case 'given':
        await _handleGiven(reminder);
        break;
      case 'snooze':
        await _handleSnooze(reminder);
        break;
      case 'skip':
        await _handleSkip(reminder);
        break;
    }
  }

  Future<void> _handleGiven(Reminder reminder) async {
    // Mark as done, calculate next trigger
    final nextTrigger = _calculateNextTrigger(reminder.copyWith(lastTriggeredAt: Value(DateTime.now())));
    await _reminderDao.updateNextTrigger(reminder.id, nextTrigger);
    await _notificationService.cancelNotification(reminder.id);
    await _scheduleNotification(reminder.copyWith(nextTriggerAt: nextTrigger));
  }

  Future<void> _handleSnooze(Reminder reminder) async {
    // Reschedule for 15 minutes
    final snoozeTime = DateTime.now().add(const Duration(minutes: 15));
    await _reminderDao.updateNextTrigger(reminder.id, snoozeTime);
    await _notificationService.cancelNotification(reminder.id);
    await _notificationService.scheduleNotification(
      id: reminder.id,
      title: _getNotificationTitle(reminder),
      body: '${reminder.title} (snoozed)',
      scheduledDate: snoozeTime,
      payload: _buildPayload(reminder),
      isExact: true,
    );
  }

  Future<void> _handleSkip(Reminder reminder) async {
    // Skip to next scheduled occurrence
    final nextTrigger = _calculateNextTrigger(reminder);
    await _reminderDao.updateNextTrigger(reminder.id, nextTrigger);
    await _notificationService.cancelNotification(reminder.id);
    await _scheduleNotification(reminder.copyWith(nextTriggerAt: nextTrigger));
  }

  /// Dispose resources
  void dispose() {
    _checkTimer?.cancel();
    _cron.close();
  }
}
