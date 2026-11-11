// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyMemberImpl _$$FamilyMemberImplFromJson(Map<String, dynamic> json) =>
    _$FamilyMemberImpl(
      id: (json['id'] as num).toInt(),
      petId: (json['petId'] as num).toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      email: json['email'] as String,
      name: json['name'] as String?,
      role: json['role'] as String? ?? 'viewer',
      status: json['status'] as String? ?? 'pending',
      invitedBy: json['invitedBy'] as String,
      invitedAt: DateTime.parse(json['invitedAt'] as String),
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FamilyMemberImplToJson(_$FamilyMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'userId': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'status': instance.status,
      'invitedBy': instance.invitedBy,
      'invitedAt': instance.invitedAt.toIso8601String(),
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
