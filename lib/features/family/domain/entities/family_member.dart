// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_member.freezed.dart';
part 'family_member.g.dart';

@freezed
class FamilyMember with _$FamilyMember {
  const factory FamilyMember({
    required int id,
    required int petId,
    int? userId,
    required String email,
    String? name,
    @Default('viewer') String role, // owner, editor, viewer
    @Default('pending') String status, // pending, accepted, declined
    required String invitedBy,
    required DateTime invitedAt,
    DateTime? respondedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FamilyMember;

  factory FamilyMember.fromJson(Map<String, dynamic> json) => _$FamilyMemberFromJson(json);
}