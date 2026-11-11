// ignore_for_file: type=lint
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

/// Analytics event definitions for consistent tracking
class AnalyticsEvents {
  // User lifecycle
  static const String userSignUp = 'user_sign_up';
  static const String userLogin = 'user_login';
  static const String userLogout = 'user_logout';
  static const String userGuestMode = 'user_guest_mode';
  static const String userDeleteAccount = 'user_delete_account';

  // Onboarding
  static const String onboardingStart = 'onboarding_start';
  static const String onboardingComplete = 'onboarding_complete';
  static const String onboardingSkip = 'onboarding_skip';

  // Pets
  static const String petCreate = 'pet_create';
  static const String petEdit = 'pet_edit';
  static const String petArchive = 'pet_archive';
  static const String petDelete = 'pet_delete';
  static const String petSwitch = 'pet_switch';
  static const String petPhotoUpload = 'pet_photo_upload';

  // Vaccinations
  static const String vaccinationAdd = 'vaccination_add';
  static const String vaccinationEdit = 'vaccination_edit';
  static const String vaccinationDelete = 'vaccination_delete';
  static const String vaccinationMarkComplete = 'vaccination_mark_complete';
  static const String vaccinationExportPDF = 'vaccination_export_pdf';
  static const String vaccinationReminderTrigger = 'vaccination_reminder_trigger';

  // Medications
  static const String medicationAdd = 'medication_add';
  static const String medicationEdit = 'medication_edit';
  static const String medicationDelete = 'medication_delete';
  static const String medicationLogDose = 'medication_log_dose';
  static const String medicationSnooze = 'medication_snooze';
  static const String medicationSkip = 'medication_skip';
  static const String medicationRefillAlert = 'medication_refill_alert';

  // Vet Appointments
  static const String appointmentCreate = 'appointment_create';
  static const String appointmentEdit = 'appointment_edit';
  static const String appointmentDelete = 'appointment_delete';
  static const String appointmentComplete = 'appointment_complete';

  // Weight Tracker
  static const String weightAdd = 'weight_add';
  static const String weightEdit = 'weight_edit';
  static const String weightDelete = 'weight_delete';

  // Reminders
  static const String reminderTrigger = 'reminder_trigger';
  static const String reminderActionGiven = 'reminder_action_given';
  static const String reminderActionSnooze = 'reminder_action_snooze';
  static const String reminderActionSkip = 'reminder_action_skip';
  static const String reminderEscalation = 'reminder_escalation';

  // Family Sharing
  static const String familyInviteSent = 'family_invite_sent';
  static const String familyInviteAccepted = 'family_invite_accepted';
  static const String familyInviteDeclined = 'family_invite_declined';
  static const String familyMemberRemoved = 'family_member_removed';
  static const String familyRoleChanged = 'family_role_changed';

  // Settings
  static const String settingsDarkModeToggle = 'settings_dark_mode_toggle';
  static const String settingsLanguageChange = 'settings_language_change';
  static const String settingsUnitsChange = 'settings_units_change';
  static const String settingsQuietHoursToggle = 'settings_quiet_hours_toggle';
  static const String settingsNotificationToggle = 'settings_notification_toggle';
  static const String settingsDataExport = 'settings_data_export';
  static const String settingsBackupToggle = 'settings_backup_toggle';

  // Services
  static const String serviceEnable = 'service_enable';
  static const String serviceDisable = 'service_disable';
  static const String serviceView = 'service_view';

  // Premium/Paywall
  static const String paywallView = 'paywall_view';
  static const String paywallPurchase = 'paywall_purchase';
  static const String paywallRestore = 'paywall_restore';
  static const String paywallDismiss = 'paywall_dismiss';
  static const String subscriptionStart = 'subscription_start';
  static const String subscriptionCancel = 'subscription_cancel';
  static const String subscriptionRenew = 'subscription_renew';

  // Errors & Performance
  static const String errorOccurred = 'error_occurred';
  static const String crashFree = 'crash_free_session';
  static const String appStart = 'app_start';
  static const String appBackground = 'app_background';
  static const String appForeground = 'app_foreground';

  /// Log an event with parameters
  static Future<void> logEvent(
    String name, {
    Map<String, Object>? parameters,
  }) async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(name: name, parameters: parameters);
  }

  /// Log with user properties
  static Future<void> logEventWithUserProps(
    String name, {
    Map<String, Object>? parameters,
    Map<String, String>? userProperties,
  }) async {
    final analytics = FirebaseAnalytics.instance;

    if (userProperties != null) {
      for (final entry in userProperties.entries) {
        await analytics.setUserProperty(name: entry.key, value: entry.value);
      }
    }

    await analytics.logEvent(name: name, parameters: parameters);
  }

  /// Set user ID
  static Future<void> setUserId(String userId) async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.setUserId(id: userId);
  }

  /// Log screen view
  static Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }
}

/// Parameter keys for consistent analytics
class AnalyticsParams {
  static const String petId = 'pet_id';
  static const String petName = 'pet_name';
  static const String petSpecies = 'pet_species';
  static const String petBreed = 'pet_breed';
  static const String vaccinationName = 'vaccination_name';
  static const String medicationName = 'medication_name';
  static const String medicationDosage = 'medication_dosage';
  static const String medicationFrequency = 'medication_frequency';
  static const String appointmentType = 'appointment_type';
  static const String weightValue = 'weight_value';
  static const String weightUnit = 'weight_unit';
  static const String reminderType = 'reminder_type';
  static const String actionType = 'action_type'; // given, snooze, skip
  static const String familyRole = 'family_role';
  static const String settingName = 'setting_name';
  static const String settingValue = 'setting_value';
  static const String serviceId = 'service_id';
  static const String paywallVariant = 'paywall_variant';
  static const String subscriptionTier = 'subscription_tier';
  static const String errorCode = 'error_code';
  static const String errorMessage = 'error_message';
  static const String screenName = 'screen_name';
  static const String previousScreen = 'previous_screen';
  static const String durationMs = 'duration_ms';
  static const String success = 'success';
  static const String errorType = 'error_type';
  static const String platform = 'platform';
  static const String appVersion = 'app_version';
  static const String buildNumber = 'build_number';
}

/// Analytics service for centralized tracking
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Log custom event
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  /// Log with automatic common parameters
  Future<void> logEventAuto(String name, {Map<String, Object>? parameters}) async {
    final params = <String, Object>{
      'app_version': '1.0.0', // Would be dynamic
      'platform': defaultTargetPlatform.name,
      'timestamp': DateTime.now().toIso8601String(),
      if (parameters != null) ...parameters,
    };
    await _analytics.logEvent(name: name, parameters: params);
  }

  /// Set user properties
  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  /// Set multiple user properties
  Future<void> setUserProperties(Map<String, String> properties) async {
    for (final entry in properties.entries) {
      await _analytics.setUserProperty(name: entry.key, value: entry.value);
    }
  }

  /// Set user ID
  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  /// Clear user ID (logout)
  Future<void> clearUserId() async {
    await _analytics.setUserId(id: '');
  }

  /// Log screen view
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    await _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }

  /// Log purchase event
  Future<void> logPurchase({
    required String currency,
    required double value,
    required String transactionId,
    String? itemId,
    String? itemName,
    String? itemCategory,
  }) async {
    await _analytics.logPurchase(
      currency: currency,
      value: value,
      transactionId: transactionId,
    );
  }

  /// Log begin checkout
  Future<void> logBeginCheckout({
    required String currency,
    required double value,
    List<AnalyticsEventItem>? items,
  }) async {
    await _analytics.logBeginCheckout(
      currency: currency,
      value: value,
      items: items,
    );
  }

  /// Log add to cart
  Future<void> logAddToCart({
    required String currency,
    required double value,
    List<AnalyticsEventItem>? items,
  }) async {
    await _analytics.logAddToCart(
      currency: currency,
      value: value,
      items: items,
    );
  }

  /// Set analytics collection enabled
  Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    await _analytics.setAnalyticsCollectionEnabled(enabled);
  }

  /// Reset analytics data
  Future<void> resetAnalyticsData() async {
    await _analytics.resetAnalyticsData();
  }
}

/// Riverpod provider for AnalyticsService
final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return AnalyticsService();
});

/// Mixin for easy analytics in widgets
mixin AnalyticsMixin {
  AnalyticsService get analytics => AnalyticsService();

  Future<void> logEvent(String name, {Map<String, Object>? parameters}) {
    return analytics.logEventAuto(name, parameters: parameters);
  }

  Future<void> logScreenView(String screenName, {String? screenClass}) {
    return analytics.logScreenView(screenName: screenName, screenClass: screenClass);
  }
}