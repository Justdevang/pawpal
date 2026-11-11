// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication.freezed.dart';
part 'medication.g.dart';

@freezed
abstract class Medication with _$Medication {
  const factory Medication({
    required int id,
    required int petId,
    required String name,
    required String dosage,
    required String form,
    required String frequencyType, // once, daily, times_per_day, every_n_hours, specific_weekdays, custom
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
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) => _$MedicationFromJson(json);
}