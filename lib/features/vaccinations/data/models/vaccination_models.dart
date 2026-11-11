// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/vaccine.dart';
import '../../domain/entities/vaccination_record.dart';

part 'vaccination_models.freezed.dart';
part 'vaccination_models.g.dart';

@freezed
abstract class VaccineModel with _$VaccineModel {
  const factory VaccineModel({
    required int id,
    required String name,
    required String species,
    String? description,
    int? initialDoseWeeks,
    int? boosterIntervalWeeks,
    int? boosterCount,
    @Default('global') String region,
    @Default(false) bool isCore,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _VaccineModel;

  const VaccineModel._();

  factory VaccineModel.fromJson(Map<String, dynamic> json) => _$VaccineModelFromJson(json);

  factory VaccineModel.fromEntity(Vaccine vaccine) {
    return VaccineModel(
      id: vaccine.id,
      name: vaccine.name,
      species: vaccine.species,
      description: vaccine.description,
      initialDoseWeeks: vaccine.initialDoseWeeks,
      boosterIntervalWeeks: vaccine.boosterIntervalWeeks,
      boosterCount: vaccine.boosterCount,
      region: vaccine.region,
      isCore: vaccine.isCore,
      notes: vaccine.notes,
      createdAt: vaccine.createdAt,
      updatedAt: vaccine.updatedAt,
    );
  }

  Vaccine toEntity() {
    return Vaccine(
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
}

@freezed
abstract class VaccinationRecordModel with _$VaccinationRecordModel {
  const factory VaccinationRecordModel({
    required int id,
    required int petId,
    required int vaccineId,
    required String vaccineName,
    required DateTime dateGiven,
    DateTime? nextDueDate,
    String? vetClinic,
    String? batchNumber,
    String? certificatePhotoUrl,
    String? certificateLocalPath,
    String? notes,
    @Default(true) bool isCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _VaccinationRecordModel;

  const VaccinationRecordModel._();

  factory VaccinationRecordModel.fromJson(Map<String, dynamic> json) => _$VaccinationRecordModelFromJson(json);

  factory VaccinationRecordModel.fromEntity(VaccinationRecord record) {
    return VaccinationRecordModel(
      id: record.id,
      petId: record.petId,
      vaccineId: record.vaccineId,
      vaccineName: record.vaccineName,
      dateGiven: record.dateGiven,
      nextDueDate: record.nextDueDate,
      vetClinic: record.vetClinic,
      batchNumber: record.batchNumber,
      certificatePhotoUrl: record.certificatePhotoUrl,
      certificateLocalPath: record.certificateLocalPath,
      notes: record.notes,
      isCompleted: record.isCompleted,
      createdAt: record.createdAt,
      updatedAt: record.updatedAt,
      deletedAt: record.deletedAt,
    );
  }

  VaccinationRecord toEntity() {
    return VaccinationRecord(
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
}