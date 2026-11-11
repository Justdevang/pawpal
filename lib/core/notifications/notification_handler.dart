// ignore_for_file: type=lint
import 'package:flutter/services.dart';


/// Notification handler for Flutter side
class NotificationHandler {
  static const MethodChannel _channel = MethodChannel('com.pawpal.app/notifications');

  static void initialize() {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  static Future<void> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onNotificationAction':
        await _handleNotificationAction(call);
        break;
      case 'onNotificationTap':
        await _handleNotificationTap(call);
        break;
      case 'rescheduleAllFromNative':
        await _rescheduleAll();
        break;
      default:
        break;
    }
  }

  static Future<void> _handleNotificationAction(MethodCall call) async {
    final action = call.arguments['action'] as String?;
    final reminderId = call.arguments['reminderId'] as int?;

    if (action != null && reminderId != null) {
      final reminderEngine = ReminderEngine.instance; // Would need singleton or provider access
      await reminderEngine.handleNotificationAction(action, reminderId);
    }
  }

  static Future<void> _handleNotificationTap(MethodCall call) async {
    // Navigate based on payload
    // This would integrate with go_router
  }

  static Future<void> _rescheduleAll() async {
    // Called from native to reschedule all notifications
    final reminderEngine = ReminderEngine.instance;
    await reminderEngine.scheduleAllReminders();
  }
}

/// Wrapper to access ReminderEngine from static context
class ReminderEngine {
  static ReminderEngine? _instance;
  static ReminderEngine get instance {
    _instance ??= ReminderEngine._();
    return _instance!;
  }

  ReminderEngine._();

  // In real implementation, this would use the Riverpod provider
  // For now, we'd need to pass the engine instance during app initialization
  Future<void> handleNotificationAction(String action, int reminderId) async {}
  Future<void> scheduleAllReminders() async {}
}