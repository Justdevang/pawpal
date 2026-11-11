// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vaccine _$VaccineFromJson(Map<String, dynamic> json) {
  return _Vaccine.fromJson(json);
}

/// @nodoc
mixin _$Vaccine {
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

  /// Serializes this Vaccine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vaccine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineCopyWith<Vaccine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineCopyWith<$Res> {
  factory $VaccineCopyWith(Vaccine value, $Res Function(Vaccine) then) =
      _$VaccineCopyWithImpl<$Res, Vaccine>;
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
class _$VaccineCopyWithImpl<$Res, $Val extends Vaccine>
    implements $VaccineCopyWith<$Res> {
  _$VaccineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vaccine
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
abstract class _$$VaccineImplCopyWith<$Res> implements $VaccineCopyWith<$Res> {
  factory _$$VaccineImplCopyWith(
          _$VaccineImpl value, $Res Function(_$VaccineImpl) then) =
      __$$VaccineImplCopyWithImpl<$Res>;
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
class __$$VaccineImplCopyWithImpl<$Res>
    extends _$VaccineCopyWithImpl<$Res, _$VaccineImpl>
    implements _$$VaccineImplCopyWith<$Res> {
  __$$VaccineImplCopyWithImpl(
      _$VaccineImpl _value, $Res Function(_$VaccineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vaccine
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
    return _then(_$VaccineImpl(
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
class _$VaccineImpl implements _Vaccine {
  const _$VaccineImpl(
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
      required this.updatedAt});

  factory _$VaccineImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineImplFromJson(json);

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
    return 'Vaccine(id: $id, name: $name, species: $species, description: $description, initialDoseWeeks: $initialDoseWeeks, boosterIntervalWeeks: $boosterIntervalWeeks, boosterCount: $boosterCount, region: $region, isCore: $isCore, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineImpl &&
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

  /// Create a copy of Vaccine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineImplCopyWith<_$VaccineImpl> get copyWith =>
      __$$VaccineImplCopyWithImpl<_$VaccineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineImplToJson(
      this,
    );
  }
}

abstract class _Vaccine implements Vaccine {
  const factory _Vaccine(
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
      required final DateTime updatedAt}) = _$VaccineImpl;

  factory _Vaccine.fromJson(Map<String, dynamic> json) = _$VaccineImpl.fromJson;

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

  /// Create a copy of Vaccine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineImplCopyWith<_$VaccineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
