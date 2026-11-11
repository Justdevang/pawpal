// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/medications.dart';

part 'medication_dao.g.dart';

@DriftAccessor(tables: [Medications])
class MedicationDao extends DatabaseAccessor<AppDatabase> with _$MedicationDaoMixin {
  MedicationDao(super.db);

  Future<List<Medication>> getMedicationsByPetId(int petId, {bool activeOnly = true}) {
    final query = select(medications)
      ..where((m) => m.petId.equals(petId) & m.deletedAt.isNull());
    if (activeOnly) {
      query.where((m) => m.isActive.equals(true));
    }
    query.orderBy([(m) => OrderingTerm.desc(m.createdAt)]);
    return query.get();
  }

  Stream<List<Medication>> watchMedicationsByPetId(int petId, {bool activeOnly = true}) {
    final query = select(medications)
      ..where((m) => m.petId.equals(petId) & m.deletedAt.isNull());
    if (activeOnly) {
      query.where((m) => m.isActive.equals(true));
    }
    query.orderBy([(m) => OrderingTerm.desc(m.createdAt)]);
    return query.watch();
  }

  Future<Medication?> getMedicationById(int id) {
    return (select(medications)..where((m) => m.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertMedication(MedicationsCompanion medication) {
    return into(medications).insert(medication);
  }

  Future<bool> updateMedication(MedicationsCompanion medication) {
    return update(medications).replace(medication);
  }

  Future<int> softDeleteMedication(int id) {
    return (update(medications)..where((m) => m.id.equals(id)))
        .write(MedicationsCompanion(deletedAt: Value(DateTime.now()), isActive: const Value(false)));
  }

  Future<List<Medication>> getMedicationsNeedingRefill(int petId) {
    return (select(medications)
          ..where((m) =>
              m.petId.equals(petId) &
              m.deletedAt.isNull() &
              m.isActive.equals(true) &
              m.remainingDoses.isNotNull() &
              m.refillThreshold.isNotNull() &
              m.remainingDoses.isSmallerOrEqual(m.refillThreshold)))
        .get();
  }
}