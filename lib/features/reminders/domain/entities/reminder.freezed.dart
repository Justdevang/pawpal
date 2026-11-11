// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
mixin _$Reminder {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int? get petId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // vaccination, medication, appointment, weight, custom
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get scheduleRule =>
      throw _privateConstructorUsedError; // cron expression or ISO8601 interval
  String? get payload =>
      throw _privateConstructorUsedError; // JSON for type-specific data
  DateTime get nextTriggerAt => throw _privateConstructorUsedError;
  DateTime? get lastTriggeredAt => throw _privateConstructorUsedError;
  int get escalationCount => throw _privateConstructorUsedError;
  int get maxEscalations => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  bool get notifyFamily => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res, Reminder>;
  @useResult
  $Res call(
      {int id,
      int userId,
      int? petId,
      String type,
      String title,
      String? description,
      String scheduleRule,
      String? payload,
      DateTime nextTriggerAt,
      DateTime? lastTriggeredAt,
      int escalationCount,
      int maxEscalations,
      bool isEnabled,
      bool notifyFamily,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res, $Val extends Reminder>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? petId = freezed,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? scheduleRule = null,
    Object? payload = freezed,
    Object? nextTriggerAt = null,
    Object? lastTriggeredAt = freezed,
    Object? escalationCount = null,
    Object? maxEscalations = null,
    Object? isEnabled = null,
    Object? notifyFamily = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleRule: null == scheduleRule
          ? _value.scheduleRule
          : scheduleRule // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTriggerAt: null == nextTriggerAt
          ? _value.nextTriggerAt
          : nextTriggerAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastTriggeredAt: freezed == lastTriggeredAt
          ? _value.lastTriggeredAt
          : lastTriggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      escalationCount: null == escalationCount
          ? _value.escalationCount
          : escalationCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxEscalations: null == maxEscalations
          ? _value.maxEscalations
          : maxEscalations // ignore: cast_nullable_to_non_nullable
              as int,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyFamily: null == notifyFamily
          ? _value.notifyFamily
          : notifyFamily // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderImplCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$$ReminderImplCopyWith(
          _$ReminderImpl value, $Res Function(_$ReminderImpl) then) =
      __$$ReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      int? petId,
      String type,
      String title,
      String? description,
      String scheduleRule,
      String? payload,
      DateTime nextTriggerAt,
      DateTime? lastTriggeredAt,
      int escalationCount,
      int maxEscalations,
      bool isEnabled,
      bool notifyFamily,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$ReminderImplCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$ReminderImpl>
    implements _$$ReminderImplCopyWith<$Res> {
  __$$ReminderImplCopyWithImpl(
      _$ReminderImpl _value, $Res Function(_$ReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? petId = freezed,
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
    Object? scheduleRule = null,
    Object? payload = freezed,
    Object? nextTriggerAt = null,
    Object? lastTriggeredAt = freezed,
    Object? escalationCount = null,
    Object? maxEscalations = null,
    Object? isEnabled = null,
    Object? notifyFamily = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$ReminderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleRule: null == scheduleRule
          ? _value.scheduleRule
          : scheduleRule // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTriggerAt: null == nextTriggerAt
          ? _value.nextTriggerAt
          : nextTriggerAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastTriggeredAt: freezed == lastTriggeredAt
          ? _value.lastTriggeredAt
          : lastTriggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      escalationCount: null == escalationCount
          ? _value.escalationCount
          : escalationCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxEscalations: null == maxEscalations
          ? _value.maxEscalations
          : maxEscalations // ignore: cast_nullable_to_non_nullable
              as int,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyFamily: null == notifyFamily
          ? _value.notifyFamily
          : notifyFamily // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderImpl implements _Reminder {
  const _$ReminderImpl(
      {required this.id,
      required this.userId,
      this.petId,
      required this.type,
      required this.title,
      this.description,
      required this.scheduleRule,
      this.payload,
      required this.nextTriggerAt,
      this.lastTriggeredAt,
      this.escalationCount = 0,
      this.maxEscalations = 3,
      this.isEnabled = true,
      this.notifyFamily = false,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  factory _$ReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int? petId;
  @override
  final String type;
// vaccination, medication, appointment, weight, custom
  @override
  final String title;
  @override
  final String? description;
  @override
  final String scheduleRule;
// cron expression or ISO8601 interval
  @override
  final String? payload;
// JSON for type-specific data
  @override
  final DateTime nextTriggerAt;
  @override
  final DateTime? lastTriggeredAt;
  @override
  @JsonKey()
  final int escalationCount;
  @override
  @JsonKey()
  final int maxEscalations;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  @JsonKey()
  final bool notifyFamily;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Reminder(id: $id, userId: $userId, petId: $petId, type: $type, title: $title, description: $description, scheduleRule: $scheduleRule, payload: $payload, nextTriggerAt: $nextTriggerAt, lastTriggeredAt: $lastTriggeredAt, escalationCount: $escalationCount, maxEscalations: $maxEscalations, isEnabled: $isEnabled, notifyFamily: $notifyFamily, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scheduleRule, scheduleRule) ||
                other.scheduleRule == scheduleRule) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.nextTriggerAt, nextTriggerAt) ||
                other.nextTriggerAt == nextTriggerAt) &&
            (identical(other.lastTriggeredAt, lastTriggeredAt) ||
                other.lastTriggeredAt == lastTriggeredAt) &&
            (identical(other.escalationCount, escalationCount) ||
                other.escalationCount == escalationCount) &&
            (identical(other.maxEscalations, maxEscalations) ||
                other.maxEscalations == maxEscalations) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.notifyFamily, notifyFamily) ||
                other.notifyFamily == notifyFamily) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      petId,
      type,
      title,
      description,
      scheduleRule,
      payload,
      nextTriggerAt,
      lastTriggeredAt,
      escalationCount,
      maxEscalations,
      isEnabled,
      notifyFamily,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      __$$ReminderImplCopyWithImpl<_$ReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderImplToJson(
      this,
    );
  }
}

abstract class _Reminder implements Reminder {
  const factory _Reminder(
      {required final int id,
      required final int userId,
      final int? petId,
      required final String type,
      required final String title,
      final String? description,
      required final String scheduleRule,
      final String? payload,
      required final DateTime nextTriggerAt,
      final DateTime? lastTriggeredAt,
      final int escalationCount,
      final int maxEscalations,
      final bool isEnabled,
      final bool notifyFamily,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$ReminderImpl;

  factory _Reminder.fromJson(Map<String, dynamic> json) =
      _$ReminderImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int? get petId;
  @override
  String get type; // vaccination, medication, appointment, weight, custom
  @override
  String get title;
  @override
  String? get description;
  @override
  String get scheduleRule; // cron expression or ISO8601 interval
  @override
  String? get payload; // JSON for type-specific data
  @override
  DateTime get nextTriggerAt;
  @override
  DateTime? get lastTriggeredAt;
  @override
  int get escalationCount;
  @override
  int get maxEscalations;
  @override
  bool get isEnabled;
  @override
  bool get notifyFamily;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
