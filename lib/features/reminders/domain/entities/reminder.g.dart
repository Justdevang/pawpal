// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderImpl _$$ReminderImplFromJson(Map<String, dynamic> json) =>
    _$ReminderImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      petId: (json['petId'] as num?)?.toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      scheduleRule: json['scheduleRule'] as String,
      payload: json['payload'] as String?,
      nextTriggerAt: DateTime.parse(json['nextTriggerAt'] as String),
      lastTriggeredAt: json['lastTriggeredAt'] == null
          ? null
          : DateTime.parse(json['lastTriggeredAt'] as String),
      escalationCount: (json['escalationCount'] as num?)?.toInt() ?? 0,
      maxEscalations: (json['maxEscalations'] as num?)?.toInt() ?? 3,
      isEnabled: json['isEnabled'] as bool? ?? true,
      notifyFamily: json['notifyFamily'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$ReminderImplToJson(_$ReminderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'petId': instance.petId,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'scheduleRule': instance.scheduleRule,
      'payload': instance.payload,
      'nextTriggerAt': instance.nextTriggerAt.toIso8601String(),
      'lastTriggeredAt': instance.lastTriggeredAt?.toIso8601String(),
      'escalationCount': instance.escalationCount,
      'maxEscalations': instance.maxEscalations,
      'isEnabled': instance.isEnabled,
      'notifyFamily': instance.notifyFamily,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
