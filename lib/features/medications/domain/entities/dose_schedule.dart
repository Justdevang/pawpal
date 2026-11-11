// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dose_schedule.freezed.dart';
part 'dose_schedule.g.dart';

@freezed
abstract class DoseSchedule with _$DoseSchedule {
  const factory DoseSchedule({
    required int id,
    required int medicationId,
    required DateTime scheduledTime,
    @Default(false) bool isTaken,
    @Default(false) bool isSkipped,
    DateTime? takenAt,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DoseSchedule;

  factory DoseSchedule.fromJson(Map<String, dynamic> json) => _$DoseScheduleFromJson(json);
}