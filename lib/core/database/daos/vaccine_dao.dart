// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/vaccines.dart';

part 'vaccine_dao.g.dart';

@DriftAccessor(tables: [Vaccines])
class VaccineDao extends DatabaseAccessor<AppDatabase> with _$VaccineDaoMixin {
  VaccineDao(super.db);

  Future<List<Vaccine>> getVaccinesBySpecies(String species, {String region = 'global'}) {
    return (select(vaccines)
          ..where((v) => v.species.equals(species) & (v.region.equals(region) | v.region.equals('global')))
          ..orderBy([(v) => OrderingTerm.asc(v.name)]))
        .get();
  }

  Future<List<Vaccine>> getCoreVaccinesBySpecies(String species, {String region = 'global'}) {
    return (select(vaccines)
          ..where((v) => v.species.equals(species) & v.isCore.equals(true) & (v.region.equals(region) | v.region.equals('global')))
          ..orderBy([(v) => OrderingTerm.asc(v.name)]))
        .get();
  }

  Future<Vaccine?> getVaccineById(int id) {
    return (select(vaccines)..where((v) => v.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertVaccine(VaccinesCompanion vaccine) {
    return into(vaccines).insert(vaccine);
  }

  Future<bool> updateVaccine(VaccinesCompanion vaccine) {
    return update(vaccines).replace(vaccine);
  }

  Future<int> deleteVaccine(int id) {
    return (delete(vaccines)..where((v) => v.id.equals(id))).go();
  }

  Stream<List<Vaccine>> watchVaccinesBySpecies(String species, {String region = 'global'}) {
    return (select(vaccines)
          ..where((v) => v.species.equals(species) & (v.region.equals(region) | v.region.equals('global')))
          ..orderBy([(v) => OrderingTerm.asc(v.name)]))
        .watch();
  }
}