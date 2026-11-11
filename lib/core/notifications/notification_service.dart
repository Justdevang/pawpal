// ignore_for_file: type=lint
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:permission_handler/permission_handler.dart';

import '../config/app_config.dart';

/// Notification service for local notifications
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    if (kIsWeb) {
      _initialized = true;
      return;
    }

    try {
      tz_data.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('UTC'));
    } catch (_) {}

    // Android initialization
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: _onNotificationResponse,
    );

    // Create notification channels for Android
    await _createNotificationChannels();

    // Request permissions
    await _requestPermissions();

    _initialized = true;
  }

  Future<void> _createNotificationChannels() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      AppConfig.notificationChannelId,
      AppConfig.notificationChannelName,
      description: AppConfig.notificationChannelDescription,
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      showBadge: true,
    );

    await _notifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _requestPermissions() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        // Android 13+ POST_NOTIFICATIONS permission
        if (await Permission.notification.isDenied) {
          await Permission.notification.request();
        }

        // Android exact alarms permission
        if (await Permission.scheduleExactAlarm.isDenied) {
          await Permission.scheduleExactAlarm.request();
        }
      }
    } catch (e) {
      debugPrint('Permission request error: $e');
    }

    // iOS permissions are requested in DarwinInitializationSettings
  }

  static void _onNotificationResponse(NotificationResponse response) {
    // Handle notification tap
    debugPrint('Notification tapped: ${response.payload}');
  }

  /// Schedule a notification
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
    NotificationActionButtons? actionButtons,
    bool isExact = true,
  }) async {
    if (!_initialized) await initialize();

    final tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(scheduledDate, tz.local);

    const androidDetails = AndroidNotificationDetails(
      AppConfig.notificationChannelId,
      AppConfig.notificationChannelName,
      channelDescription: AppConfig.notificationChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      showWhen: true,
      autoCancel: true,
      category: AndroidNotificationCategory.reminder,
      actions: [
        AndroidNotificationAction('given', 'Given', showsUserInterface: false),
        AndroidNotificationAction('snooze', 'Snooze 15m', showsUserInterface: false),
        AndroidNotificationAction('skip', 'Skip', showsUserInterface: false),
      ],
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      categoryIdentifier: 'reminder_category',
      threadIdentifier: 'pawpal_reminders',
    );

    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    if (isExact) {
      await _notifications.zonedSchedule(
        id,
        title,
        body,
        tzScheduledDate,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload,
      );
    } else {
      await _notifications.zonedSchedule(
        id,
        title,
        body,
        tzScheduledDate,
        details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload,
      );
    }
  }

  /// Show immediate notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    if (!_initialized) await initialize();

    const androidDetails = AndroidNotificationDetails(
      AppConfig.notificationChannelId,
      AppConfig.notificationChannelName,
      channelDescription: AppConfig.notificationChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _notifications.show(id, title, body, details, payload: payload);
  }

  /// Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  /// Reschedule notifications for a medication (handles iOS 64 limit)
  Future<void> rescheduleMedicationNotifications(int medicationId, List<DateTime> scheduleTimes) async {
    // Cancel existing notifications for this medication
    final pending = await getPendingNotifications();
    for (final notification in pending) {
      if (notification.payload?.startsWith('medication_$medicationId') == true) {
        await cancelNotification(notification.id);
      }
    }

    // Schedule new notifications (respect iOS 64 limit)
    final limitedTimes = scheduleTimes.take(AppConfig.maxNotificationsPending).toList();
    for (int i = 0; i < limitedTimes.length; i++) {
      await scheduleNotification(
        id: medicationId * 1000 + i,
        title: 'Medication Reminder',
        body: 'Time for your medication',
        scheduledDate: limitedTimes[i],
        payload: 'medication_${medicationId}_$i',
      );
    }
  }

  /// Check if exact alarms are allowed (Android)
  Future<bool> canScheduleExactAlarms() async {
    if (await Permission.scheduleExactAlarm.isGranted) return true;
    return false;
  }

  /// Request exact alarm permission (Android)
  Future<void> requestExactAlarmPermission() async {
    await Permission.scheduleExactAlarm.request();
  }
}

/// Notification action buttons configuration
class NotificationActionButtons {
  final String givenLabel;
  final String snoozeLabel;
  final String skipLabel;
  final Duration snoozeDuration;

  const NotificationActionButtons({
    this.givenLabel = 'Given',
    this.snoozeLabel = 'Snooze 15m',
    this.skipLabel = 'Skip',
    this.snoozeDuration = const Duration(minutes: 15),
  });
}