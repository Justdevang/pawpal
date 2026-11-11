// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine.freezed.dart';
part 'vaccine.g.dart';

@freezed
abstract class Vaccine with _$Vaccine {
  const factory Vaccine({
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
  }) = _Vaccine;

  factory Vaccine.fromJson(Map<String, dynamic> json) => _$VaccineFromJson(json);
}