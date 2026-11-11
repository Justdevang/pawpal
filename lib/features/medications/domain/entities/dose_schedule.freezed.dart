// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dose_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoseSchedule _$DoseScheduleFromJson(Map<String, dynamic> json) {
  return _DoseSchedule.fromJson(json);
}

/// @nodoc
mixin _$DoseSchedule {
  int get id => throw _privateConstructorUsedError;
  int get medicationId => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  bool get isTaken => throw _privateConstructorUsedError;
  bool get isSkipped => throw _privateConstructorUsedError;
  DateTime? get takenAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DoseSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseScheduleCopyWith<DoseSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseScheduleCopyWith<$Res> {
  factory $DoseScheduleCopyWith(
          DoseSchedule value, $Res Function(DoseSchedule) then) =
      _$DoseScheduleCopyWithImpl<$Res, DoseSchedule>;
  @useResult
  $Res call(
      {int id,
      int medicationId,
      DateTime scheduledTime,
      bool isTaken,
      bool isSkipped,
      DateTime? takenAt,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$DoseScheduleCopyWithImpl<$Res, $Val extends DoseSchedule>
    implements $DoseScheduleCopyWith<$Res> {
  _$DoseScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? scheduledTime = null,
    Object? isTaken = null,
    Object? isSkipped = null,
    Object? takenAt = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      medicationId: null == medicationId
          ? _value.medicationId
          : medicationId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isTaken: null == isTaken
          ? _value.isTaken
          : isTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      isSkipped: null == isSkipped
          ? _value.isSkipped
          : isSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      takenAt: freezed == takenAt
          ? _value.takenAt
          : takenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoseScheduleImplCopyWith<$Res>
    implements $DoseScheduleCopyWith<$Res> {
  factory _$$DoseScheduleImplCopyWith(
          _$DoseScheduleImpl value, $Res Function(_$DoseScheduleImpl) then) =
      __$$DoseScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int medicationId,
      DateTime scheduledTime,
      bool isTaken,
      bool isSkipped,
      DateTime? takenAt,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$DoseScheduleImplCopyWithImpl<$Res>
    extends _$DoseScheduleCopyWithImpl<$Res, _$DoseScheduleImpl>
    implements _$$DoseScheduleImplCopyWith<$Res> {
  __$$DoseScheduleImplCopyWithImpl(
      _$DoseScheduleImpl _value, $Res Function(_$DoseScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoseSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? scheduledTime = null,
    Object? isTaken = null,
    Object? isSkipped = null,
    Object? takenAt = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DoseScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      medicationId: null == medicationId
          ? _value.medicationId
          : medicationId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isTaken: null == isTaken
          ? _value.isTaken
          : isTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      isSkipped: null == isSkipped
          ? _value.isSkipped
          : isSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      takenAt: freezed == takenAt
          ? _value.takenAt
          : takenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoseScheduleImpl implements _DoseSchedule {
  const _$DoseScheduleImpl(
      {required this.id,
      required this.medicationId,
      required this.scheduledTime,
      this.isTaken = false,
      this.isSkipped = false,
      this.takenAt,
      this.notes,
      required this.createdAt,
      required this.updatedAt});

  factory _$DoseScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseScheduleImplFromJson(json);

  @override
  final int id;
  @override
  final int medicationId;
  @override
  final DateTime scheduledTime;
  @override
  @JsonKey()
  final bool isTaken;
  @override
  @JsonKey()
  final bool isSkipped;
  @override
  final DateTime? takenAt;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DoseSchedule(id: $id, medicationId: $medicationId, scheduledTime: $scheduledTime, isTaken: $isTaken, isSkipped: $isSkipped, takenAt: $takenAt, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.medicationId, medicationId) ||
                other.medicationId == medicationId) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.isTaken, isTaken) || other.isTaken == isTaken) &&
            (identical(other.isSkipped, isSkipped) ||
                other.isSkipped == isSkipped) &&
            (identical(other.takenAt, takenAt) || other.takenAt == takenAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, medicationId, scheduledTime,
      isTaken, isSkipped, takenAt, notes, createdAt, updatedAt);

  /// Create a copy of DoseSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseScheduleImplCopyWith<_$DoseScheduleImpl> get copyWith =>
      __$$DoseScheduleImplCopyWithImpl<_$DoseScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseScheduleImplToJson(
      this,
    );
  }
}

abstract class _DoseSchedule implements DoseSchedule {
  const factory _DoseSchedule(
      {required final int id,
      required final int medicationId,
      required final DateTime scheduledTime,
      final bool isTaken,
      final bool isSkipped,
      final DateTime? takenAt,
      final String? notes,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DoseScheduleImpl;

  factory _DoseSchedule.fromJson(Map<String, dynamic> json) =
      _$DoseScheduleImpl.fromJson;

  @override
  int get id;
  @override
  int get medicationId;
  @override
  DateTime get scheduledTime;
  @override
  bool get isTaken;
  @override
  bool get isSkipped;
  @override
  DateTime? get takenAt;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of DoseSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseScheduleImplCopyWith<_$DoseScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
