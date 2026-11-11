// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoseScheduleImpl _$$DoseScheduleImplFromJson(Map<String, dynamic> json) =>
    _$DoseScheduleImpl(
      id: (json['id'] as num).toInt(),
      medicationId: (json['medicationId'] as num).toInt(),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      isTaken: json['isTaken'] as bool? ?? false,
      isSkipped: json['isSkipped'] as bool? ?? false,
      takenAt: json['takenAt'] == null
          ? null
          : DateTime.parse(json['takenAt'] as String),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DoseScheduleImplToJson(_$DoseScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicationId': instance.medicationId,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'isTaken': instance.isTaken,
      'isSkipped': instance.isSkipped,
      'takenAt': instance.takenAt?.toIso8601String(),
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
