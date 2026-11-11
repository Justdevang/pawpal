// ignore_for_file: type=lint
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notification_service.dart';
import 'reminder_engine.dart';

/// Initialize all notification-related services
Future<void> initializeNotifications(WidgetRef ref) async {
  final notificationService = NotificationService();
  await notificationService.initialize();

  final reminderEngine = ref.read(reminderEngineProvider);
  await reminderEngine.initialize();
}

/// Provider for notification service
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});