// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/family_members.dart';

part 'family_member_dao.g.dart';

@DriftAccessor(tables: [FamilyMembers])
class FamilyMemberDao extends DatabaseAccessor<AppDatabase> with _$FamilyMemberDaoMixin {
  FamilyMemberDao(super.db);

  Future<List<FamilyMember>> getFamilyMembersByPetId(int petId) {
    return (select(familyMembers)
          ..where((f) => f.petId.equals(petId))
          ..orderBy([(f) => OrderingTerm.asc(f.invitedAt)]))
        .get();
  }

  Stream<List<FamilyMember>> watchFamilyMembersByPetId(int petId) {
    return (select(familyMembers)
          ..where((f) => f.petId.equals(petId))
          ..orderBy([(f) => OrderingTerm.asc(f.invitedAt)]))
        .watch();
  }

  Future<List<FamilyMember>> getPendingInvitesByEmail(String email) {
    return (select(familyMembers)
          ..where((f) => f.email.equals(email) & f.status.equals('pending')))
        .get();
  }

  Future<FamilyMember?> getFamilyMemberById(int id) {
    return (select(familyMembers)..where((f) => f.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertFamilyMember(FamilyMembersCompanion member) {
    return into(familyMembers).insert(member);
  }

  Future<bool> updateFamilyMember(FamilyMembersCompanion member) {
    return update(familyMembers).replace(member);
  }

  Future<int> deleteFamilyMember(int id) {
    return (delete(familyMembers)..where((f) => f.id.equals(id))).go();
  }
}