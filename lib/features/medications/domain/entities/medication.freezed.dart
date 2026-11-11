// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Medication _$MedicationFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
mixin _$Medication {
  int get id => throw _privateConstructorUsedError;
  int get petId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get form => throw _privateConstructorUsedError;
  String get frequencyType =>
      throw _privateConstructorUsedError; // once, daily, times_per_day, every_n_hours, specific_weekdays, custom
  int? get timesPerDay => throw _privateConstructorUsedError;
  int? get everyNHours => throw _privateConstructorUsedError;
  List<int>? get specificWeekdays => throw _privateConstructorUsedError;
  String? get customCron => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get withFood => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  int? get remainingDoses => throw _privateConstructorUsedError;
  int? get refillThreshold => throw _privateConstructorUsedError;
  String? get vetClinic => throw _privateConstructorUsedError;
  String? get prescribingVet => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Medication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationCopyWith<Medication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCopyWith<$Res> {
  factory $MedicationCopyWith(
          Medication value, $Res Function(Medication) then) =
      _$MedicationCopyWithImpl<$Res, Medication>;
  @useResult
  $Res call(
      {int id,
      int petId,
      String name,
      String dosage,
      String form,
      String frequencyType,
      int? timesPerDay,
      int? everyNHours,
      List<int>? specificWeekdays,
      String? customCron,
      DateTime startDate,
      DateTime? endDate,
      bool withFood,
      String? instructions,
      int? remainingDoses,
      int? refillThreshold,
      String? vetClinic,
      String? prescribingVet,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$MedicationCopyWithImpl<$Res, $Val extends Medication>
    implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? name = null,
    Object? dosage = null,
    Object? form = null,
    Object? frequencyType = null,
    Object? timesPerDay = freezed,
    Object? everyNHours = freezed,
    Object? specificWeekdays = freezed,
    Object? customCron = freezed,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? withFood = null,
    Object? instructions = freezed,
    Object? remainingDoses = freezed,
    Object? refillThreshold = freezed,
    Object? vetClinic = freezed,
    Object? prescribingVet = freezed,
    Object? isActive = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyType: null == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String,
      timesPerDay: freezed == timesPerDay
          ? _value.timesPerDay
          : timesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      everyNHours: freezed == everyNHours
          ? _value.everyNHours
          : everyNHours // ignore: cast_nullable_to_non_nullable
              as int?,
      specificWeekdays: freezed == specificWeekdays
          ? _value.specificWeekdays
          : specificWeekdays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      customCron: freezed == customCron
          ? _value.customCron
          : customCron // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      withFood: null == withFood
          ? _value.withFood
          : withFood // ignore: cast_nullable_to_non_nullable
              as bool,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingDoses: freezed == remainingDoses
          ? _value.remainingDoses
          : remainingDoses // ignore: cast_nullable_to_non_nullable
              as int?,
      refillThreshold: freezed == refillThreshold
          ? _value.refillThreshold
          : refillThreshold // ignore: cast_nullable_to_non_nullable
              as int?,
      vetClinic: freezed == vetClinic
          ? _value.vetClinic
          : vetClinic // ignore: cast_nullable_to_non_nullable
              as String?,
      prescribingVet: freezed == prescribingVet
          ? _value.prescribingVet
          : prescribingVet // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MedicationImplCopyWith<$Res>
    implements $MedicationCopyWith<$Res> {
  factory _$$MedicationImplCopyWith(
          _$MedicationImpl value, $Res Function(_$MedicationImpl) then) =
      __$$MedicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int petId,
      String name,
      String dosage,
      String form,
      String frequencyType,
      int? timesPerDay,
      int? everyNHours,
      List<int>? specificWeekdays,
      String? customCron,
      DateTime startDate,
      DateTime? endDate,
      bool withFood,
      String? instructions,
      int? remainingDoses,
      int? refillThreshold,
      String? vetClinic,
      String? prescribingVet,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$MedicationImplCopyWithImpl<$Res>
    extends _$MedicationCopyWithImpl<$Res, _$MedicationImpl>
    implements _$$MedicationImplCopyWith<$Res> {
  __$$MedicationImplCopyWithImpl(
      _$MedicationImpl _value, $Res Function(_$MedicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? name = null,
    Object? dosage = null,
    Object? form = null,
    Object? frequencyType = null,
    Object? timesPerDay = freezed,
    Object? everyNHours = freezed,
    Object? specificWeekdays = freezed,
    Object? customCron = freezed,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? withFood = null,
    Object? instructions = freezed,
    Object? remainingDoses = freezed,
    Object? refillThreshold = freezed,
    Object? vetClinic = freezed,
    Object? prescribingVet = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$MedicationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      petId: null == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyType: null == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String,
      timesPerDay: freezed == timesPerDay
          ? _value.timesPerDay
          : timesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      everyNHours: freezed == everyNHours
          ? _value.everyNHours
          : everyNHours // ignore: cast_nullable_to_non_nullable
              as int?,
      specificWeekdays: freezed == specificWeekdays
          ? _value._specificWeekdays
          : specificWeekdays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      customCron: freezed == customCron
          ? _value.customCron
          : customCron // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      withFood: null == withFood
          ? _value.withFood
          : withFood // ignore: cast_nullable_to_non_nullable
              as bool,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingDoses: freezed == remainingDoses
          ? _value.remainingDoses
          : remainingDoses // ignore: cast_nullable_to_non_nullable
              as int?,
      refillThreshold: freezed == refillThreshold
          ? _value.refillThreshold
          : refillThreshold // ignore: cast_nullable_to_non_nullable
              as int?,
      vetClinic: freezed == vetClinic
          ? _value.vetClinic
          : vetClinic // ignore: cast_nullable_to_non_nullable
              as String?,
      prescribingVet: freezed == prescribingVet
          ? _value.prescribingVet
          : prescribingVet // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
class _$MedicationImpl implements _Medication {
  const _$MedicationImpl(
      {required this.id,
      required this.petId,
      required this.name,
      required this.dosage,
      required this.form,
      required this.frequencyType,
      this.timesPerDay,
      this.everyNHours,
      final List<int>? specificWeekdays,
      this.customCron,
      required this.startDate,
      this.endDate,
      this.withFood = false,
      this.instructions,
      this.remainingDoses,
      this.refillThreshold,
      this.vetClinic,
      this.prescribingVet,
      this.isActive = true,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _specificWeekdays = specificWeekdays;

  factory _$MedicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationImplFromJson(json);

  @override
  final int id;
  @override
  final int petId;
  @override
  final String name;
  @override
  final String dosage;
  @override
  final String form;
  @override
  final String frequencyType;
// once, daily, times_per_day, every_n_hours, specific_weekdays, custom
  @override
  final int? timesPerDay;
  @override
  final int? everyNHours;
  final List<int>? _specificWeekdays;
  @override
  List<int>? get specificWeekdays {
    final value = _specificWeekdays;
    if (value == null) return null;
    if (_specificWeekdays is EqualUnmodifiableListView)
      return _specificWeekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? customCron;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  @JsonKey()
  final bool withFood;
  @override
  final String? instructions;
  @override
  final int? remainingDoses;
  @override
  final int? refillThreshold;
  @override
  final String? vetClinic;
  @override
  final String? prescribingVet;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Medication(id: $id, petId: $petId, name: $name, dosage: $dosage, form: $form, frequencyType: $frequencyType, timesPerDay: $timesPerDay, everyNHours: $everyNHours, specificWeekdays: $specificWeekdays, customCron: $customCron, startDate: $startDate, endDate: $endDate, withFood: $withFood, instructions: $instructions, remainingDoses: $remainingDoses, refillThreshold: $refillThreshold, vetClinic: $vetClinic, prescribingVet: $prescribingVet, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.frequencyType, frequencyType) ||
                other.frequencyType == frequencyType) &&
            (identical(other.timesPerDay, timesPerDay) ||
                other.timesPerDay == timesPerDay) &&
            (identical(other.everyNHours, everyNHours) ||
                other.everyNHours == everyNHours) &&
            const DeepCollectionEquality()
                .equals(other._specificWeekdays, _specificWeekdays) &&
            (identical(other.customCron, customCron) ||
                other.customCron == customCron) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.withFood, withFood) ||
                other.withFood == withFood) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.remainingDoses, remainingDoses) ||
                other.remainingDoses == remainingDoses) &&
            (identical(other.refillThreshold, refillThreshold) ||
                other.refillThreshold == refillThreshold) &&
            (identical(other.vetClinic, vetClinic) ||
                other.vetClinic == vetClinic) &&
            (identical(other.prescribingVet, prescribingVet) ||
                other.prescribingVet == prescribingVet) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        petId,
        name,
        dosage,
        form,
        frequencyType,
        timesPerDay,
        everyNHours,
        const DeepCollectionEquality().hash(_specificWeekdays),
        customCron,
        startDate,
        endDate,
        withFood,
        instructions,
        remainingDoses,
        refillThreshold,
        vetClinic,
        prescribingVet,
        isActive,
        createdAt,
        updatedAt,
        deletedAt
      ]);

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      __$$MedicationImplCopyWithImpl<_$MedicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationImplToJson(
      this,
    );
  }
}

abstract class _Medication implements Medication {
  const factory _Medication(
      {required final int id,
      required final int petId,
      required final String name,
      required final String dosage,
      required final String form,
      required final String frequencyType,
      final int? timesPerDay,
      final int? everyNHours,
      final List<int>? specificWeekdays,
      final String? customCron,
      required final DateTime startDate,
      final DateTime? endDate,
      final bool withFood,
      final String? instructions,
      final int? remainingDoses,
      final int? refillThreshold,
      final String? vetClinic,
      final String? prescribingVet,
      final bool isActive,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$MedicationImpl;

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$MedicationImpl.fromJson;

  @override
  int get id;
  @override
  int get petId;
  @override
  String get name;
  @override
  String get dosage;
  @override
  String get form;
  @override
  String
      get frequencyType; // once, daily, times_per_day, every_n_hours, specific_weekdays, custom
  @override
  int? get timesPerDay;
  @override
  int? get everyNHours;
  @override
  List<int>? get specificWeekdays;
  @override
  String? get customCron;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  bool get withFood;
  @override
  String? get instructions;
  @override
  int? get remainingDoses;
  @override
  int? get refillThreshold;
  @override
  String? get vetClinic;
  @override
  String? get prescribingVet;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Medication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
