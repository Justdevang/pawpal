// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/vaccination_records.dart';

part 'vaccination_record_dao.g.dart';

@DriftAccessor(tables: [VaccinationRecords])
class VaccinationRecordDao extends DatabaseAccessor<AppDatabase> with _$VaccinationRecordDaoMixin {
  VaccinationRecordDao(super.db);

  Future<List<VaccinationRecord>> getRecordsByPetId(int petId) {
    return (select(vaccinationRecords)
          ..where((r) => r.petId.equals(petId) & r.deletedAt.isNull())
          ..orderBy([(r) => OrderingTerm.desc(r.dateGiven)]))
        .get();
  }

  Stream<List<VaccinationRecord>> watchRecordsByPetId(int petId) {
    return (select(vaccinationRecords)
          ..where((r) => r.petId.equals(petId) & r.deletedAt.isNull())
          ..orderBy([(r) => OrderingTerm.desc(r.dateGiven)]))
        .watch();
  }

  Future<List<VaccinationRecord>> getUpcomingRecords(int petId, DateTime until) {
    return (select(vaccinationRecords)
          ..where((r) =>
              r.petId.equals(petId) &
              r.deletedAt.isNull() &
              r.nextDueDate.isNotNull() &
              r.nextDueDate.isSmallerOrEqualValue(until) &
              r.isCompleted.equals(true)))
        .get();
  }

  Future<List<VaccinationRecord>> getOverdueRecords(int petId, DateTime asOf) {
    return (select(vaccinationRecords)
          ..where((r) =>
              r.petId.equals(petId) &
              r.deletedAt.isNull() &
              r.nextDueDate.isNotNull() &
              r.nextDueDate.isSmallerThanValue(asOf) &
              r.isCompleted.equals(true)))
        .get();
  }

  Future<VaccinationRecord?> getRecordById(int id) {
    return (select(vaccinationRecords)..where((r) => r.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertRecord(VaccinationRecordsCompanion record) {
    return into(vaccinationRecords).insert(record);
  }

  Future<bool> updateRecord(VaccinationRecordsCompanion record) {
    return update(vaccinationRecords).replace(record);
  }

  Future<int> softDeleteRecord(int id) {
    return (update(vaccinationRecords)..where((r) => r.id.equals(id)))
        .write(VaccinationRecordsCompanion(deletedAt: Value(DateTime.now())));
  }
}