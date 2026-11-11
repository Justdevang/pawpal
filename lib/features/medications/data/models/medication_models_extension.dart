import 'package:drift/drift.dart';

import '../../../../core/database/database.dart' as db;
import '../../domain/entities/dose_log.dart' as domain;
import '../../domain/entities/dose_schedule.dart' as domain;
import '../../domain/entities/medication.dart' as domain;
import 'medication_models.dart';

extension MedicationModelCompanionX on MedicationModel {
  db.MedicationsCompanion toCompanion({final bool insert = false}) => db.MedicationsCompanion(
      id: insert ? const Value.absent() : Value(id),
      petId: Value(petId),
      name: Value(name),
      dosage: Value(dosage),
      form: Value(form),
      frequencyType: Value(frequencyType),
      timesPerDay: Value(timesPerDay),
      everyNHours: Value(everyNHours),
      specificWeekdays: Value(specificWeekdays?.join(',')),
      customCron: Value(customCron),
      startDate: Value(startDate),
      endDate: Value(endDate),
      withFood: Value(withFood),
      instructions: Value(instructions),
      remainingDoses: Value(remainingDoses),
      refillThreshold: Value(refillThreshold),
      vetClinic: Value(vetClinic),
      prescribingVet: Value(prescribingVet),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
    );
}

extension DoseScheduleModelCompanionX on DoseScheduleModel {
  db.DoseSchedulesCompanion toCompanion({final bool insert = false}) => db.DoseSchedulesCompanion(
      id: insert ? const Value.absent() : Value(id),
      medicationId: Value(medicationId),
      scheduledTime: Value(scheduledTime),
      isTaken: Value(isTaken),
      isSkipped: Value(isSkipped),
      takenAt: Value(takenAt),
      notes: Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
}

extension DoseLogModelCompanionX on DoseLogModel {
  db.DoseLogsCompanion toCompanion({final bool insert = false}) => db.DoseLogsCompanion(
      id: insert ? const Value.absent() : Value(id),
      medicationId: Value(medicationId),
      doseScheduleId: Value(doseScheduleId),
      scheduledTime: Value(scheduledTime),
      actualTime: Value(actualTime),
      wasTaken: Value(wasTaken),
      wasSkipped: Value(wasSkipped),
      notes: Value(notes),
      sideEffects: Value(sideEffects),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
}

extension DbMedicationX on db.Medication {
  domain.Medication toEntity() => domain.Medication(
    id: id,
    petId: petId,
    name: name,
    dosage: dosage,
    form: form,
    frequencyType: frequencyType,
    timesPerDay: timesPerDay,
    everyNHours: everyNHours,
    specificWeekdays: specificWeekdays != null && specificWeekdays!.isNotEmpty
        ? specificWeekdays!.split(',').where((final String s) => s.isNotEmpty).map(int.parse).toList()
        : null,
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

extension DbDoseScheduleX on db.DoseSchedule {
  domain.DoseSchedule toEntity() => domain.DoseSchedule(
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

extension DbDoseLogX on db.DoseLog {
  domain.DoseLog toEntity() => domain.DoseLog(
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
