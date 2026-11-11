// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccination_record.freezed.dart';
part 'vaccination_record.g.dart';

@freezed
abstract class VaccinationRecord with _$VaccinationRecord {
  const factory VaccinationRecord({
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
  }) = _VaccinationRecord;

  factory VaccinationRecord.fromJson(Map<String, dynamic> json) => _$VaccinationRecordFromJson(json);
}