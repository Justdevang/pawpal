// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/dose_schedules.dart';

part 'dose_schedule_dao.g.dart';

@DriftAccessor(tables: [DoseSchedules])
class DoseScheduleDao extends DatabaseAccessor<AppDatabase> with _$DoseScheduleDaoMixin {
  DoseScheduleDao(super.db);

  Future<List<DoseSchedule>> getSchedulesByMedicationId(int medicationId, {DateTime? from, DateTime? to}) {
    var query = select(doseSchedules)..where((s) => s.medicationId.equals(medicationId));
    if (from != null) {
      query = query..where((s) => s.scheduledTime.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query = query..where((s) => s.scheduledTime.isSmallerOrEqualValue(to));
    }
    query.orderBy([(s) => OrderingTerm.asc(s.scheduledTime)]);
    return query.get();
  }

  Stream<List<DoseSchedule>> watchSchedulesByMedicationId(int medicationId, {DateTime? from, DateTime? to}) {
    var query = select(doseSchedules)..where((s) => s.medicationId.equals(medicationId));
    if (from != null) {
      query = query..where((s) => s.scheduledTime.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query = query..where((s) => s.scheduledTime.isSmallerOrEqualValue(to));
    }
    query.orderBy([(s) => OrderingTerm.asc(s.scheduledTime)]);
    return query.watch();
  }

  Future<List<DoseSchedule>> getPendingSchedules(int medicationId, DateTime before) {
    return (select(doseSchedules)
          ..where((s) =>
              s.medicationId.equals(medicationId) &
              s.scheduledTime.isSmallerOrEqualValue(before) &
              s.isTaken.equals(false) &
              s.isSkipped.equals(false))
          ..orderBy([(s) => OrderingTerm.asc(s.scheduledTime)]))
        .get();
  }

  Future<int> insertSchedule(DoseSchedulesCompanion schedule) {
    return into(doseSchedules).insert(schedule);
  }

  Future<int> insertSchedules(List<DoseSchedulesCompanion> schedules) async {
    int count = 0;
    await batch((batch) {
      for (final schedule in schedules) {
        batch.insert(doseSchedules, schedule);
        count++;
      }
    });
    return count;
  }

  Future<bool> updateSchedule(DoseSchedulesCompanion schedule) {
    return update(doseSchedules).replace(schedule);
  }

  Future<int> markAsTaken(int id, DateTime takenAt) {
    return (update(doseSchedules)..where((s) => s.id.equals(id)))
        .write(DoseSchedulesCompanion(isTaken: const Value(true), takenAt: Value(takenAt)));
  }

  Future<int> markAsSkipped(int id) {
    return (update(doseSchedules)..where((s) => s.id.equals(id)))
        .write(const DoseSchedulesCompanion(isSkipped: Value(true)));
  }
}