// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccination_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccinationRecord _$VaccinationRecordFromJson(Map<String, dynamic> json) {
  return _VaccinationRecord.fromJson(json);
}

/// @nodoc
mixin _$VaccinationRecord {
  int get id => throw _privateConstructorUsedError;
  int get petId => throw _privateConstructorUsedError;
  int get vaccineId => throw _privateConstructorUsedError;
  String get vaccineName => throw _privateConstructorUsedError;
  DateTime get dateGiven => throw _privateConstructorUsedError;
  DateTime? get nextDueDate => throw _privateConstructorUsedError;
  String? get vetClinic => throw _privateConstructorUsedError;
  String? get batchNumber => throw _privateConstructorUsedError;
  String? get certificatePhotoUrl => throw _privateConstructorUsedError;
  String? get certificateLocalPath => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this VaccinationRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccinationRecordCopyWith<VaccinationRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccinationRecordCopyWith<$Res> {
  factory $VaccinationRecordCopyWith(
          VaccinationRecord value, $Res Function(VaccinationRecord) then) =
      _$VaccinationRecordCopyWithImpl<$Res, VaccinationRecord>;
  @useResult
  $Res call(
      {int id,
      int petId,
      int vaccineId,
      String vaccineName,
      DateTime dateGiven,
      DateTime? nextDueDate,
      String? vetClinic,
      String? batchNumber,
      String? certificatePhotoUrl,
      String? certificateLocalPath,
      String? notes,
      bool isCompleted,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$VaccinationRecordCopyWithImpl<$Res, $Val extends VaccinationRecord>
    implements $VaccinationRecordCopyWith<$Res> {
  _$VaccinationRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? vaccineId = null,
    Object? vaccineName = null,
    Object? dateGiven = null,
    Object? nextDueDate = freezed,
    Object? vetClinic = freezed,
    Object? batchNumber = freezed,
    Object? certificatePhotoUrl = freezed,
    Object? certificateLocalPath = freezed,
    Object? notes = freezed,
    Object? isCompleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      petId: null == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as int,
      vaccineName: null == vaccineName
          ? _value.vaccineName
          : vaccineName // ignore: cast_nullable_to_non_nullable
              as String,
      dateGiven: null == dateGiven
          ? _value.dateGiven
          : dateGiven // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextDueDate: freezed == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vetClinic: freezed == vetClinic
          ? _value.vetClinic
          : vetClinic // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      certificatePhotoUrl: freezed == certificatePhotoUrl
          ? _value.certificatePhotoUrl
          : certificatePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateLocalPath: freezed == certificateLocalPath
          ? _value.certificateLocalPath
          : certificateLocalPath // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
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
abstract class _$$VaccinationRecordImplCopyWith<$Res>
    implements $VaccinationRecordCopyWith<$Res> {
  factory _$$VaccinationRecordImplCopyWith(_$VaccinationRecordImpl value,
          $Res Function(_$VaccinationRecordImpl) then) =
      __$$VaccinationRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int petId,
      int vaccineId,
      String vaccineName,
      DateTime dateGiven,
      DateTime? nextDueDate,
      String? vetClinic,
      String? batchNumber,
      String? certificatePhotoUrl,
      String? certificateLocalPath,
      String? notes,
      bool isCompleted,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$VaccinationRecordImplCopyWithImpl<$Res>
    extends _$VaccinationRecordCopyWithImpl<$Res, _$VaccinationRecordImpl>
    implements _$$VaccinationRecordImplCopyWith<$Res> {
  __$$VaccinationRecordImplCopyWithImpl(_$VaccinationRecordImpl _value,
      $Res Function(_$VaccinationRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? vaccineId = null,
    Object? vaccineName = null,
    Object? dateGiven = null,
    Object? nextDueDate = freezed,
    Object? vetClinic = freezed,
    Object? batchNumber = freezed,
    Object? certificatePhotoUrl = freezed,
    Object? certificateLocalPath = freezed,
    Object? notes = freezed,
    Object? isCompleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$VaccinationRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      petId: null == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as int,
      vaccineName: null == vaccineName
          ? _value.vaccineName
          : vaccineName // ignore: cast_nullable_to_non_nullable
              as String,
      dateGiven: null == dateGiven
          ? _value.dateGiven
          : dateGiven // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextDueDate: freezed == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vetClinic: freezed == vetClinic
          ? _value.vetClinic
          : vetClinic // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      certificatePhotoUrl: freezed == certificatePhotoUrl
          ? _value.certificatePhotoUrl
          : certificatePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateLocalPath: freezed == certificateLocalPath
          ? _value.certificateLocalPath
          : certificateLocalPath // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
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
class _$VaccinationRecordImpl implements _VaccinationRecord {
  const _$VaccinationRecordImpl(
      {required this.id,
      required this.petId,
      required this.vaccineId,
      required this.vaccineName,
      required this.dateGiven,
      this.nextDueDate,
      this.vetClinic,
      this.batchNumber,
      this.certificatePhotoUrl,
      this.certificateLocalPath,
      this.notes,
      this.isCompleted = true,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  factory _$VaccinationRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccinationRecordImplFromJson(json);

  @override
  final int id;
  @override
  final int petId;
  @override
  final int vaccineId;
  @override
  final String vaccineName;
  @override
  final DateTime dateGiven;
  @override
  final DateTime? nextDueDate;
  @override
  final String? vetClinic;
  @override
  final String? batchNumber;
  @override
  final String? certificatePhotoUrl;
  @override
  final String? certificateLocalPath;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'VaccinationRecord(id: $id, petId: $petId, vaccineId: $vaccineId, vaccineName: $vaccineName, dateGiven: $dateGiven, nextDueDate: $nextDueDate, vetClinic: $vetClinic, batchNumber: $batchNumber, certificatePhotoUrl: $certificatePhotoUrl, certificateLocalPath: $certificateLocalPath, notes: $notes, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccinationRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.vaccineId, vaccineId) ||
                other.vaccineId == vaccineId) &&
            (identical(other.vaccineName, vaccineName) ||
                other.vaccineName == vaccineName) &&
            (identical(other.dateGiven, dateGiven) ||
                other.dateGiven == dateGiven) &&
            (identical(other.nextDueDate, nextDueDate) ||
                other.nextDueDate == nextDueDate) &&
            (identical(other.vetClinic, vetClinic) ||
                other.vetClinic == vetClinic) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.certificatePhotoUrl, certificatePhotoUrl) ||
                other.certificatePhotoUrl == certificatePhotoUrl) &&
            (identical(other.certificateLocalPath, certificateLocalPath) ||
                other.certificateLocalPath == certificateLocalPath) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
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
      petId,
      vaccineId,
      vaccineName,
      dateGiven,
      nextDueDate,
      vetClinic,
      batchNumber,
      certificatePhotoUrl,
      certificateLocalPath,
      notes,
      isCompleted,
      createdAt,
      updatedAt,
      deletedAt);

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccinationRecordImplCopyWith<_$VaccinationRecordImpl> get copyWith =>
      __$$VaccinationRecordImplCopyWithImpl<_$VaccinationRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccinationRecordImplToJson(
      this,
    );
  }
}

abstract class _VaccinationRecord implements VaccinationRecord {
  const factory _VaccinationRecord(
      {required final int id,
      required final int petId,
      required final int vaccineId,
      required final String vaccineName,
      required final DateTime dateGiven,
      final DateTime? nextDueDate,
      final String? vetClinic,
      final String? batchNumber,
      final String? certificatePhotoUrl,
      final String? certificateLocalPath,
      final String? notes,
      final bool isCompleted,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$VaccinationRecordImpl;

  factory _VaccinationRecord.fromJson(Map<String, dynamic> json) =
      _$VaccinationRecordImpl.fromJson;

  @override
  int get id;
  @override
  int get petId;
  @override
  int get vaccineId;
  @override
  String get vaccineName;
  @override
  DateTime get dateGiven;
  @override
  DateTime? get nextDueDate;
  @override
  String? get vetClinic;
  @override
  String? get batchNumber;
  @override
  String? get certificatePhotoUrl;
  @override
  String? get certificateLocalPath;
  @override
  String? get notes;
  @override
  bool get isCompleted;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccinationRecordImplCopyWith<_$VaccinationRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
