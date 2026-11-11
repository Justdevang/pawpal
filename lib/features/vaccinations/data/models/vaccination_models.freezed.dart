// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccination_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineModel _$VaccineModelFromJson(Map<String, dynamic> json) {
  return _VaccineModel.fromJson(json);
}

/// @nodoc
mixin _$VaccineModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get initialDoseWeeks => throw _privateConstructorUsedError;
  int? get boosterIntervalWeeks => throw _privateConstructorUsedError;
  int? get boosterCount => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  bool get isCore => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VaccineModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineModelCopyWith<VaccineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineModelCopyWith<$Res> {
  factory $VaccineModelCopyWith(
          VaccineModel value, $Res Function(VaccineModel) then) =
      _$VaccineModelCopyWithImpl<$Res, VaccineModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String species,
      String? description,
      int? initialDoseWeeks,
      int? boosterIntervalWeeks,
      int? boosterCount,
      String region,
      bool isCore,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$VaccineModelCopyWithImpl<$Res, $Val extends VaccineModel>
    implements $VaccineModelCopyWith<$Res> {
  _$VaccineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? species = null,
    Object? description = freezed,
    Object? initialDoseWeeks = freezed,
    Object? boosterIntervalWeeks = freezed,
    Object? boosterCount = freezed,
    Object? region = null,
    Object? isCore = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      initialDoseWeeks: freezed == initialDoseWeeks
          ? _value.initialDoseWeeks
          : initialDoseWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      boosterIntervalWeeks: freezed == boosterIntervalWeeks
          ? _value.boosterIntervalWeeks
          : boosterIntervalWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      boosterCount: freezed == boosterCount
          ? _value.boosterCount
          : boosterCount // ignore: cast_nullable_to_non_nullable
              as int?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      isCore: null == isCore
          ? _value.isCore
          : isCore // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$VaccineModelImplCopyWith<$Res>
    implements $VaccineModelCopyWith<$Res> {
  factory _$$VaccineModelImplCopyWith(
          _$VaccineModelImpl value, $Res Function(_$VaccineModelImpl) then) =
      __$$VaccineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String species,
      String? description,
      int? initialDoseWeeks,
      int? boosterIntervalWeeks,
      int? boosterCount,
      String region,
      bool isCore,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$VaccineModelImplCopyWithImpl<$Res>
    extends _$VaccineModelCopyWithImpl<$Res, _$VaccineModelImpl>
    implements _$$VaccineModelImplCopyWith<$Res> {
  __$$VaccineModelImplCopyWithImpl(
      _$VaccineModelImpl _value, $Res Function(_$VaccineModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? species = null,
    Object? description = freezed,
    Object? initialDoseWeeks = freezed,
    Object? boosterIntervalWeeks = freezed,
    Object? boosterCount = freezed,
    Object? region = null,
    Object? isCore = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$VaccineModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      initialDoseWeeks: freezed == initialDoseWeeks
          ? _value.initialDoseWeeks
          : initialDoseWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      boosterIntervalWeeks: freezed == boosterIntervalWeeks
          ? _value.boosterIntervalWeeks
          : boosterIntervalWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      boosterCount: freezed == boosterCount
          ? _value.boosterCount
          : boosterCount // ignore: cast_nullable_to_non_nullable
              as int?,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      isCore: null == isCore
          ? _value.isCore
          : isCore // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$VaccineModelImpl extends _VaccineModel {
  const _$VaccineModelImpl(
      {required this.id,
      required this.name,
      required this.species,
      this.description,
      this.initialDoseWeeks,
      this.boosterIntervalWeeks,
      this.boosterCount,
      this.region = 'global',
      this.isCore = false,
      this.notes,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$VaccineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String species;
  @override
  final String? description;
  @override
  final int? initialDoseWeeks;
  @override
  final int? boosterIntervalWeeks;
  @override
  final int? boosterCount;
  @override
  @JsonKey()
  final String region;
  @override
  @JsonKey()
  final bool isCore;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'VaccineModel(id: $id, name: $name, species: $species, description: $description, initialDoseWeeks: $initialDoseWeeks, boosterIntervalWeeks: $boosterIntervalWeeks, boosterCount: $boosterCount, region: $region, isCore: $isCore, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.initialDoseWeeks, initialDoseWeeks) ||
                other.initialDoseWeeks == initialDoseWeeks) &&
            (identical(other.boosterIntervalWeeks, boosterIntervalWeeks) ||
                other.boosterIntervalWeeks == boosterIntervalWeeks) &&
            (identical(other.boosterCount, boosterCount) ||
                other.boosterCount == boosterCount) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.isCore, isCore) || other.isCore == isCore) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
      name,
      species,
      description,
      initialDoseWeeks,
      boosterIntervalWeeks,
      boosterCount,
      region,
      isCore,
      notes,
      createdAt,
      updatedAt);

  /// Create a copy of VaccineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineModelImplCopyWith<_$VaccineModelImpl> get copyWith =>
      __$$VaccineModelImplCopyWithImpl<_$VaccineModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineModelImplToJson(
      this,
    );
  }
}

abstract class _VaccineModel extends VaccineModel {
  const factory _VaccineModel(
      {required final int id,
      required final String name,
      required final String species,
      final String? description,
      final int? initialDoseWeeks,
      final int? boosterIntervalWeeks,
      final int? boosterCount,
      final String region,
      final bool isCore,
      final String? notes,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$VaccineModelImpl;
  const _VaccineModel._() : super._();

  factory _VaccineModel.fromJson(Map<String, dynamic> json) =
      _$VaccineModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get species;
  @override
  String? get description;
  @override
  int? get initialDoseWeeks;
  @override
  int? get boosterIntervalWeeks;
  @override
  int? get boosterCount;
  @override
  String get region;
  @override
  bool get isCore;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of VaccineModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineModelImplCopyWith<_$VaccineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VaccinationRecordModel _$VaccinationRecordModelFromJson(
    Map<String, dynamic> json) {
  return _VaccinationRecordModel.fromJson(json);
}

/// @nodoc
mixin _$VaccinationRecordModel {
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

  /// Serializes this VaccinationRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccinationRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccinationRecordModelCopyWith<VaccinationRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccinationRecordModelCopyWith<$Res> {
  factory $VaccinationRecordModelCopyWith(VaccinationRecordModel value,
          $Res Function(VaccinationRecordModel) then) =
      _$VaccinationRecordModelCopyWithImpl<$Res, VaccinationRecordModel>;
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
class _$VaccinationRecordModelCopyWithImpl<$Res,
        $Val extends VaccinationRecordModel>
    implements $VaccinationRecordModelCopyWith<$Res> {
  _$VaccinationRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccinationRecordModel
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
abstract class _$$VaccinationRecordModelImplCopyWith<$Res>
    implements $VaccinationRecordModelCopyWith<$Res> {
  factory _$$VaccinationRecordModelImplCopyWith(
          _$VaccinationRecordModelImpl value,
          $Res Function(_$VaccinationRecordModelImpl) then) =
      __$$VaccinationRecordModelImplCopyWithImpl<$Res>;
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
class __$$VaccinationRecordModelImplCopyWithImpl<$Res>
    extends _$VaccinationRecordModelCopyWithImpl<$Res,
        _$VaccinationRecordModelImpl>
    implements _$$VaccinationRecordModelImplCopyWith<$Res> {
  __$$VaccinationRecordModelImplCopyWithImpl(
      _$VaccinationRecordModelImpl _value,
      $Res Function(_$VaccinationRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccinationRecordModel
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
    return _then(_$VaccinationRecordModelImpl(
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
class _$VaccinationRecordModelImpl extends _VaccinationRecordModel {
  const _$VaccinationRecordModelImpl(
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
      this.deletedAt})
      : super._();

  factory _$VaccinationRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccinationRecordModelImplFromJson(json);

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
    return 'VaccinationRecordModel(id: $id, petId: $petId, vaccineId: $vaccineId, vaccineName: $vaccineName, dateGiven: $dateGiven, nextDueDate: $nextDueDate, vetClinic: $vetClinic, batchNumber: $batchNumber, certificatePhotoUrl: $certificatePhotoUrl, certificateLocalPath: $certificateLocalPath, notes: $notes, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccinationRecordModelImpl &&
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

  /// Create a copy of VaccinationRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccinationRecordModelImplCopyWith<_$VaccinationRecordModelImpl>
      get copyWith => __$$VaccinationRecordModelImplCopyWithImpl<
          _$VaccinationRecordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccinationRecordModelImplToJson(
      this,
    );
  }
}

abstract class _VaccinationRecordModel extends VaccinationRecordModel {
  const factory _VaccinationRecordModel(
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
      final DateTime? deletedAt}) = _$VaccinationRecordModelImpl;
  const _VaccinationRecordModel._() : super._();

  factory _VaccinationRecordModel.fromJson(Map<String, dynamic> json) =
      _$VaccinationRecordModelImpl.fromJson;

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

  /// Create a copy of VaccinationRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccinationRecordModelImplCopyWith<_$VaccinationRecordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
