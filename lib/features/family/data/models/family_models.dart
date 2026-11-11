// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/family_member.dart';

part 'family_models.freezed.dart';
part 'family_models.g.dart';

@freezed
abstract class FamilyMemberModel with _$FamilyMemberModel {
  const factory FamilyMemberModel({
    required int id,
    required int petId,
    int? userId,
    required String email,
    String? name,
    @Default('viewer') String role,
    @Default('pending') String status,
    required String invitedBy,
    required DateTime invitedAt,
    DateTime? respondedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FamilyMemberModel;

  const FamilyMemberModel._();

  factory FamilyMemberModel.fromJson(Map<String, dynamic> json) => _$FamilyMemberModelFromJson(json);

  factory FamilyMemberModel.fromEntity(FamilyMember member) {
    return FamilyMemberModel(
      id: member.id,
      petId: member.petId,
      userId: member.userId,
      email: member.email,
      name: member.name,
      role: member.role,
      status: member.status,
      invitedBy: member.invitedBy,
      invitedAt: member.invitedAt,
      respondedAt: member.respondedAt,
      createdAt: member.createdAt,
      updatedAt: member.updatedAt,
    );
  }

  FamilyMember toEntity() {
    return FamilyMember(
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
}