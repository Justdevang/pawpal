// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicationModelImpl _$$MedicationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MedicationModelImpl(
      id: (json['id'] as num).toInt(),
      petId: (json['petId'] as num).toInt(),
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      form: json['form'] as String,
      frequencyType: json['frequencyType'] as String,
      timesPerDay: (json['timesPerDay'] as num?)?.toInt(),
      everyNHours: (json['everyNHours'] as num?)?.toInt(),
      specificWeekdays: (json['specificWeekdays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      customCron: json['customCron'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      withFood: json['withFood'] as bool? ?? false,
      instructions: json['instructions'] as String?,
      remainingDoses: (json['remainingDoses'] as num?)?.toInt(),
      refillThreshold: (json['refillThreshold'] as num?)?.toInt(),
      vetClinic: json['vetClinic'] as String?,
      prescribingVet: json['prescribingVet'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$MedicationModelImplToJson(
        _$MedicationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'name': instance.name,
      'dosage': instance.dosage,
      'form': instance.form,
      'frequencyType': instance.frequencyType,
      'timesPerDay': instance.timesPerDay,
      'everyNHours': instance.everyNHours,
      'specificWeekdays': instance.specificWeekdays,
      'customCron': instance.customCron,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'withFood': instance.withFood,
      'instructions': instance.instructions,
      'remainingDoses': instance.remainingDoses,
      'refillThreshold': instance.refillThreshold,
      'vetClinic': instance.vetClinic,
      'prescribingVet': instance.prescribingVet,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_$DoseScheduleModelImpl _$$DoseScheduleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DoseScheduleModelImpl(
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

Map<String, dynamic> _$$DoseScheduleModelImplToJson(
        _$DoseScheduleModelImpl instance) =>
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

_$DoseLogModelImpl _$$DoseLogModelImplFromJson(Map<String, dynamic> json) =>
    _$DoseLogModelImpl(
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

Map<String, dynamic> _$$DoseLogModelImplToJson(_$DoseLogModelImpl instance) =>
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
