// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicationModel _$MedicationModelFromJson(Map<String, dynamic> json) {
  return _MedicationModel.fromJson(json);
}

/// @nodoc
mixin _$MedicationModel {
  int get id => throw _privateConstructorUsedError;
  int get petId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get form => throw _privateConstructorUsedError;
  String get frequencyType => throw _privateConstructorUsedError;
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

  /// Serializes this MedicationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationModelCopyWith<MedicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationModelCopyWith<$Res> {
  factory $MedicationModelCopyWith(
          MedicationModel value, $Res Function(MedicationModel) then) =
      _$MedicationModelCopyWithImpl<$Res, MedicationModel>;
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
class _$MedicationModelCopyWithImpl<$Res, $Val extends MedicationModel>
    implements $MedicationModelCopyWith<$Res> {
  _$MedicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationModel
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
abstract class _$$MedicationModelImplCopyWith<$Res>
    implements $MedicationModelCopyWith<$Res> {
  factory _$$MedicationModelImplCopyWith(_$MedicationModelImpl value,
          $Res Function(_$MedicationModelImpl) then) =
      __$$MedicationModelImplCopyWithImpl<$Res>;
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
class __$$MedicationModelImplCopyWithImpl<$Res>
    extends _$MedicationModelCopyWithImpl<$Res, _$MedicationModelImpl>
    implements _$$MedicationModelImplCopyWith<$Res> {
  __$$MedicationModelImplCopyWithImpl(
      _$MedicationModelImpl _value, $Res Function(_$MedicationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationModel
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
    return _then(_$MedicationModelImpl(
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
class _$MedicationModelImpl extends _MedicationModel {
  const _$MedicationModelImpl(
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
      : _specificWeekdays = specificWeekdays,
        super._();

  factory _$MedicationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationModelImplFromJson(json);

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
    return 'MedicationModel(id: $id, petId: $petId, name: $name, dosage: $dosage, form: $form, frequencyType: $frequencyType, timesPerDay: $timesPerDay, everyNHours: $everyNHours, specificWeekdays: $specificWeekdays, customCron: $customCron, startDate: $startDate, endDate: $endDate, withFood: $withFood, instructions: $instructions, remainingDoses: $remainingDoses, refillThreshold: $refillThreshold, vetClinic: $vetClinic, prescribingVet: $prescribingVet, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationModelImpl &&
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

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationModelImplCopyWith<_$MedicationModelImpl> get copyWith =>
      __$$MedicationModelImplCopyWithImpl<_$MedicationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationModelImplToJson(
      this,
    );
  }
}

abstract class _MedicationModel extends MedicationModel {
  const factory _MedicationModel(
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
      final DateTime? deletedAt}) = _$MedicationModelImpl;
  const _MedicationModel._() : super._();

  factory _MedicationModel.fromJson(Map<String, dynamic> json) =
      _$MedicationModelImpl.fromJson;

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
  String get frequencyType;
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

  /// Create a copy of MedicationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationModelImplCopyWith<_$MedicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoseScheduleModel _$DoseScheduleModelFromJson(Map<String, dynamic> json) {
  return _DoseScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$DoseScheduleModel {
  int get id => throw _privateConstructorUsedError;
  int get medicationId => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  bool get isTaken => throw _privateConstructorUsedError;
  bool get isSkipped => throw _privateConstructorUsedError;
  DateTime? get takenAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DoseScheduleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseScheduleModelCopyWith<DoseScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseScheduleModelCopyWith<$Res> {
  factory $DoseScheduleModelCopyWith(
          DoseScheduleModel value, $Res Function(DoseScheduleModel) then) =
      _$DoseScheduleModelCopyWithImpl<$Res, DoseScheduleModel>;
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
class _$DoseScheduleModelCopyWithImpl<$Res, $Val extends DoseScheduleModel>
    implements $DoseScheduleModelCopyWith<$Res> {
  _$DoseScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseScheduleModel
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
abstract class _$$DoseScheduleModelImplCopyWith<$Res>
    implements $DoseScheduleModelCopyWith<$Res> {
  factory _$$DoseScheduleModelImplCopyWith(_$DoseScheduleModelImpl value,
          $Res Function(_$DoseScheduleModelImpl) then) =
      __$$DoseScheduleModelImplCopyWithImpl<$Res>;
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
class __$$DoseScheduleModelImplCopyWithImpl<$Res>
    extends _$DoseScheduleModelCopyWithImpl<$Res, _$DoseScheduleModelImpl>
    implements _$$DoseScheduleModelImplCopyWith<$Res> {
  __$$DoseScheduleModelImplCopyWithImpl(_$DoseScheduleModelImpl _value,
      $Res Function(_$DoseScheduleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoseScheduleModel
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
    return _then(_$DoseScheduleModelImpl(
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
class _$DoseScheduleModelImpl extends _DoseScheduleModel {
  const _$DoseScheduleModelImpl(
      {required this.id,
      required this.medicationId,
      required this.scheduledTime,
      this.isTaken = false,
      this.isSkipped = false,
      this.takenAt,
      this.notes,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$DoseScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseScheduleModelImplFromJson(json);

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
    return 'DoseScheduleModel(id: $id, medicationId: $medicationId, scheduledTime: $scheduledTime, isTaken: $isTaken, isSkipped: $isSkipped, takenAt: $takenAt, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseScheduleModelImpl &&
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

  /// Create a copy of DoseScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseScheduleModelImplCopyWith<_$DoseScheduleModelImpl> get copyWith =>
      __$$DoseScheduleModelImplCopyWithImpl<_$DoseScheduleModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _DoseScheduleModel extends DoseScheduleModel {
  const factory _DoseScheduleModel(
      {required final int id,
      required final int medicationId,
      required final DateTime scheduledTime,
      final bool isTaken,
      final bool isSkipped,
      final DateTime? takenAt,
      final String? notes,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DoseScheduleModelImpl;
  const _DoseScheduleModel._() : super._();

  factory _DoseScheduleModel.fromJson(Map<String, dynamic> json) =
      _$DoseScheduleModelImpl.fromJson;

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

  /// Create a copy of DoseScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseScheduleModelImplCopyWith<_$DoseScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoseLogModel _$DoseLogModelFromJson(Map<String, dynamic> json) {
  return _DoseLogModel.fromJson(json);
}

/// @nodoc
mixin _$DoseLogModel {
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

  /// Serializes this DoseLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseLogModelCopyWith<DoseLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseLogModelCopyWith<$Res> {
  factory $DoseLogModelCopyWith(
          DoseLogModel value, $Res Function(DoseLogModel) then) =
      _$DoseLogModelCopyWithImpl<$Res, DoseLogModel>;
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
class _$DoseLogModelCopyWithImpl<$Res, $Val extends DoseLogModel>
    implements $DoseLogModelCopyWith<$Res> {
  _$DoseLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseLogModel
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
abstract class _$$DoseLogModelImplCopyWith<$Res>
    implements $DoseLogModelCopyWith<$Res> {
  factory _$$DoseLogModelImplCopyWith(
          _$DoseLogModelImpl value, $Res Function(_$DoseLogModelImpl) then) =
      __$$DoseLogModelImplCopyWithImpl<$Res>;
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
class __$$DoseLogModelImplCopyWithImpl<$Res>
    extends _$DoseLogModelCopyWithImpl<$Res, _$DoseLogModelImpl>
    implements _$$DoseLogModelImplCopyWith<$Res> {
  __$$DoseLogModelImplCopyWithImpl(
      _$DoseLogModelImpl _value, $Res Function(_$DoseLogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoseLogModel
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
    return _then(_$DoseLogModelImpl(
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
class _$DoseLogModelImpl extends _DoseLogModel {
  const _$DoseLogModelImpl(
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
      required this.updatedAt})
      : super._();

  factory _$DoseLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseLogModelImplFromJson(json);

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
    return 'DoseLogModel(id: $id, medicationId: $medicationId, doseScheduleId: $doseScheduleId, scheduledTime: $scheduledTime, actualTime: $actualTime, wasTaken: $wasTaken, wasSkipped: $wasSkipped, notes: $notes, sideEffects: $sideEffects, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseLogModelImpl &&
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

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseLogModelImplCopyWith<_$DoseLogModelImpl> get copyWith =>
      __$$DoseLogModelImplCopyWithImpl<_$DoseLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseLogModelImplToJson(
      this,
    );
  }
}

abstract class _DoseLogModel extends DoseLogModel {
  const factory _DoseLogModel(
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
      required final DateTime updatedAt}) = _$DoseLogModelImpl;
  const _DoseLogModel._() : super._();

  factory _DoseLogModel.fromJson(Map<String, dynamic> json) =
      _$DoseLogModelImpl.fromJson;

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

  /// Create a copy of DoseLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseLogModelImplCopyWith<_$DoseLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
