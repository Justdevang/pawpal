// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccinationRecordImpl _$$VaccinationRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccinationRecordImpl(
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

Map<String, dynamic> _$$VaccinationRecordImplToJson(
        _$VaccinationRecordImpl instance) =>
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
