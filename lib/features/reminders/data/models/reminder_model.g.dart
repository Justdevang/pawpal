// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderModelImpl _$$ReminderModelImplFromJson(Map<String, dynamic> json) =>
    _$ReminderModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      scheduleRule: json['scheduleRule'] as String,
      nextTriggerAt: DateTime.parse(json['nextTriggerAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      petId: (json['petId'] as num?)?.toInt(),
      description: json['description'] as String?,
      payload: json['payload'] as String?,
      lastTriggeredAt: json['lastTriggeredAt'] == null
          ? null
          : DateTime.parse(json['lastTriggeredAt'] as String),
      escalationCount: (json['escalationCount'] as num?)?.toInt() ?? 0,
      maxEscalations: (json['maxEscalations'] as num?)?.toInt() ?? 3,
      isEnabled: json['isEnabled'] as bool? ?? true,
      notifyFamily: json['notifyFamily'] as bool? ?? false,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$ReminderModelImplToJson(_$ReminderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'title': instance.title,
      'scheduleRule': instance.scheduleRule,
      'nextTriggerAt': instance.nextTriggerAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'petId': instance.petId,
      'description': instance.description,
      'payload': instance.payload,
      'lastTriggeredAt': instance.lastTriggeredAt?.toIso8601String(),
      'escalationCount': instance.escalationCount,
      'maxEscalations': instance.maxEscalations,
      'isEnabled': instance.isEnabled,
      'notifyFamily': instance.notifyFamily,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
