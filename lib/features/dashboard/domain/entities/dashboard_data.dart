// ignore_for_file: type=lint
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
abstract class DashboardDataEntity with _$DashboardDataEntity {
  const factory DashboardDataEntity({
    required List<PetSummary> pets,
    required List<TaskSummary> todaysTasks,
    required List<TaskSummary> overdueTasks,
    required List<TaskSummary> upcomingTasks,
    required HealthSummary? healthSummary,
    required int totalPets,
    required int activeMedications,
    required int upcomingVaccinations,
    required int overdueItems,
  }) = _DashboardDataEntity;

  factory DashboardDataEntity.empty() => DashboardDataEntity(
    pets: [],
    todaysTasks: [],
    overdueTasks: [],
    upcomingTasks: [],
    healthSummary: null,
    totalPets: 0,
    activeMedications: 0,
    upcomingVaccinations: 0,
    overdueItems: 0,
  );

  factory DashboardDataEntity.fromJson(Map<String, dynamic> json) => _$DashboardDataEntityFromJson(json);
}

@freezed
abstract class PetSummary with _$PetSummary {
  const factory PetSummary({
    required int id,
    required String name,
    required String species,
    String? breed,
    String? photoUrl,
    String? localPhotoPath,
    @Default(false) bool isSelected,
  }) = _PetSummary;

  factory PetSummary.fromJson(Map<String, dynamic> json) => _$PetSummaryFromJson(json);
}

@freezed
abstract class TaskSummary with _$TaskSummary {
  const factory TaskSummary({
    required int id,
    required String type, // medication, vaccination, appointment, weight
    required String title,
    required String petName,
    int? petId,
    required DateTime scheduledTime,
    String? description,
    @Default(false) bool isCompleted,
    @Default(false) bool isOverdue,
  }) = _TaskSummary;

  factory TaskSummary.fromJson(Map<String, dynamic> json) => _$TaskSummaryFromJson(json);
}

@freezed
abstract class HealthSummary with _$HealthSummary {
  const factory HealthSummary({
    required String petName,
    required String weight,
    required String healthStatus,
    required String lastVetVisit,
    String? petImageUrl,
    String? petLocalPath,
  }) = _HealthSummary;

  factory HealthSummary.fromJson(Map<String, dynamic> json) => _$HealthSummaryFromJson(json);
}