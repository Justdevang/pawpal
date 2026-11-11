// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

import 'notification_service.dart';

/// FCM service for push notifications
class FCMService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationService _localNotifications = NotificationService();

  Future<void> initialize() async {
    // Request permissions
    await _requestPermissions();

    // Get FCM token
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle background message taps
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Handle terminated state message tap
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }

    // Set up background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _requestPermissions() async {
    // iOS permissions
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    // Android 13+ notification permission handled by NotificationService
  }

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('FCM Foreground: ${message.notification?.title}');

    // Show local notification
    _localNotifications.showNotification(
      id: message.messageId?.hashCode ?? DateTime.now().millisecondsSinceEpoch,
      title: message.notification?.title ?? 'PawPal',
      body: message.notification?.body ?? '',
      payload: message.data['payload'],
    );
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('FCM Opened App: ${message.data}');

    // Navigate based on payload
    final payload = message.data['payload'];
    if (payload != null) {
      _navigateFromPayload(payload);
    }
  }

  void _navigateFromPayload(String payload) {
    // Parse payload and navigate
    // This would integrate with go_router
    debugPrint('Navigate from payload: $payload');
  }

  /// Subscribe to topic for family sharing
  Future<void> subscribeToFamily(String familyId) async {
    await _messaging.subscribeToTopic('family_$familyId');
  }

  /// Unsubscribe from family topic
  Future<void> unsubscribeFromFamily(String familyId) async {
    await _messaging.unsubscribeFromTopic('family_$familyId');
  }

  /// Subscribe to pet topic
  Future<void> subscribeToPet(int petId) async {
    await _messaging.subscribeToTopic('pet_$petId');
  }

  /// Unsubscribe from pet topic
  Future<void> unsubscribeFromPet(int petId) async {
    await _messaging.unsubscribeFromTopic('pet_$petId');
  }
}

/// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('FCM Background: ${message.messageId}');

  // Handle background notification - show local notification
  final notificationService = NotificationService();
  await notificationService.initialize();

  await notificationService.showNotification(
    id: message.messageId?.hashCode ?? DateTime.now().millisecondsSinceEpoch,
    title: message.notification?.title ?? 'PawPal',
    body: message.notification?.body ?? '',
    payload: message.data['payload'],
  );
}

/// Riverpod provider for FCM service
final fcmServiceProvider = Provider<FCMService>((ref) {
  return FCMService();
});