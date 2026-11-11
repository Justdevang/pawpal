// ignore_for_file: type=lint
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../config/app_config.dart';

part 'firebase_providers.g.dart';

@riverpod
Future<FirebaseApp> firebaseApp(Ref ref) async {
  return await Firebase.initializeApp(
    options: kIsWeb
        ? FirebaseOptions(
            apiKey: AppConfig.firebaseApiKey,
            authDomain: AppConfig.firebaseAuthDomain,
            projectId: AppConfig.firebaseProjectId,
            storageBucket: AppConfig.firebaseStorageBucket,
            messagingSenderId: AppConfig.firebaseMessagingSenderId,
            appId: AppConfig.firebaseAppId,
            measurementId: AppConfig.firebaseMeasurementId,
          )
        : null,
  );
}

@riverpod
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore firestore(Ref ref) {
  final instance = FirebaseFirestore.instance;
  instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  return instance;
}

@riverpod
FirebaseStorage firebaseStorage(Ref ref) {
  return FirebaseStorage.instance;
}

@riverpod
FirebaseMessaging firebaseMessaging(Ref ref) {
  return FirebaseMessaging.instance;
}

@riverpod
FirebaseCrashlytics firebaseCrashlytics(Ref ref) {
  return FirebaseCrashlytics.instance;
}

@riverpod
FirebaseAnalytics firebaseAnalytics(Ref ref) {
  return FirebaseAnalytics.instance;
}