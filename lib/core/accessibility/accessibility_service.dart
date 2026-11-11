// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/semantics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'accessibility_service.g.dart';

/// Accessibility service for managing app-wide accessibility settings
class AccessibilityService {
  static const String _keyReduceMotion = 'accessibility_reduce_motion';
  static const String _keyHighContrast = 'accessibility_high_contrast';
  static const String _keyLargeText = 'accessibility_large_text';
  static const String _keyScreenReader = 'accessibility_screen_reader';
  static const String _keyHapticFeedback = 'accessibility_haptic_feedback';

  final SharedPreferences _prefs;

  AccessibilityService(this._prefs);

  /// Initialize accessibility settings
  Future<void> initialize() async {
    // Load settings from SharedPreferences
    // Settings are loaded lazily via getters
  }

  // Reduce motion
  bool get reduceMotion => _prefs.getBool(_keyReduceMotion) ?? false;
  Future<void> setReduceMotion(bool value) async {
    await _prefs.setBool(_keyReduceMotion, value);
  }

  // High contrast
  bool get highContrast => _prefs.getBool(_keyHighContrast) ?? false;
  Future<void> setHighContrast(bool value) async {
    await _prefs.setBool(_keyHighContrast, value);
  }

  // Large text
  bool get largeText => _prefs.getBool(_keyLargeText) ?? false;
  Future<void> setLargeText(bool value) async {
    await _prefs.setBool(_keyLargeText, value);
  }

  // Screen reader optimization
  bool get screenReaderOptimized => _prefs.getBool(_keyScreenReader) ?? false;
  Future<void> setScreenReaderOptimized(bool value) async {
    await _prefs.setBool(_keyScreenReader, value);
  }

  // Haptic feedback
  bool get hapticFeedbackEnabled => _prefs.getBool(_keyHapticFeedback) ?? true;
  Future<void> setHapticFeedbackEnabled(bool value) async {
    await _prefs.setBool(_keyHapticFeedback, value);
  }

  /// Get text scale factor based on large text setting
  double get textScaleFactor => largeText ? 1.3 : 1.0;

  /// Check if animations should be reduced
  bool get shouldReduceAnimations => reduceMotion;

  /// Get semantics configuration for screen readers
  SemanticsConfiguration getScreenReaderConfig() {
    return SemanticsConfiguration();
  }
}

/// Riverpod provider for AccessibilityService
final accessibilityServiceProvider = Provider<AccessibilityService>((ref) {
  throw UnimplementedError('Initialize with SharedPreferences');
});

@riverpod
class AccessibilitySettingsNotifier extends _$AccessibilitySettingsNotifier {
  @override
  AccessibilitySettings build() {
    return AccessibilitySettings();
  }

  Future<void> loadSettings() async {
    // Load from SharedPreferences
    // Implementation would use SharedPreferences.getInstance()
  }

  Future<void> setReduceMotion(bool value) async {
    state = state.copyWith(reduceMotion: value);
  }

  Future<void> setHighContrast(bool value) async {
    state = state.copyWith(highContrast: value);
  }

  Future<void> setLargeText(bool value) async {
    state = state.copyWith(largeText: value);
  }

  Future<void> setScreenReaderOptimized(bool value) async {
    state = state.copyWith(screenReaderOptimized: value);
  }

  Future<void> setHapticFeedbackEnabled(bool value) async {
    state = state.copyWith(hapticFeedbackEnabled: value);
  }
}

final accessibilitySettingsProvider = accessibilitySettingsNotifierProvider;

/// Accessibility settings state
class AccessibilitySettings {
  final bool reduceMotion;
  final bool highContrast;
  final bool largeText;
  final bool screenReaderOptimized;
  final bool hapticFeedbackEnabled;

  AccessibilitySettings({
    this.reduceMotion = false,
    this.highContrast = false,
    this.largeText = false,
    this.screenReaderOptimized = false,
    this.hapticFeedbackEnabled = true,
  });

  AccessibilitySettings copyWith({
    bool? reduceMotion,
    bool? highContrast,
    bool? largeText,
    bool? screenReaderOptimized,
    bool? hapticFeedbackEnabled,
  }) {
    return AccessibilitySettings(
      reduceMotion: reduceMotion ?? this.reduceMotion,
      highContrast: highContrast ?? this.highContrast,
      largeText: largeText ?? this.largeText,
      screenReaderOptimized: screenReaderOptimized ?? this.screenReaderOptimized,
      hapticFeedbackEnabled: hapticFeedbackEnabled ?? this.hapticFeedbackEnabled,
    );
  }
}


/// Accessibility-aware widget wrapper
class AccessibilityAwareWidget extends ConsumerWidget {
  final Widget child;
  final String? label;
  final String? hint;
  final bool excludeSemantics;

  const AccessibilityAwareWidget({
    super.key,
    required this.child,
    this.label,
    this.hint,
    this.excludeSemantics = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(accessibilitySettingsProvider);
    final mediaQuery = MediaQuery.of(context);

    Widget result = child;

    // Apply text scaling
    if (settings.largeText) {
      result = MediaQuery(
        data: mediaQuery.copyWith(
          textScaler: TextScaler.linear(mediaQuery.textScaler.scale(1.3)),
        ),
        child: result,
      );
    }

    // Add semantics
    if (!excludeSemantics && (label != null || hint != null)) {
      result = Semantics(
        label: label,
        hint: hint,
        child: result,
      );
    }

    return result;
  }
}

/// High contrast color filter
class HighContrastColorFilter extends StatelessWidget {
  final Widget child;
  final bool enabled;

  const HighContrastColorFilter({
    super.key,
    required this.child,
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    return ColorFiltered(
      colorFilter: const ColorFilter.matrix([
        1.5, 0, 0, 0, 0,
        0, 1.5, 0, 0, 0,
        0, 0, 1.5, 0, 0,
        0, 0, 0, 1, 0,
      ]),
      child: child,
    );
  }
}

/// Reduced motion animation wrapper
class ReducedMotionAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final bool enabled;

  const ReducedMotionAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return child;
    }
    return AnimatedSwitcher(
      duration: duration,
      child: child,
    );
  }
}