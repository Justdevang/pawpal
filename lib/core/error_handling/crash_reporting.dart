// ignore_for_file: type=lint
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Crash reporting service
class CrashReportingService {
  static FirebaseCrashlytics? _crashlytics;
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;

    _crashlytics = FirebaseCrashlytics.instance;

    // Enable crashlytics collection
    await _crashlytics?.setCrashlyticsCollectionEnabled(true);

    // Set up Flutter error handler
    FlutterError.onError = (FlutterErrorDetails details) {
      _crashlytics?.recordFlutterFatalError(details);
      // Also log to console in debug mode
      if (kDebugMode) {
        FlutterError.presentError(details);
      }
    };

    // Set up platform error handler
    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics?.recordError(error, stack, fatal: true);
      return true;
    };

    _initialized = true;
  }

  /// Record a non-fatal error
  static void recordError(
    dynamic error,
    StackTrace? stackTrace, {
    bool fatal = false,
    Map<String, dynamic>? context,
  }) {
    _crashlytics?.recordError(
      error,
      stackTrace,
      fatal: fatal,
      information: context != null ? [context.toString()] as Iterable<Object> : Iterable.empty(),
    );
  }

  /// Record a custom message
  static void recordMessage(String message) {
    _crashlytics?.log(message);
  }

  /// Set user ID for crash reports
  static Future<void> setUserId(String userId) async {
    await _crashlytics?.setUserIdentifier(userId);
  }

  /// Set custom keys for crash reports
  static Future<void> setCustomKey(String key, dynamic value) async {
    await _crashlytics?.setCustomKey(key, value);
  }

  /// Set custom keys in batch
  static Future<void> setCustomKeys(Map<String, dynamic> keys) async {
    for (final entry in keys.entries) {
      await _crashlytics?.setCustomKey(entry.key, entry.value);
    }
  }

  /// Set user properties
  static Future<void> setUserProperties(Map<String, String> properties) async {
    for (final entry in properties.entries) {
      await _crashlytics?.setCustomKey(entry.key, entry.value);
    }
  }

  /// Check if Crashlytics is initialized
  static bool get isInitialized => _initialized;

  /// Force a test crash (for testing)
  static void forceCrash() {
    _crashlytics?.crash();
  }
}

/// Riverpod provider for CrashReportingService
final crashReportingServiceProvider = Provider<CrashReportingService>((ref) {
  return CrashReportingService();
});

/// Error boundary widget
class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final Widget Function(Object error, StackTrace? stackTrace, VoidCallback retry)? fallbackBuilder;
  final void Function(Object error, StackTrace? stackTrace)? onError;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.fallbackBuilder,
    this.onError,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;
  StackTrace? _stackTrace;

  @override
  void initState() {
    super.initState();
    // Register error handler for this widget
    ErrorWidget.builder = _errorWidgetBuilder;
  }

  @override
  void dispose() {
    ErrorWidget.builder = _defaultErrorWidgetBuilder;
    super.dispose();
  }

  static Widget _errorWidgetBuilder(FlutterErrorDetails details) {
    return _ErrorFallbackWidget(
      error: details.exception,
      stackTrace: details.stack,
      onRetry: () {},
    );
  }

  static Widget _defaultErrorWidgetBuilder(FlutterErrorDetails details) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Text(
          'Something went wrong',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      if (widget.fallbackBuilder != null) {
        return widget.fallbackBuilder!(_error!, _stackTrace, () {
          setState(() {
            _error = null;
            _stackTrace = null;
          });
        });
      }
      return _ErrorFallbackWidget(
        error: _error!,
        stackTrace: _stackTrace,
        onRetry: () {
          setState(() {
            _error = null;
            _stackTrace = null;
          });
        },
      );
    }

    return widget.child;
  }
}

/// Error fallback widget
class _ErrorFallbackWidget extends StatelessWidget {
  final Object error;
  final StackTrace? stackTrace;
  final VoidCallback onRetry;

  const _ErrorFallbackWidget({
    required this.error,
    required this.stackTrace,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Async error boundary for FutureBuilder/StreamBuilder
class AsyncErrorBoundary extends StatelessWidget {
  final Widget child;
  final Widget Function(Object error, StackTrace? stackTrace, VoidCallback retry)? fallbackBuilder;

  const AsyncErrorBoundary({
    super.key,
    required this.child,
    this.fallbackBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorBoundary(
      child: child,
      fallbackBuilder: fallbackBuilder,
    );
  }
}

/// Provider error boundary
class ProviderErrorBoundary extends ConsumerWidget {
  final Widget child;
  final Widget Function(Object error, StackTrace? stackTrace, VoidCallback retry)? fallbackBuilder;

  const ProviderErrorBoundary({
    super.key,
    required this.child,
    this.fallbackBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ErrorBoundary(
      child: child,
      fallbackBuilder: fallbackBuilder,
    );
  }
}