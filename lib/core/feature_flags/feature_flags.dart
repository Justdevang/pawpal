// ignore_for_file: type=lint
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

/// Feature flag and A/B testing service using Firebase Remote Config
class FeatureFlagService {
  static FirebaseRemoteConfig? _remoteConfig;
  static bool _initialized = false;

  // Feature flag keys
  static const String keyPaywallEnabled = 'paywall_enabled';
  static const String keyPaywallVariant = 'paywall_variant';
  static const String keyMaxFreePets = 'max_free_pets';
  static const String keyFamilySharingEnabled = 'family_sharing_enabled';
  static const String keyServicesEnabled = 'services_enabled';
  static const String keyDarkModeDefault = 'dark_mode_default';
  static const String keyAnalyticsEnabled = 'analytics_enabled';
  static const String keyCrashlyticsEnabled = 'crashlytics_enabled';
  static const String keyNewOnboardingFlow = 'new_onboarding_flow';
  static const String keyBetaFeatures = 'beta_features_enabled';
  static const String keyMaintenanceMode = 'maintenance_mode';
  static const String keyMinAppVersion = 'min_app_version';

  // A/B test variants
  static const String variantControl = 'control';
  static const String variantTreatmentA = 'treatment_a';
  static const String variantTreatmentB = 'treatment_b';

  /// Initialize Remote Config
  static Future<void> initialize() async {
    if (_initialized) return;

    _remoteConfig = FirebaseRemoteConfig.instance;

    // Set default values
    await _remoteConfig!.setDefaults({
      keyPaywallEnabled: true,
      keyPaywallVariant: variantControl,
      keyMaxFreePets: 2,
      keyFamilySharingEnabled: true,
      keyServicesEnabled: true,
      keyDarkModeDefault: false,
      keyAnalyticsEnabled: true,
      keyCrashlyticsEnabled: true,
      keyNewOnboardingFlow: false,
      keyBetaFeatures: false,
      keyMaintenanceMode: false,
      keyMinAppVersion: '1.0.0',
    });

    // Set config settings
    await _remoteConfig!.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: kDebugMode ? Duration.zero : const Duration(hours: 1),
    ));

    // Fetch and activate
    await fetchAndActivate();

    _initialized = true;
  }

  /// Fetch and activate remote config
  static Future<bool> fetchAndActivate() async {
    if (_remoteConfig == null) return false;

    final success = await _remoteConfig!.fetchAndActivate();
    return success;
  }

  /// Force fetch (bypass cache)
  static Future<bool> forceFetch() async {
    if (_remoteConfig == null) return false;

    final success = await _remoteConfig!.fetchAndActivate();
    return success;
  }

  /// Get boolean flag
  static bool getBool(String key) {
    if (_remoteConfig == null) return false;
    return _remoteConfig!.getBool(key);
  }

  /// Get int flag
  static int getInt(String key) {
    if (_remoteConfig == null) return 0;
    return _remoteConfig!.getInt(key);
  }

  /// Get double flag
  static double getDouble(String key) {
    if (_remoteConfig == null) return 0.0;
    return _remoteConfig!.getDouble(key);
  }

  /// Get string flag
  static String getString(String key) {
    if (_remoteConfig == null) return '';
    return _remoteConfig!.getString(key);
  }

  /// Get paywall variant for A/B testing
  static String getPaywallVariant() {
    return getString(keyPaywallVariant);
  }

  /// Check if paywall is enabled
  static bool isPaywallEnabled() {
    return getBool(keyPaywallEnabled);
  }

  /// Get max free pets
  static int getMaxFreePets() {
    return getInt(keyMaxFreePets);
  }

  /// Check if family sharing is enabled
  static bool isFamilySharingEnabled() {
    return getBool(keyFamilySharingEnabled);
  }

  /// Check if services are enabled
  static bool isServicesEnabled() {
    return getBool(keyServicesEnabled);
  }

  /// Check if dark mode is default
  static bool isDarkModeDefault() {
    return getBool(keyDarkModeDefault);
  }

  /// Check if analytics is enabled
  static bool isAnalyticsEnabled() {
    return getBool(keyAnalyticsEnabled);
  }

  /// Check if Crashlytics is enabled
  static bool isCrashlyticsEnabled() {
    return getBool(keyCrashlyticsEnabled);
  }

  /// Check if new onboarding flow is enabled
  static bool isNewOnboardingFlowEnabled() {
    return getBool(keyNewOnboardingFlow);
  }

  /// Check if beta features are enabled
  static bool isBetaFeaturesEnabled() {
    return getBool(keyBetaFeatures);
  }

  /// Check if maintenance mode is active
  static bool isMaintenanceMode() {
    return getBool(keyMaintenanceMode);
  }

  /// Get minimum required app version
  static String getMinAppVersion() {
    return getString(keyMinAppVersion);
  }

  /// Check if current app version meets minimum
  static bool isVersionSupported(String currentVersion) {
    final minVersion = getMinAppVersion();
    return _compareVersions(currentVersion, minVersion) >= 0;
  }

  /// Compare semantic versions (returns -1, 0, 1)
  static int _compareVersions(String v1, String v2) {
    final parts1 = v1.split('.').map(int.parse).toList();
    final parts2 = v2.split('.').map(int.parse).toList();

    for (int i = 0; i < 3; i++) {
      final p1 = i < parts1.length ? parts1[i] : 0;
      final p2 = i < parts2.length ? parts2[i] : 0;
      if (p1 < p2) return -1;
      if (p1 > p2) return 1;
    }
    return 0;
  }

  /// Get all feature flags as map (for debugging)
  static Map<String, dynamic> getAllFlags() {
    if (_remoteConfig == null) return {};

    return {
      keyPaywallEnabled: getBool(keyPaywallEnabled),
      keyPaywallVariant: getString(keyPaywallVariant),
      keyMaxFreePets: getInt(keyMaxFreePets),
      keyFamilySharingEnabled: getBool(keyFamilySharingEnabled),
      keyServicesEnabled: getBool(keyServicesEnabled),
      keyDarkModeDefault: getBool(keyDarkModeDefault),
      keyAnalyticsEnabled: getBool(keyAnalyticsEnabled),
      keyCrashlyticsEnabled: getBool(keyCrashlyticsEnabled),
      keyNewOnboardingFlow: getBool(keyNewOnboardingFlow),
      keyBetaFeatures: getBool(keyBetaFeatures),
      keyMaintenanceMode: getBool(keyMaintenanceMode),
      keyMinAppVersion: getString(keyMinAppVersion),
    };
  }

  /// Check if user is in experiment group
  static bool isInExperiment(String experimentKey, String variant) {
    final userVariant = getString(experimentKey);
    return userVariant == variant;
  }

  /// Get experiment variant for user
  static String getExperimentVariant(String experimentKey) {
    return getString(experimentKey);
  }
}

/// Riverpod provider for FeatureFlagService
final featureFlagServiceProvider = Provider<FeatureFlagService>((ref) {
  return FeatureFlagService();
});

/// Provider for specific feature flags
final paywallEnabledProvider = Provider<bool>((ref) {
  return FeatureFlagService.isPaywallEnabled();
});

final paywallVariantProvider = Provider<String>((ref) {
  return FeatureFlagService.getPaywallVariant();
});

final maxFreePetsProvider = Provider<int>((ref) {
  return FeatureFlagService.getMaxFreePets();
});

final familySharingEnabledProvider = Provider<bool>((ref) {
  return FeatureFlagService.isFamilySharingEnabled();
});

final maintenanceModeProvider = Provider<bool>((ref) {
  return FeatureFlagService.isMaintenanceMode();
});