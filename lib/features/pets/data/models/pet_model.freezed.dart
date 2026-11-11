// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return _PetModel.fromJson(json);
}

/// @nodoc
mixin _$PetModel {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get breed => throw _privateConstructorUsedError;
  String? get sex => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  String? get approximateAge => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String get weightUnit => throw _privateConstructorUsedError;
  String? get microchipNumber => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get localPhotoPath => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this PetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetModelCopyWith<PetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetModelCopyWith<$Res> {
  factory $PetModelCopyWith(PetModel value, $Res Function(PetModel) then) =
      _$PetModelCopyWithImpl<$Res, PetModel>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String name,
      String species,
      DateTime createdAt,
      DateTime updatedAt,
      String? breed,
      String? sex,
      DateTime? birthDate,
      String? approximateAge,
      double? weight,
      String weightUnit,
      String? microchipNumber,
      String? photoUrl,
      String? localPhotoPath,
      String? notes,
      bool isArchived,
      DateTime? deletedAt});
}

/// @nodoc
class _$PetModelCopyWithImpl<$Res, $Val extends PetModel>
    implements $PetModelCopyWith<$Res> {
  _$PetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? species = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? breed = freezed,
    Object? sex = freezed,
    Object? birthDate = freezed,
    Object? approximateAge = freezed,
    Object? weight = freezed,
    Object? weightUnit = null,
    Object? microchipNumber = freezed,
    Object? photoUrl = freezed,
    Object? localPhotoPath = freezed,
    Object? notes = freezed,
    Object? isArchived = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approximateAge: freezed == approximateAge
          ? _value.approximateAge
          : approximateAge // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightUnit: null == weightUnit
          ? _value.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as String,
      microchipNumber: freezed == microchipNumber
          ? _value.microchipNumber
          : microchipNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      localPhotoPath: freezed == localPhotoPath
          ? _value.localPhotoPath
          : localPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetModelImplCopyWith<$Res>
    implements $PetModelCopyWith<$Res> {
  factory _$$PetModelImplCopyWith(
          _$PetModelImpl value, $Res Function(_$PetModelImpl) then) =
      __$$PetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String name,
      String species,
      DateTime createdAt,
      DateTime updatedAt,
      String? breed,
      String? sex,
      DateTime? birthDate,
      String? approximateAge,
      double? weight,
      String weightUnit,
      String? microchipNumber,
      String? photoUrl,
      String? localPhotoPath,
      String? notes,
      bool isArchived,
      DateTime? deletedAt});
}

/// @nodoc
class __$$PetModelImplCopyWithImpl<$Res>
    extends _$PetModelCopyWithImpl<$Res, _$PetModelImpl>
    implements _$$PetModelImplCopyWith<$Res> {
  __$$PetModelImplCopyWithImpl(
      _$PetModelImpl _value, $Res Function(_$PetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? species = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? breed = freezed,
    Object? sex = freezed,
    Object? birthDate = freezed,
    Object? approximateAge = freezed,
    Object? weight = freezed,
    Object? weightUnit = null,
    Object? microchipNumber = freezed,
    Object? photoUrl = freezed,
    Object? localPhotoPath = freezed,
    Object? notes = freezed,
    Object? isArchived = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$PetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approximateAge: freezed == approximateAge
          ? _value.approximateAge
          : approximateAge // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightUnit: null == weightUnit
          ? _value.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as String,
      microchipNumber: freezed == microchipNumber
          ? _value.microchipNumber
          : microchipNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      localPhotoPath: freezed == localPhotoPath
          ? _value.localPhotoPath
          : localPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
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
class _$PetModelImpl extends _PetModel {
  const _$PetModelImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.species,
      required this.createdAt,
      required this.updatedAt,
      this.breed,
      this.sex,
      this.birthDate,
      this.approximateAge,
      this.weight,
      this.weightUnit = 'kg',
      this.microchipNumber,
      this.photoUrl,
      this.localPhotoPath,
      this.notes,
      this.isArchived = false,
      this.deletedAt})
      : super._();

  factory _$PetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetModelImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String name;
  @override
  final String species;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? breed;
  @override
  final String? sex;
  @override
  final DateTime? birthDate;
  @override
  final String? approximateAge;
  @override
  final double? weight;
  @override
  @JsonKey()
  final String weightUnit;
  @override
  final String? microchipNumber;
  @override
  final String? photoUrl;
  @override
  final String? localPhotoPath;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'PetModel(id: $id, userId: $userId, name: $name, species: $species, createdAt: $createdAt, updatedAt: $updatedAt, breed: $breed, sex: $sex, birthDate: $birthDate, approximateAge: $approximateAge, weight: $weight, weightUnit: $weightUnit, microchipNumber: $microchipNumber, photoUrl: $photoUrl, localPhotoPath: $localPhotoPath, notes: $notes, isArchived: $isArchived, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.approximateAge, approximateAge) ||
                other.approximateAge == approximateAge) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.weightUnit, weightUnit) ||
                other.weightUnit == weightUnit) &&
            (identical(other.microchipNumber, microchipNumber) ||
                other.microchipNumber == microchipNumber) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.localPhotoPath, localPhotoPath) ||
                other.localPhotoPath == localPhotoPath) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      species,
      createdAt,
      updatedAt,
      breed,
      sex,
      birthDate,
      approximateAge,
      weight,
      weightUnit,
      microchipNumber,
      photoUrl,
      localPhotoPath,
      notes,
      isArchived,
      deletedAt);

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      __$$PetModelImplCopyWithImpl<_$PetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetModelImplToJson(
      this,
    );
  }
}

abstract class _PetModel extends PetModel {
  const factory _PetModel(
      {required final int id,
      required final int userId,
      required final String name,
      required final String species,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? breed,
      final String? sex,
      final DateTime? birthDate,
      final String? approximateAge,
      final double? weight,
      final String weightUnit,
      final String? microchipNumber,
      final String? photoUrl,
      final String? localPhotoPath,
      final String? notes,
      final bool isArchived,
      final DateTime? deletedAt}) = _$PetModelImpl;
  const _PetModel._() : super._();

  factory _PetModel.fromJson(Map<String, dynamic> json) =
      _$PetModelImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get name;
  @override
  String get species;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get breed;
  @override
  String? get sex;
  @override
  DateTime? get birthDate;
  @override
  String? get approximateAge;
  @override
  double? get weight;
  @override
  String get weightUnit;
  @override
  String? get microchipNumber;
  @override
  String? get photoUrl;
  @override
  String? get localPhotoPath;
  @override
  String? get notes;
  @override
  bool get isArchived;
  @override
  DateTime? get deletedAt;

  /// Create a copy of PetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
