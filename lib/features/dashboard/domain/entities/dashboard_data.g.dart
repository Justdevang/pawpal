// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDataEntityImpl _$$DashboardDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardDataEntityImpl(
      pets: (json['pets'] as List<dynamic>)
          .map((e) => PetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      todaysTasks: (json['todaysTasks'] as List<dynamic>)
          .map((e) => TaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      overdueTasks: (json['overdueTasks'] as List<dynamic>)
          .map((e) => TaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcomingTasks: (json['upcomingTasks'] as List<dynamic>)
          .map((e) => TaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      healthSummary: json['healthSummary'] == null
          ? null
          : HealthSummary.fromJson(
              json['healthSummary'] as Map<String, dynamic>),
      totalPets: (json['totalPets'] as num).toInt(),
      activeMedications: (json['activeMedications'] as num).toInt(),
      upcomingVaccinations: (json['upcomingVaccinations'] as num).toInt(),
      overdueItems: (json['overdueItems'] as num).toInt(),
    );

Map<String, dynamic> _$$DashboardDataEntityImplToJson(
        _$DashboardDataEntityImpl instance) =>
    <String, dynamic>{
      'pets': instance.pets,
      'todaysTasks': instance.todaysTasks,
      'overdueTasks': instance.overdueTasks,
      'upcomingTasks': instance.upcomingTasks,
      'healthSummary': instance.healthSummary,
      'totalPets': instance.totalPets,
      'activeMedications': instance.activeMedications,
      'upcomingVaccinations': instance.upcomingVaccinations,
      'overdueItems': instance.overdueItems,
    };

_$PetSummaryImpl _$$PetSummaryImplFromJson(Map<String, dynamic> json) =>
    _$PetSummaryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      species: json['species'] as String,
      breed: json['breed'] as String?,
      photoUrl: json['photoUrl'] as String?,
      localPhotoPath: json['localPhotoPath'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$PetSummaryImplToJson(_$PetSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'breed': instance.breed,
      'photoUrl': instance.photoUrl,
      'localPhotoPath': instance.localPhotoPath,
      'isSelected': instance.isSelected,
    };

_$TaskSummaryImpl _$$TaskSummaryImplFromJson(Map<String, dynamic> json) =>
    _$TaskSummaryImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      petName: json['petName'] as String,
      petId: (json['petId'] as num?)?.toInt(),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      isOverdue: json['isOverdue'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskSummaryImplToJson(_$TaskSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'petName': instance.petName,
      'petId': instance.petId,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'isOverdue': instance.isOverdue,
    };

_$HealthSummaryImpl _$$HealthSummaryImplFromJson(Map<String, dynamic> json) =>
    _$HealthSummaryImpl(
      petName: json['petName'] as String,
      weight: json['weight'] as String,
      healthStatus: json['healthStatus'] as String,
      lastVetVisit: json['lastVetVisit'] as String,
      petImageUrl: json['petImageUrl'] as String?,
      petLocalPath: json['petLocalPath'] as String?,
    );

Map<String, dynamic> _$$HealthSummaryImplToJson(_$HealthSummaryImpl instance) =>
    <String, dynamic>{
      'petName': instance.petName,
      'weight': instance.weight,
      'healthStatus': instance.healthStatus,
      'lastVetVisit': instance.lastVetVisit,
      'petImageUrl': instance.petImageUrl,
      'petLocalPath': instance.petLocalPath,
    };
