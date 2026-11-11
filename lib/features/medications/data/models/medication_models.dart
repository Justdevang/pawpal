// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/medication.dart';
import '../../domain/entities/dose_schedule.dart';
import '../../domain/entities/dose_log.dart';

part 'medication_models.freezed.dart';
part 'medication_models.g.dart';

@freezed
abstract class MedicationModel with _$MedicationModel {
  const MedicationModel._();

  const factory MedicationModel({
    required int id,
    required int petId,
    required String name,
    required String dosage,
    required String form,
    required String frequencyType,
    int? timesPerDay,
    int? everyNHours,
    List<int>? specificWeekdays,
    String? customCron,
    required DateTime startDate,
    DateTime? endDate,
    @Default(false) bool withFood,
    String? instructions,
    int? remainingDoses,
    int? refillThreshold,
    String? vetClinic,
    String? prescribingVet,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _MedicationModel;

  factory MedicationModel.fromJson(Map<String, dynamic> json) => _$MedicationModelFromJson(json);

  factory MedicationModel.fromEntity(Medication medication) {
    return MedicationModel(
      id: medication.id,
      petId: medication.petId,
      name: medication.name,
      dosage: medication.dosage,
      form: medication.form,
      frequencyType: medication.frequencyType,
      timesPerDay: medication.timesPerDay,
      everyNHours: medication.everyNHours,
      specificWeekdays: medication.specificWeekdays,
      customCron: medication.customCron,
      startDate: medication.startDate,
      endDate: medication.endDate,
      withFood: medication.withFood,
      instructions: medication.instructions,
      remainingDoses: medication.remainingDoses,
      refillThreshold: medication.refillThreshold,
      vetClinic: medication.vetClinic,
      prescribingVet: medication.prescribingVet,
      isActive: medication.isActive,
      createdAt: medication.createdAt,
      updatedAt: medication.updatedAt,
      deletedAt: medication.deletedAt,
    );
  }

  Medication toEntity() {
    return Medication(
      id: id,
      petId: petId,
      name: name,
      dosage: dosage,
      form: form,
      frequencyType: frequencyType,
      timesPerDay: timesPerDay,
      everyNHours: everyNHours,
      specificWeekdays: specificWeekdays,
      customCron: customCron,
      startDate: startDate,
      endDate: endDate,
      withFood: withFood,
      instructions: instructions,
      remainingDoses: remainingDoses,
      refillThreshold: refillThreshold,
      vetClinic: vetClinic,
      prescribingVet: prescribingVet,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}

@freezed
abstract class DoseScheduleModel with _$DoseScheduleModel {
  const DoseScheduleModel._();

  const factory DoseScheduleModel({
    required int id,
    required int medicationId,
    required DateTime scheduledTime,
    @Default(false) bool isTaken,
    @Default(false) bool isSkipped,
    DateTime? takenAt,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DoseScheduleModel;

  factory DoseScheduleModel.fromJson(Map<String, dynamic> json) => _$DoseScheduleModelFromJson(json);

  factory DoseScheduleModel.fromEntity(DoseSchedule schedule) {
    return DoseScheduleModel(
      id: schedule.id,
      medicationId: schedule.medicationId,
      scheduledTime: schedule.scheduledTime,
      isTaken: schedule.isTaken,
      isSkipped: schedule.isSkipped,
      takenAt: schedule.takenAt,
      notes: schedule.notes,
      createdAt: schedule.createdAt,
      updatedAt: schedule.updatedAt,
    );
  }

  DoseSchedule toEntity() {
    return DoseSchedule(
      id: id,
      medicationId: medicationId,
      scheduledTime: scheduledTime,
      isTaken: isTaken,
      isSkipped: isSkipped,
      takenAt: takenAt,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

@freezed
abstract class DoseLogModel with _$DoseLogModel {
  const DoseLogModel._();

  const factory DoseLogModel({
    required int id,
    required int medicationId,
    int? doseScheduleId,
    required DateTime scheduledTime,
    DateTime? actualTime,
    @Default(false) bool wasTaken,
    @Default(false) bool wasSkipped,
    String? notes,
    String? sideEffects,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DoseLogModel;

  factory DoseLogModel.fromJson(Map<String, dynamic> json) => _$DoseLogModelFromJson(json);

  factory DoseLogModel.fromEntity(DoseLog log) {
    return DoseLogModel(
      id: log.id,
      medicationId: log.medicationId,
      doseScheduleId: log.doseScheduleId,
      scheduledTime: log.scheduledTime,
      actualTime: log.actualTime,
      wasTaken: log.wasTaken,
      wasSkipped: log.wasSkipped,
      notes: log.notes,
      sideEffects: log.sideEffects,
      createdAt: log.createdAt,
      updatedAt: log.updatedAt,
    );
  }

  DoseLog toEntity() {
    return DoseLog(
      id: id,
      medicationId: medicationId,
      doseScheduleId: doseScheduleId,
      scheduledTime: scheduledTime,
      actualTime: actualTime,
      wasTaken: wasTaken,
      wasSkipped: wasSkipped,
      notes: notes,
      sideEffects: sideEffects,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}