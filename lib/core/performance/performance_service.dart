// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_performance/firebase_performance.dart';

/// Performance monitoring service
class PerformanceService {
  static FirebasePerformance? _performance;
  static final Map<String, Trace> _traces = {};

  static Future<void> initialize() async {
    _performance = FirebasePerformance.instance;

    // Enable performance monitoring
    await _performance?.setPerformanceCollectionEnabled(true);
  }

  /// Start a trace
  static Future<Trace?> startTrace(String name) async {
    if (_performance == null) return null;

    final trace = await _performance!.newTrace(name);
    await trace.start();
    _traces[name] = trace;
    return trace;
  }

  /// Stop a trace
  static Future<void> stopTrace(String name) async {
    final trace = _traces.remove(name);
    if (trace != null) {
      await trace.stop();
    }
  }

  /// Add metric to trace
  static void addMetric(String traceName, String metricName, int value) {
    final trace = _traces[traceName];
    trace?.incrementMetric(metricName, value);
  }

  /// Record HTTP request
  static Future<void> recordHttpRequest({
    required String url,
    required int statusCode,
    required int responseTimeMs,
    required int responseSizeBytes,
  }) async {
    final trace = await startTrace('http_request');
    if (trace != null) {
      trace.putAttribute('url', url);
      trace.putAttribute('status_code', statusCode.toString());
      trace.incrementMetric('response_time_ms', responseTimeMs);
      trace.incrementMetric('response_size_bytes', responseSizeBytes);
      await stopTrace('http_request');
    }
  }

  /// Record database operation
  static Future<void> recordDatabaseOperation({
    required String operation,
    required String table,
    required int durationMs,
    required int rowsAffected,
  }) async {
    final trace = await startTrace('db_operation');
    if (trace != null) {
      trace.putAttribute('operation', operation);
      trace.putAttribute('table', table);
      trace.incrementMetric('duration_ms', durationMs);
      trace.incrementMetric('rows_affected', rowsAffected);
      await stopTrace('db_operation');
    }
  }

  /// Record notification sent
  static Future<void> recordNotificationSent({
    required String type,
    required bool success,
  }) async {
    final trace = await startTrace('notification');
    if (trace != null) {
      trace.putAttribute('type', type);
      trace.putAttribute('success', success.toString());
      await stopTrace('notification');
    }
  }

  /// Record user action for analytics
  static Future<void> recordUserAction(String action, {Map<String, String>? parameters}) async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(name: action, parameters: parameters);
  }

  /// Record screen view
  static Future<void> recordScreenView(String screenName) async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.logScreenView(screenName: screenName);
  }

  /// Dispose
  static Future<void> dispose() async {
    for (final trace in _traces.values) {
      await trace.stop();
    }
    _traces.clear();
  }
}

/// Riverpod provider for PerformanceService
final performanceServiceProvider = Provider<PerformanceService>((ref) {
  return PerformanceService();
});

/// Performance-aware widget wrapper
class PerformanceTracker extends StatefulWidget {
  final Widget child;
  final String traceName;

  const PerformanceTracker({
    super.key,
    required this.child,
    required this.traceName,
  });

  @override
  State<PerformanceTracker> createState() => _PerformanceTrackerState();
}

class _PerformanceTrackerState extends State<PerformanceTracker> {
  Trace? _trace;

  @override
  void initState() {
    super.initState();
    _startTrace();
  }

  Future<void> _startTrace() async {
    _trace = await PerformanceService.startTrace(widget.traceName);
  }

  @override
  void dispose() {
    if (_trace != null) {
      PerformanceService.stopTrace(widget.traceName);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Custom trace wrapper for async operations
class TracedFuture<T> {
  final Future<T> future;
  final String traceName;

  TracedFuture(this.future, this.traceName);

  Future<T> run() async {
    final trace = await PerformanceService.startTrace(traceName);
    try {
      return await future;
    } finally {
      if (trace != null) {
        await PerformanceService.stopTrace(traceName);
      }
    }
  }
}