import 'package:drift/drift.dart';

import '../../../../core/database/database.dart' as db;
import '../../domain/entities/vaccination_record.dart' as domain;
import '../../domain/entities/vaccine.dart' as domain;
import 'vaccination_models.dart';

extension VaccinationRecordModelCompanionX on VaccinationRecordModel {
  db.VaccinationRecordsCompanion toCompanion({final bool insert = false}) => db.VaccinationRecordsCompanion(
      id: insert ? const Value.absent() : Value(id),
      petId: Value(petId),
      vaccineId: Value(vaccineId),
      vaccineName: Value(vaccineName),
      dateGiven: Value(dateGiven),
      nextDueDate: Value(nextDueDate),
      vetClinic: Value(vetClinic),
      batchNumber: Value(batchNumber),
      certificatePhotoUrl: Value(certificatePhotoUrl),
      certificateLocalPath: Value(certificateLocalPath),
      notes: Value(notes),
      isCompleted: Value(isCompleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
    );
}

extension DbVaccineX on db.Vaccine {
  domain.Vaccine toEntity() => domain.Vaccine(
    id: id,
    name: name,
    species: species,
    description: description,
    initialDoseWeeks: initialDoseWeeks,
    boosterIntervalWeeks: boosterIntervalWeeks,
    boosterCount: boosterCount,
    region: region,
    isCore: isCore,
    notes: notes,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension DbVaccinationRecordX on db.VaccinationRecord {
  domain.VaccinationRecord toEntity() => domain.VaccinationRecord(
    id: id,
    petId: petId,
    vaccineId: vaccineId,
    vaccineName: vaccineName,
    dateGiven: dateGiven,
    nextDueDate: nextDueDate,
    vetClinic: vetClinic,
    batchNumber: batchNumber,
    certificatePhotoUrl: certificatePhotoUrl,
    certificateLocalPath: certificateLocalPath,
    notes: notes,
    isCompleted: isCompleted,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}
