// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dose_log.freezed.dart';
part 'dose_log.g.dart';

@freezed
abstract class DoseLog with _$DoseLog {
  const factory DoseLog({
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
  }) = _DoseLog;

  factory DoseLog.fromJson(Map<String, dynamic> json) => _$DoseLogFromJson(json);
}