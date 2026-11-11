// ignore_for_file: type=lint
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

/// Service for handling timezone and DST changes
class TimezoneService {
  static bool _initialized = false;

  /// Initialize timezone database
  static Future<void> initialize() async {
    if (_initialized) return;

    tz_data.initializeTimeZones();
    _initialized = true;

    // Set local timezone
    try {
      final localZone = tz.local;
      tz.setLocalLocation(localZone);
    } catch (e) {
      // Fallback to UTC
      tz.setLocalLocation(tz.getLocation('UTC'));
    }
  }

  /// Get current local timezone name
  static String getLocalTimezoneName() {
    return tz.local.name;
  }

  /// Convert UTC to local time
  static tz.TZDateTime toLocal(DateTime utcDateTime) {
    return tz.TZDateTime.from(utcDateTime, tz.local);
  }

  /// Convert local time to UTC
  static DateTime toUtc(tz.TZDateTime localDateTime) {
    return DateTime.utc(
      localDateTime.year,
      localDateTime.month,
      localDateTime.day,
      localDateTime.hour,
      localDateTime.minute,
      localDateTime.second,
      localDateTime.millisecond,
      localDateTime.microsecond,
    );
  }

  /// Check if DST is currently active
  static bool isDSTActive() {
    final now = tz.TZDateTime.now(tz.local);
    return now.timeZone.isDst;
  }

  /// Get next DST transition
  static tz.TZDateTime? getNextDSTTransition() {
    // This is a simplified approach - in practice you'd iterate through transitions
    // For now, return null as we don't have easy access to transition data
    return null;
  }

  /// Reschedule notifications after timezone/DST change
  static Future<void> rescheduleForTimezoneChange(List<DateTime> scheduledTimes) async {
    // This would be called when the app detects a timezone change
    // Recalculate all scheduled times in the new timezone
  }

  /// Get offset from UTC in hours
  static double getUtcOffsetHours() {
    final now = tz.TZDateTime.now(tz.local);
    return now.timeZoneOffset.inHours.toDouble() + (now.timeZoneOffset.inMinutes % 60) / 60.0;
  }
}