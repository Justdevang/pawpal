// ignore_for_file: type=lint
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const String appName = 'PawPal';
  static const String packageName = 'com.pawpal.app';
  static const String iosBundleId = 'com.pawpal.app';

  // Flavors
  static const String flavorDev = 'dev';
  static const String flavorProd = 'prod';

  // Firebase
  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
  static String get firebaseAuthDomain => dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? '';
  static String get firebaseProjectId => dotenv.env['FIREBASE_PROJECT_ID'] ?? '';
  static String get firebaseStorageBucket => dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '';
  static String get firebaseMessagingSenderId => dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '';
  static String get firebaseAppId => dotenv.env['FIREBASE_APP_ID'] ?? '';
  static String get firebaseMeasurementId => dotenv.env['FIREBASE_MEASUREMENT_ID'] ?? '';

  // Google Sign In
  static String get googleClientId => dotenv.env['GOOGLE_CLIENT_ID'] ?? '';
  static String get googleClientSecret => dotenv.env['GOOGLE_CLIENT_SECRET'] ?? '';

  // Apple Sign In
  static String get appleClientId => dotenv.env['APPLE_CLIENT_ID'] ?? '';
  static String get appleTeamId => dotenv.env['APPLE_TEAM_ID'] ?? '';
  static String get appleKeyId => dotenv.env['APPLE_KEY_ID'] ?? '';
  static String get applePrivateKey => dotenv.env['APPLE_PRIVATE_KEY'] ?? '';

  // App version
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '1.0.0';
  static String get buildNumber => dotenv.env['BUILD_NUMBER'] ?? '1';

  // Feature flags
  static bool get enableAnalytics => dotenv.env['ENABLE_ANALYTICS'] == 'true';
  static bool get enableCrashlytics => dotenv.env['ENABLE_CRASHLYTICS'] == 'true';
  static bool get enableFamilySharing => dotenv.env['ENABLE_FAMILY_SHARING'] == 'true';
  static bool get enableServicesRegistry => dotenv.env['ENABLE_SERVICES_REGISTRY'] == 'true';

  // Limits
  static int get maxFreePets => int.tryParse(dotenv.env['MAX_FREE_PETS'] ?? '2') ?? 2;
  static int maxNotificationsPending = 64; // iOS limit

  // Notification channels
  static const String notificationChannelId = 'pawpal_reminders';
  static const String notificationChannelName = 'PawPal Reminders';
  static const String notificationChannelDescription = 'Reminders for vaccinations, medications, and appointments';
}