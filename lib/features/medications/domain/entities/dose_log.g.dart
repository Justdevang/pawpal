// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoseLogImpl _$$DoseLogImplFromJson(Map<String, dynamic> json) =>
    _$DoseLogImpl(
      id: (json['id'] as num).toInt(),
      medicationId: (json['medicationId'] as num).toInt(),
      doseScheduleId: (json['doseScheduleId'] as num?)?.toInt(),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      actualTime: json['actualTime'] == null
          ? null
          : DateTime.parse(json['actualTime'] as String),
      wasTaken: json['wasTaken'] as bool? ?? false,
      wasSkipped: json['wasSkipped'] as bool? ?? false,
      notes: json['notes'] as String?,
      sideEffects: json['sideEffects'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DoseLogImplToJson(_$DoseLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicationId': instance.medicationId,
      'doseScheduleId': instance.doseScheduleId,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'actualTime': instance.actualTime?.toIso8601String(),
      'wasTaken': instance.wasTaken,
      'wasSkipped': instance.wasSkipped,
      'notes': instance.notes,
      'sideEffects': instance.sideEffects,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
