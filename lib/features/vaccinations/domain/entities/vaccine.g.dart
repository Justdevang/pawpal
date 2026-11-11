// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineImpl _$$VaccineImplFromJson(Map<String, dynamic> json) =>
    _$VaccineImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      species: json['species'] as String,
      description: json['description'] as String?,
      initialDoseWeeks: (json['initialDoseWeeks'] as num?)?.toInt(),
      boosterIntervalWeeks: (json['boosterIntervalWeeks'] as num?)?.toInt(),
      boosterCount: (json['boosterCount'] as num?)?.toInt(),
      region: json['region'] as String? ?? 'global',
      isCore: json['isCore'] as bool? ?? false,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VaccineImplToJson(_$VaccineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'description': instance.description,
      'initialDoseWeeks': instance.initialDoseWeeks,
      'boosterIntervalWeeks': instance.boosterIntervalWeeks,
      'boosterCount': instance.boosterCount,
      'region': instance.region,
      'isCore': instance.isCore,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
