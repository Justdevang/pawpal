// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      isGuest: json['isGuest'] as bool? ?? false,
      preferredLanguage: json['preferredLanguage'] as String? ?? 'en',
      units: json['units'] as String? ?? 'metric',
      darkMode: json['darkMode'] as bool? ?? false,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      quietHoursStart: json['quietHoursStart'] == null
          ? null
          : DateTime.parse(json['quietHoursStart'] as String),
      quietHoursEnd: json['quietHoursEnd'] == null
          ? null
          : DateTime.parse(json['quietHoursEnd'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'isGuest': instance.isGuest,
      'preferredLanguage': instance.preferredLanguage,
      'units': instance.units,
      'darkMode': instance.darkMode,
      'notificationsEnabled': instance.notificationsEnabled,
      'quietHoursStart': instance.quietHoursStart?.toIso8601String(),
      'quietHoursEnd': instance.quietHoursEnd?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
