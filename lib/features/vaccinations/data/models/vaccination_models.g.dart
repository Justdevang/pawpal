// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineModelImpl _$$VaccineModelImplFromJson(Map<String, dynamic> json) =>
    _$VaccineModelImpl(
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

Map<String, dynamic> _$$VaccineModelImplToJson(_$VaccineModelImpl instance) =>
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

_$VaccinationRecordModelImpl _$$VaccinationRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccinationRecordModelImpl(
      id: (json['id'] as num).toInt(),
      petId: (json['petId'] as num).toInt(),
      vaccineId: (json['vaccineId'] as num).toInt(),
      vaccineName: json['vaccineName'] as String,
      dateGiven: DateTime.parse(json['dateGiven'] as String),
      nextDueDate: json['nextDueDate'] == null
          ? null
          : DateTime.parse(json['nextDueDate'] as String),
      vetClinic: json['vetClinic'] as String?,
      batchNumber: json['batchNumber'] as String?,
      certificatePhotoUrl: json['certificatePhotoUrl'] as String?,
      certificateLocalPath: json['certificateLocalPath'] as String?,
      notes: json['notes'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$VaccinationRecordModelImplToJson(
        _$VaccinationRecordModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'vaccineId': instance.vaccineId,
      'vaccineName': instance.vaccineName,
      'dateGiven': instance.dateGiven.toIso8601String(),
      'nextDueDate': instance.nextDueDate?.toIso8601String(),
      'vetClinic': instance.vetClinic,
      'batchNumber': instance.batchNumber,
      'certificatePhotoUrl': instance.certificatePhotoUrl,
      'certificateLocalPath': instance.certificateLocalPath,
      'notes': instance.notes,
      'isCompleted': instance.isCompleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
