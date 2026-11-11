// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/pets.dart';

part 'pet_dao.g.dart';

@DriftAccessor(tables: [Pets])
class PetDao extends DatabaseAccessor<AppDatabase> with _$PetDaoMixin {
  PetDao(super.db);

  Future<List<Pet>> getAllPets(int userId) {
    return (select(pets)
          ..where((p) => p.userId.equals(userId) & p.isArchived.equals(false))
          ..orderBy([(p) => OrderingTerm.desc(p.createdAt)]))
        .get();
  }

  Stream<List<Pet>> watchAllPets(int userId) {
    return (select(pets)
          ..where((p) => p.userId.equals(userId) & p.isArchived.equals(false))
          ..orderBy([(p) => OrderingTerm.desc(p.createdAt)]))
        .watch();
  }

  Future<Pet?> getPetById(int id) {
    return (select(pets)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertPet(PetsCompanion pet) {
    return into(pets).insert(pet);
  }

  Future<bool> updatePet(PetsCompanion pet) {
    return update(pets).replace(pet);
  }

  Future<int> archivePet(int id) {
    return (update(pets)..where((p) => p.id.equals(id))).write(PetsCompanion(isArchived: const Value(true)));
  }

  Future<int> deletePet(int id) {
    return (delete(pets)..where((p) => p.id.equals(id))).go();
  }

  Stream<Pet?> watchPet(int id) {
    return (select(pets)..where((p) => p.id.equals(id))).watchSingleOrNull();
  }
}