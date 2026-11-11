// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/dose_logs.dart';

part 'dose_log_dao.g.dart';

@DriftAccessor(tables: [DoseLogs])
class DoseLogDao extends DatabaseAccessor<AppDatabase> with _$DoseLogDaoMixin {
  DoseLogDao(super.db);

  Future<List<DoseLog>> getLogsByMedicationId(int medicationId, {DateTime? from, DateTime? to}) {
    var query = select(doseLogs)..where((l) => l.medicationId.equals(medicationId));
    if (from != null) {
      query = query..where((l) => l.scheduledTime.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query = query..where((l) => l.scheduledTime.isSmallerOrEqualValue(to));
    }
    query.orderBy([(l) => OrderingTerm.desc(l.scheduledTime)]);
    return query.get();
  }

  Stream<List<DoseLog>> watchLogsByMedicationId(int medicationId, {DateTime? from, DateTime? to}) {
    var query = select(doseLogs)..where((l) => l.medicationId.equals(medicationId));
    if (from != null) {
      query = query..where((l) => l.scheduledTime.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query = query..where((l) => l.scheduledTime.isSmallerOrEqualValue(to));
    }
    query.orderBy([(l) => OrderingTerm.desc(l.scheduledTime)]);
    return query.watch();
  }

  Future<int> insertLog(DoseLogsCompanion log) {
    return into(doseLogs).insert(log);
  }

  Future<int> getAdherenceStreak(int medicationId) async {
    // Calculate consecutive days with all doses taken
    // This is a simplified version - in practice you'd want a more sophisticated query
    final logs = await getLogsByMedicationId(medicationId);
    int streak = 0;
    DateTime? lastDate;
    for (final log in logs) {
      if (log.wasTaken && !log.wasSkipped) {
        final logDate = DateTime(log.scheduledTime.year, log.scheduledTime.month, log.scheduledTime.day);
        if (lastDate == null || logDate == lastDate.subtract(const Duration(days: 1))) {
          streak++;
          lastDate = logDate;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    return streak;
  }
}