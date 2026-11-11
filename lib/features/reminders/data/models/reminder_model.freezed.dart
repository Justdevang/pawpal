// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) {
  return _ReminderModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderModel {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get scheduleRule => throw _privateConstructorUsedError;
  DateTime get nextTriggerAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get petId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get payload => throw _privateConstructorUsedError;
  DateTime? get lastTriggeredAt => throw _privateConstructorUsedError;
  int get escalationCount => throw _privateConstructorUsedError;
  int get maxEscalations => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  bool get notifyFamily => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this ReminderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderModelCopyWith<ReminderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderModelCopyWith<$Res> {
  factory $ReminderModelCopyWith(
          ReminderModel value, $Res Function(ReminderModel) then) =
      _$ReminderModelCopyWithImpl<$Res, ReminderModel>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String type,
      String title,
      String scheduleRule,
      DateTime nextTriggerAt,
      DateTime createdAt,
      DateTime updatedAt,
      int? petId,
      String? description,
      String? payload,
      DateTime? lastTriggeredAt,
      int escalationCount,
      int maxEscalations,
      bool isEnabled,
      bool notifyFamily,
      DateTime? deletedAt});
}

/// @nodoc
class _$ReminderModelCopyWithImpl<$Res, $Val extends ReminderModel>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? scheduleRule = null,
    Object? nextTriggerAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? petId = freezed,
    Object? description = freezed,
    Object? payload = freezed,
    Object? lastTriggeredAt = freezed,
    Object? escalationCount = null,
    Object? maxEscalations = null,
    Object? isEnabled = null,
    Object? notifyFamily = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleRule: null == scheduleRule
          ? _value.scheduleRule
          : scheduleRule // ignore: cast_nullable_to_non_nullable
              as String,
      nextTriggerAt: null == nextTriggerAt
          ? _value.nextTriggerAt
          : nextTriggerAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
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
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderModelImplCopyWith<$Res>
    implements $ReminderModelCopyWith<$Res> {
  factory _$$ReminderModelImplCopyWith(
          _$ReminderModelImpl value, $Res Function(_$ReminderModelImpl) then) =
      __$$ReminderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String type,
      String title,
      String scheduleRule,
      DateTime nextTriggerAt,
      DateTime createdAt,
      DateTime updatedAt,
      int? petId,
      String? description,
      String? payload,
      DateTime? lastTriggeredAt,
      int escalationCount,
      int maxEscalations,
      bool isEnabled,
      bool notifyFamily,
      DateTime? deletedAt});
}

/// @nodoc
class __$$ReminderModelImplCopyWithImpl<$Res>
    extends _$ReminderModelCopyWithImpl<$Res, _$ReminderModelImpl>
    implements _$$ReminderModelImplCopyWith<$Res> {
  __$$ReminderModelImplCopyWithImpl(
      _$ReminderModelImpl _value, $Res Function(_$ReminderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? scheduleRule = null,
    Object? nextTriggerAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? petId = freezed,
    Object? description = freezed,
    Object? payload = freezed,
    Object? lastTriggeredAt = freezed,
    Object? escalationCount = null,
    Object? maxEscalations = null,
    Object? isEnabled = null,
    Object? notifyFamily = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$ReminderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleRule: null == scheduleRule
          ? _value.scheduleRule
          : scheduleRule // ignore: cast_nullable_to_non_nullable
              as String,
      nextTriggerAt: null == nextTriggerAt
          ? _value.nextTriggerAt
          : nextTriggerAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
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
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderModelImpl extends _ReminderModel {
  const _$ReminderModelImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.title,
      required this.scheduleRule,
      required this.nextTriggerAt,
      required this.createdAt,
      required this.updatedAt,
      this.petId,
      this.description,
      this.payload,
      this.lastTriggeredAt,
      this.escalationCount = 0,
      this.maxEscalations = 3,
      this.isEnabled = true,
      this.notifyFamily = false,
      this.deletedAt})
      : super._();

  factory _$ReminderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderModelImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String type;
  @override
  final String title;
  @override
  final String scheduleRule;
  @override
  final DateTime nextTriggerAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int? petId;
  @override
  final String? description;
  @override
  final String? payload;
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
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'ReminderModel(id: $id, userId: $userId, type: $type, title: $title, scheduleRule: $scheduleRule, nextTriggerAt: $nextTriggerAt, createdAt: $createdAt, updatedAt: $updatedAt, petId: $petId, description: $description, payload: $payload, lastTriggeredAt: $lastTriggeredAt, escalationCount: $escalationCount, maxEscalations: $maxEscalations, isEnabled: $isEnabled, notifyFamily: $notifyFamily, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.scheduleRule, scheduleRule) ||
                other.scheduleRule == scheduleRule) &&
            (identical(other.nextTriggerAt, nextTriggerAt) ||
                other.nextTriggerAt == nextTriggerAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.payload, payload) || other.payload == payload) &&
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
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      title,
      scheduleRule,
      nextTriggerAt,
      createdAt,
      updatedAt,
      petId,
      description,
      payload,
      lastTriggeredAt,
      escalationCount,
      maxEscalations,
      isEnabled,
      notifyFamily,
      deletedAt);

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      __$$ReminderModelImplCopyWithImpl<_$ReminderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderModelImplToJson(
      this,
    );
  }
}

abstract class _ReminderModel extends ReminderModel {
  const factory _ReminderModel(
      {required final int id,
      required final int userId,
      required final String type,
      required final String title,
      required final String scheduleRule,
      required final DateTime nextTriggerAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int? petId,
      final String? description,
      final String? payload,
      final DateTime? lastTriggeredAt,
      final int escalationCount,
      final int maxEscalations,
      final bool isEnabled,
      final bool notifyFamily,
      final DateTime? deletedAt}) = _$ReminderModelImpl;
  const _ReminderModel._() : super._();

  factory _ReminderModel.fromJson(Map<String, dynamic> json) =
      _$ReminderModelImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get type;
  @override
  String get title;
  @override
  String get scheduleRule;
  @override
  DateTime get nextTriggerAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int? get petId;
  @override
  String? get description;
  @override
  String? get payload;
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
  DateTime? get deletedAt;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
