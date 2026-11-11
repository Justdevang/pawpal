// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dose_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoseLog _$DoseLogFromJson(Map<String, dynamic> json) {
  return _DoseLog.fromJson(json);
}

/// @nodoc
mixin _$DoseLog {
  int get id => throw _privateConstructorUsedError;
  int get medicationId => throw _privateConstructorUsedError;
  int? get doseScheduleId => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  DateTime? get actualTime => throw _privateConstructorUsedError;
  bool get wasTaken => throw _privateConstructorUsedError;
  bool get wasSkipped => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get sideEffects => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DoseLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseLogCopyWith<DoseLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseLogCopyWith<$Res> {
  factory $DoseLogCopyWith(DoseLog value, $Res Function(DoseLog) then) =
      _$DoseLogCopyWithImpl<$Res, DoseLog>;
  @useResult
  $Res call(
      {int id,
      int medicationId,
      int? doseScheduleId,
      DateTime scheduledTime,
      DateTime? actualTime,
      bool wasTaken,
      bool wasSkipped,
      String? notes,
      String? sideEffects,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$DoseLogCopyWithImpl<$Res, $Val extends DoseLog>
    implements $DoseLogCopyWith<$Res> {
  _$DoseLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? doseScheduleId = freezed,
    Object? scheduledTime = null,
    Object? actualTime = freezed,
    Object? wasTaken = null,
    Object? wasSkipped = null,
    Object? notes = freezed,
    Object? sideEffects = freezed,
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
      doseScheduleId: freezed == doseScheduleId
          ? _value.doseScheduleId
          : doseScheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualTime: freezed == actualTime
          ? _value.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wasTaken: null == wasTaken
          ? _value.wasTaken
          : wasTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      wasSkipped: null == wasSkipped
          ? _value.wasSkipped
          : wasSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sideEffects: freezed == sideEffects
          ? _value.sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DoseLogImplCopyWith<$Res> implements $DoseLogCopyWith<$Res> {
  factory _$$DoseLogImplCopyWith(
          _$DoseLogImpl value, $Res Function(_$DoseLogImpl) then) =
      __$$DoseLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int medicationId,
      int? doseScheduleId,
      DateTime scheduledTime,
      DateTime? actualTime,
      bool wasTaken,
      bool wasSkipped,
      String? notes,
      String? sideEffects,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$DoseLogImplCopyWithImpl<$Res>
    extends _$DoseLogCopyWithImpl<$Res, _$DoseLogImpl>
    implements _$$DoseLogImplCopyWith<$Res> {
  __$$DoseLogImplCopyWithImpl(
      _$DoseLogImpl _value, $Res Function(_$DoseLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoseLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicationId = null,
    Object? doseScheduleId = freezed,
    Object? scheduledTime = null,
    Object? actualTime = freezed,
    Object? wasTaken = null,
    Object? wasSkipped = null,
    Object? notes = freezed,
    Object? sideEffects = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DoseLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      medicationId: null == medicationId
          ? _value.medicationId
          : medicationId // ignore: cast_nullable_to_non_nullable
              as int,
      doseScheduleId: freezed == doseScheduleId
          ? _value.doseScheduleId
          : doseScheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualTime: freezed == actualTime
          ? _value.actualTime
          : actualTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      wasTaken: null == wasTaken
          ? _value.wasTaken
          : wasTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      wasSkipped: null == wasSkipped
          ? _value.wasSkipped
          : wasSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sideEffects: freezed == sideEffects
          ? _value.sideEffects
          : sideEffects // ignore: cast_nullable_to_non_nullable
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
class _$DoseLogImpl implements _DoseLog {
  const _$DoseLogImpl(
      {required this.id,
      required this.medicationId,
      this.doseScheduleId,
      required this.scheduledTime,
      this.actualTime,
      this.wasTaken = false,
      this.wasSkipped = false,
      this.notes,
      this.sideEffects,
      required this.createdAt,
      required this.updatedAt});

  factory _$DoseLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseLogImplFromJson(json);

  @override
  final int id;
  @override
  final int medicationId;
  @override
  final int? doseScheduleId;
  @override
  final DateTime scheduledTime;
  @override
  final DateTime? actualTime;
  @override
  @JsonKey()
  final bool wasTaken;
  @override
  @JsonKey()
  final bool wasSkipped;
  @override
  final String? notes;
  @override
  final String? sideEffects;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DoseLog(id: $id, medicationId: $medicationId, doseScheduleId: $doseScheduleId, scheduledTime: $scheduledTime, actualTime: $actualTime, wasTaken: $wasTaken, wasSkipped: $wasSkipped, notes: $notes, sideEffects: $sideEffects, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.medicationId, medicationId) ||
                other.medicationId == medicationId) &&
            (identical(other.doseScheduleId, doseScheduleId) ||
                other.doseScheduleId == doseScheduleId) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.actualTime, actualTime) ||
                other.actualTime == actualTime) &&
            (identical(other.wasTaken, wasTaken) ||
                other.wasTaken == wasTaken) &&
            (identical(other.wasSkipped, wasSkipped) ||
                other.wasSkipped == wasSkipped) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.sideEffects, sideEffects) ||
                other.sideEffects == sideEffects) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      medicationId,
      doseScheduleId,
      scheduledTime,
      actualTime,
      wasTaken,
      wasSkipped,
      notes,
      sideEffects,
      createdAt,
      updatedAt);

  /// Create a copy of DoseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseLogImplCopyWith<_$DoseLogImpl> get copyWith =>
      __$$DoseLogImplCopyWithImpl<_$DoseLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseLogImplToJson(
      this,
    );
  }
}

abstract class _DoseLog implements DoseLog {
  const factory _DoseLog(
      {required final int id,
      required final int medicationId,
      final int? doseScheduleId,
      required final DateTime scheduledTime,
      final DateTime? actualTime,
      final bool wasTaken,
      final bool wasSkipped,
      final String? notes,
      final String? sideEffects,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DoseLogImpl;

  factory _DoseLog.fromJson(Map<String, dynamic> json) = _$DoseLogImpl.fromJson;

  @override
  int get id;
  @override
  int get medicationId;
  @override
  int? get doseScheduleId;
  @override
  DateTime get scheduledTime;
  @override
  DateTime? get actualTime;
  @override
  bool get wasTaken;
  @override
  bool get wasSkipped;
  @override
  String? get notes;
  @override
  String? get sideEffects;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of DoseLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseLogImplCopyWith<_$DoseLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
