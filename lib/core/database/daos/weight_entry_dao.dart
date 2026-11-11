// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/weight_entries.dart';

part 'weight_entry_dao.g.dart';

@DriftAccessor(tables: [WeightEntries])
class WeightEntryDao extends DatabaseAccessor<AppDatabase> with _$WeightEntryDaoMixin {
  WeightEntryDao(super.db);

  Future<List<WeightEntry>> getWeightEntriesByPetId(int petId) {
    return (select(weightEntries)
          ..where((w) => w.petId.equals(petId) & w.deletedAt.isNull())
          ..orderBy([(w) => OrderingTerm.asc(w.date)]))
        .get();
  }

  Stream<List<WeightEntry>> watchWeightEntriesByPetId(int petId) {
    return (select(weightEntries)
          ..where((w) => w.petId.equals(petId) & w.deletedAt.isNull())
          ..orderBy([(w) => OrderingTerm.asc(w.date)]))
        .watch();
  }

  Future<WeightEntry?> getLatestWeightEntry(int petId) {
    return (select(weightEntries)
          ..where((w) => w.petId.equals(petId) & w.deletedAt.isNull())
          ..orderBy([(w) => OrderingTerm.desc(w.date)]))
        .getSingleOrNull();
  }

  Future<WeightEntry?> getWeightEntryById(int id) {
    return (select(weightEntries)..where((w) => w.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertWeightEntry(WeightEntriesCompanion entry) {
    return into(weightEntries).insert(entry);
  }

  Future<bool> updateWeightEntry(WeightEntriesCompanion entry) {
    return update(weightEntries).replace(entry);
  }

  Future<int> softDeleteWeightEntry(int id) {
    return (update(weightEntries)..where((w) => w.id.equals(id)))
        .write(WeightEntriesCompanion(deletedAt: Value(DateTime.now())));
  }
}