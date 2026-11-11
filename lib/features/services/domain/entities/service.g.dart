// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      route: json['route'] as String?,
      isEnabled: json['isEnabled'] as bool? ?? true,
      settingsSchema: json['settingsSchema'] as String?,
      reminderTypes: (json['reminderTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'iconName': instance.iconName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'route': instance.route,
      'isEnabled': instance.isEnabled,
      'settingsSchema': instance.settingsSchema,
      'reminderTypes': instance.reminderTypes,
      'sortOrder': instance.sortOrder,
    };
