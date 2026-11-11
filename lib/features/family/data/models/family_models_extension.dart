import 'package:drift/drift.dart';
import '../../../../core/database/database.dart' as db;
import '../../domain/entities/family_member.dart' as domain;
import 'family_models.dart';

extension FamilyMemberModelCompanionX on FamilyMemberModel {
  db.FamilyMembersCompanion toCompanion({final bool insert = false}) => db.FamilyMembersCompanion(
      id: insert ? const Value.absent() : Value(id),
      petId: Value(petId),
      userId: Value(userId),
      email: Value(email),
      name: Value(name),
      role: Value(role),
      status: Value(status),
      invitedBy: Value(invitedBy),
      invitedAt: Value(invitedAt),
      respondedAt: Value(respondedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
}

extension DbFamilyMemberX on db.FamilyMember {
  domain.FamilyMember toEntity() => domain.FamilyMember(
    id: id,
    petId: petId,
    userId: userId,
    email: email,
    name: name,
    role: role,
    status: status,
    invitedBy: invitedBy,
    invitedAt: invitedAt,
    respondedAt: respondedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
