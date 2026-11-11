// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/config/app_config.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'core/notifications/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {}

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyA1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q',
        authDomain: 'pawpal-app.firebaseapp.com',
        projectId: 'pawpal-app',
        storageBucket: 'pawpal-app.appspot.com',
        messagingSenderId: '123456789012',
        appId: '1:123456789012:ios:abcdef1234567890abcdef',
        measurementId: 'G-1234567890',
      ),
    );
  } catch (e) {
    debugPrint('Firebase initialization failed (running in offline/local mode): $e');
  }

  // Initialize date formatting
  try {
    await initializeDateFormatting('en_US', null);
  } catch (e) {
    debugPrint('Date formatting initialization warning: $e');
  }

  // Initialize notifications
  try {
    await NotificationService().initialize();
  } catch (e) {
    debugPrint('Notification service initialization warning: $e');
  }

  // Initialize Android alarm manager
  // await AndroidAlarmManager.initialize(); // Uncomment when needed

  runApp(const ProviderScope(child: PawPalApp()));
}

class PawPalApp extends ConsumerWidget {
  const PawPalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(MediaQuery.of(context).textScaler.clamp(maxScaleFactor: 2.0).scale(1.0)),
          ),
          child: child!,
        );
      },
    );
  }
}