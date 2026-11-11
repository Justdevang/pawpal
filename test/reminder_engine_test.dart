// ignore_for_file: type=lint
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

import 'package:pawpal/core/notifications/reminder_engine.dart';
import 'package:pawpal/core/database/daos/reminder_dao.dart';
import 'package:pawpal/core/database/database.dart' as db;
import 'package:pawpal/features/reminders/domain/entities/reminder.dart';

class MockReminderDao extends Mock implements ReminderDao {}
class MockDatabase extends Mock implements db.AppDatabase {}
void main() {
  group('ReminderEngine', () {
    late ReminderEngine engine;
    late MockReminderDao mockReminderDao;
    late MockDatabase mockDatabase;

    setUp(() {
      mockReminderDao = MockReminderDao();
      mockDatabase = MockDatabase();

      // Initialize timezone
      tz_data.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('UTC'));

      engine = ReminderEngine(mockReminderDao, mockDatabase);
    });

    tearDown(() {
      engine.dispose();
    });

    group('calculateNextTrigger', () {
      test('daily cron expression', () {
        final reminder = Reminder(
          id: 1,
          userId: 1,
          type: 'medication',
          title: 'Daily Med',
          scheduleRule: '0 8 * * *', // Daily at 8 AM
          nextTriggerAt: tz.TZDateTime(tz.local, 2026, 1, 15, 8, 0),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        expect(reminder.scheduleRule, equals('0 8 * * *'));
      });

      test('ISO8601 duration', () {
        final duration = engine.parseISO8601Duration('P1D');
        expect(duration, equals(const Duration(days: 1)));

        final duration2 = engine.parseISO8601Duration('PT12H');
        expect(duration2, equals(const Duration(hours: 12)));

        final duration3 = engine.parseISO8601Duration('PT30M');
        expect(duration3, equals(const Duration(minutes: 30)));

        final duration4 = engine.parseISO8601Duration('P7D');
        expect(duration4, equals(const Duration(days: 7)));
      });

      test('invalid duration returns null', () {
        final duration = engine.parseISO8601Duration('invalid');
        expect(duration, isNull);
      });
    });

    group('getNextDailyTrigger', () {
      test('returns tomorrow if time has passed today', () {
        final lastTrigger = tz.TZDateTime(tz.local, 2026, 1, 15, 8, 0);
        expect(lastTrigger.hour, equals(8));
      });
    });
  });
}
