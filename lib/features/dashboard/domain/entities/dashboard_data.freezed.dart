// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardDataEntity _$DashboardDataEntityFromJson(Map<String, dynamic> json) {
  return _DashboardDataEntity.fromJson(json);
}

/// @nodoc
mixin _$DashboardDataEntity {
  List<PetSummary> get pets => throw _privateConstructorUsedError;
  List<TaskSummary> get todaysTasks => throw _privateConstructorUsedError;
  List<TaskSummary> get overdueTasks => throw _privateConstructorUsedError;
  List<TaskSummary> get upcomingTasks => throw _privateConstructorUsedError;
  HealthSummary? get healthSummary => throw _privateConstructorUsedError;
  int get totalPets => throw _privateConstructorUsedError;
  int get activeMedications => throw _privateConstructorUsedError;
  int get upcomingVaccinations => throw _privateConstructorUsedError;
  int get overdueItems => throw _privateConstructorUsedError;

  /// Serializes this DashboardDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataEntityCopyWith<DashboardDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataEntityCopyWith<$Res> {
  factory $DashboardDataEntityCopyWith(
          DashboardDataEntity value, $Res Function(DashboardDataEntity) then) =
      _$DashboardDataEntityCopyWithImpl<$Res, DashboardDataEntity>;
  @useResult
  $Res call(
      {List<PetSummary> pets,
      List<TaskSummary> todaysTasks,
      List<TaskSummary> overdueTasks,
      List<TaskSummary> upcomingTasks,
      HealthSummary? healthSummary,
      int totalPets,
      int activeMedications,
      int upcomingVaccinations,
      int overdueItems});

  $HealthSummaryCopyWith<$Res>? get healthSummary;
}

/// @nodoc
class _$DashboardDataEntityCopyWithImpl<$Res, $Val extends DashboardDataEntity>
    implements $DashboardDataEntityCopyWith<$Res> {
  _$DashboardDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pets = null,
    Object? todaysTasks = null,
    Object? overdueTasks = null,
    Object? upcomingTasks = null,
    Object? healthSummary = freezed,
    Object? totalPets = null,
    Object? activeMedications = null,
    Object? upcomingVaccinations = null,
    Object? overdueItems = null,
  }) {
    return _then(_value.copyWith(
      pets: null == pets
          ? _value.pets
          : pets // ignore: cast_nullable_to_non_nullable
              as List<PetSummary>,
      todaysTasks: null == todaysTasks
          ? _value.todaysTasks
          : todaysTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskSummary>,
      overdueTasks: null == overdueTasks
          ? _value.overdueTasks
          : overdueTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskSummary>,
      upcomingTasks: null == upcomingTasks
          ? _value.upcomingTasks
          : upcomingTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskSummary>,
      healthSummary: freezed == healthSummary
          ? _value.healthSummary
          : healthSummary // ignore: cast_nullable_to_non_nullable
              as HealthSummary?,
      totalPets: null == totalPets
          ? _value.totalPets
          : totalPets // ignore: cast_nullable_to_non_nullable
              as int,
      activeMedications: null == activeMedications
          ? _value.activeMedications
          : activeMedications // ignore: cast_nullable_to_non_nullable
              as int,
      upcomingVaccinations: null == upcomingVaccinations
          ? _value.upcomingVaccinations
          : upcomingVaccinations // ignore: cast_nullable_to_non_nullable
              as int,
      overdueItems: null == overdueItems
          ? _value.overdueItems
          : overdueItems // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of DashboardDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HealthSummaryCopyWith<$Res>? get healthSummary {
    if (_value.healthSummary == null) {
      return null;
    }

    return $HealthSummaryCopyWith<$Res>(_value.healthSummary!, (value) {
      return _then(_value.copyWith(healthSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardDataEntityImplCopyWith<$Res>
    implements $DashboardDataEntityCopyWith<$Res> {
  factory _$$DashboardDataEntityImplCopyWith(_$DashboardDataEntityImpl value,
          $Res Function(_$DashboardDataEntityImpl) then) =
      __$$DashboardDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PetSummary> pets,
      List<TaskSummary> todaysTasks,
      List<TaskSummary> overdueTasks,
      List<TaskSummary> upcomingTasks,
      HealthSummary? healthSummary,
      int totalPets,
      int activeMedications,
      int upcomingVaccinations,
      int overdueItems});

  @override
  $HealthSummaryCopyWith<$Res>? get healthSummary;
}

/// @nodoc
class __$$DashboardDataEntityImplCopyWithImpl<$Res>
    extends _$DashboardDataEntityCopyWithImpl<$Res, _$DashboardDataEntityImpl>
    implements _$$DashboardDataEntityImplCopyWith<$Res> {
  __$$DashboardDataEntityImplCopyWithImpl(_$DashboardDataEntityImpl _value,
      $Res Function(_$DashboardDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pets = null,
    Object? todaysTasks = null,
    Object? overdueTasks = null,
    Object? upcomingTasks = null,
    Object? healthSummary = freezed,
    Object? totalPets = null,
    Object? activeMedications = null,
    Object? upcomingVaccinations = null,
    Object? overdueItems = null,
  }) {
    return _then(_$DashboardDataEntityImpl(
      pets: null == pets
          ? _value._pets
          : pets // ignore: cast_nullable_to_non_nullable
              as List<PetSummary>,
      todaysTasks: null == todaysTasks
          ? _value._todaysTasks
          : todaysTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskSummary>,
      overdueTasks: null == overdueTasks
          ? _value._overdueTasks
          : overdueTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskSummary>,
      upcomingTasks: null == upcomingTasks
          ? _value._upcomingTasks
          : upcomingTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskSummary>,
      healthSummary: freezed == healthSummary
          ? _value.healthSummary
          : healthSummary // ignore: cast_nullable_to_non_nullable
              as HealthSummary?,
      totalPets: null == totalPets
          ? _value.totalPets
          : totalPets // ignore: cast_nullable_to_non_nullable
              as int,
      activeMedications: null == activeMedications
          ? _value.activeMedications
          : activeMedications // ignore: cast_nullable_to_non_nullable
              as int,
      upcomingVaccinations: null == upcomingVaccinations
          ? _value.upcomingVaccinations
          : upcomingVaccinations // ignore: cast_nullable_to_non_nullable
              as int,
      overdueItems: null == overdueItems
          ? _value.overdueItems
          : overdueItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataEntityImpl implements _DashboardDataEntity {
  const _$DashboardDataEntityImpl(
      {required final List<PetSummary> pets,
      required final List<TaskSummary> todaysTasks,
      required final List<TaskSummary> overdueTasks,
      required final List<TaskSummary> upcomingTasks,
      required this.healthSummary,
      required this.totalPets,
      required this.activeMedications,
      required this.upcomingVaccinations,
      required this.overdueItems})
      : _pets = pets,
        _todaysTasks = todaysTasks,
        _overdueTasks = overdueTasks,
        _upcomingTasks = upcomingTasks;

  factory _$DashboardDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataEntityImplFromJson(json);

  final List<PetSummary> _pets;
  @override
  List<PetSummary> get pets {
    if (_pets is EqualUnmodifiableListView) return _pets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pets);
  }

  final List<TaskSummary> _todaysTasks;
  @override
  List<TaskSummary> get todaysTasks {
    if (_todaysTasks is EqualUnmodifiableListView) return _todaysTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todaysTasks);
  }

  final List<TaskSummary> _overdueTasks;
  @override
  List<TaskSummary> get overdueTasks {
    if (_overdueTasks is EqualUnmodifiableListView) return _overdueTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overdueTasks);
  }

  final List<TaskSummary> _upcomingTasks;
  @override
  List<TaskSummary> get upcomingTasks {
    if (_upcomingTasks is EqualUnmodifiableListView) return _upcomingTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingTasks);
  }

  @override
  final HealthSummary? healthSummary;
  @override
  final int totalPets;
  @override
  final int activeMedications;
  @override
  final int upcomingVaccinations;
  @override
  final int overdueItems;

  @override
  String toString() {
    return 'DashboardDataEntity(pets: $pets, todaysTasks: $todaysTasks, overdueTasks: $overdueTasks, upcomingTasks: $upcomingTasks, healthSummary: $healthSummary, totalPets: $totalPets, activeMedications: $activeMedications, upcomingVaccinations: $upcomingVaccinations, overdueItems: $overdueItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataEntityImpl &&
            const DeepCollectionEquality().equals(other._pets, _pets) &&
            const DeepCollectionEquality()
                .equals(other._todaysTasks, _todaysTasks) &&
            const DeepCollectionEquality()
                .equals(other._overdueTasks, _overdueTasks) &&
            const DeepCollectionEquality()
                .equals(other._upcomingTasks, _upcomingTasks) &&
            (identical(other.healthSummary, healthSummary) ||
                other.healthSummary == healthSummary) &&
            (identical(other.totalPets, totalPets) ||
                other.totalPets == totalPets) &&
            (identical(other.activeMedications, activeMedications) ||
                other.activeMedications == activeMedications) &&
            (identical(other.upcomingVaccinations, upcomingVaccinations) ||
                other.upcomingVaccinations == upcomingVaccinations) &&
            (identical(other.overdueItems, overdueItems) ||
                other.overdueItems == overdueItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pets),
      const DeepCollectionEquality().hash(_todaysTasks),
      const DeepCollectionEquality().hash(_overdueTasks),
      const DeepCollectionEquality().hash(_upcomingTasks),
      healthSummary,
      totalPets,
      activeMedications,
      upcomingVaccinations,
      overdueItems);

  /// Create a copy of DashboardDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataEntityImplCopyWith<_$DashboardDataEntityImpl> get copyWith =>
      __$$DashboardDataEntityImplCopyWithImpl<_$DashboardDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataEntityImplToJson(
      this,
    );
  }
}

abstract class _DashboardDataEntity implements DashboardDataEntity {
  const factory _DashboardDataEntity(
      {required final List<PetSummary> pets,
      required final List<TaskSummary> todaysTasks,
      required final List<TaskSummary> overdueTasks,
      required final List<TaskSummary> upcomingTasks,
      required final HealthSummary? healthSummary,
      required final int totalPets,
      required final int activeMedications,
      required final int upcomingVaccinations,
      required final int overdueItems}) = _$DashboardDataEntityImpl;

  factory _DashboardDataEntity.fromJson(Map<String, dynamic> json) =
      _$DashboardDataEntityImpl.fromJson;

  @override
  List<PetSummary> get pets;
  @override
  List<TaskSummary> get todaysTasks;
  @override
  List<TaskSummary> get overdueTasks;
  @override
  List<TaskSummary> get upcomingTasks;
  @override
  HealthSummary? get healthSummary;
  @override
  int get totalPets;
  @override
  int get activeMedications;
  @override
  int get upcomingVaccinations;
  @override
  int get overdueItems;

  /// Create a copy of DashboardDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataEntityImplCopyWith<_$DashboardDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PetSummary _$PetSummaryFromJson(Map<String, dynamic> json) {
  return _PetSummary.fromJson(json);
}

/// @nodoc
mixin _$PetSummary {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String? get breed => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get localPhotoPath => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this PetSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetSummaryCopyWith<PetSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetSummaryCopyWith<$Res> {
  factory $PetSummaryCopyWith(
          PetSummary value, $Res Function(PetSummary) then) =
      _$PetSummaryCopyWithImpl<$Res, PetSummary>;
  @useResult
  $Res call(
      {int id,
      String name,
      String species,
      String? breed,
      String? photoUrl,
      String? localPhotoPath,
      bool isSelected});
}

/// @nodoc
class _$PetSummaryCopyWithImpl<$Res, $Val extends PetSummary>
    implements $PetSummaryCopyWith<$Res> {
  _$PetSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? species = null,
    Object? breed = freezed,
    Object? photoUrl = freezed,
    Object? localPhotoPath = freezed,
    Object? isSelected = null,
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
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      localPhotoPath: freezed == localPhotoPath
          ? _value.localPhotoPath
          : localPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetSummaryImplCopyWith<$Res>
    implements $PetSummaryCopyWith<$Res> {
  factory _$$PetSummaryImplCopyWith(
          _$PetSummaryImpl value, $Res Function(_$PetSummaryImpl) then) =
      __$$PetSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String species,
      String? breed,
      String? photoUrl,
      String? localPhotoPath,
      bool isSelected});
}

/// @nodoc
class __$$PetSummaryImplCopyWithImpl<$Res>
    extends _$PetSummaryCopyWithImpl<$Res, _$PetSummaryImpl>
    implements _$$PetSummaryImplCopyWith<$Res> {
  __$$PetSummaryImplCopyWithImpl(
      _$PetSummaryImpl _value, $Res Function(_$PetSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PetSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? species = null,
    Object? breed = freezed,
    Object? photoUrl = freezed,
    Object? localPhotoPath = freezed,
    Object? isSelected = null,
  }) {
    return _then(_$PetSummaryImpl(
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
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      localPhotoPath: freezed == localPhotoPath
          ? _value.localPhotoPath
          : localPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetSummaryImpl implements _PetSummary {
  const _$PetSummaryImpl(
      {required this.id,
      required this.name,
      required this.species,
      this.breed,
      this.photoUrl,
      this.localPhotoPath,
      this.isSelected = false});

  factory _$PetSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetSummaryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String species;
  @override
  final String? breed;
  @override
  final String? photoUrl;
  @override
  final String? localPhotoPath;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'PetSummary(id: $id, name: $name, species: $species, breed: $breed, photoUrl: $photoUrl, localPhotoPath: $localPhotoPath, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.localPhotoPath, localPhotoPath) ||
                other.localPhotoPath == localPhotoPath) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, species, breed,
      photoUrl, localPhotoPath, isSelected);

  /// Create a copy of PetSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetSummaryImplCopyWith<_$PetSummaryImpl> get copyWith =>
      __$$PetSummaryImplCopyWithImpl<_$PetSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetSummaryImplToJson(
      this,
    );
  }
}

abstract class _PetSummary implements PetSummary {
  const factory _PetSummary(
      {required final int id,
      required final String name,
      required final String species,
      final String? breed,
      final String? photoUrl,
      final String? localPhotoPath,
      final bool isSelected}) = _$PetSummaryImpl;

  factory _PetSummary.fromJson(Map<String, dynamic> json) =
      _$PetSummaryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get species;
  @override
  String? get breed;
  @override
  String? get photoUrl;
  @override
  String? get localPhotoPath;
  @override
  bool get isSelected;

  /// Create a copy of PetSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetSummaryImplCopyWith<_$PetSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskSummary _$TaskSummaryFromJson(Map<String, dynamic> json) {
  return _TaskSummary.fromJson(json);
}

/// @nodoc
mixin _$TaskSummary {
  int get id => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // medication, vaccination, appointment, weight
  String get title => throw _privateConstructorUsedError;
  String get petName => throw _privateConstructorUsedError;
  int? get petId => throw _privateConstructorUsedError;
  DateTime get scheduledTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isOverdue => throw _privateConstructorUsedError;

  /// Serializes this TaskSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskSummaryCopyWith<TaskSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskSummaryCopyWith<$Res> {
  factory $TaskSummaryCopyWith(
          TaskSummary value, $Res Function(TaskSummary) then) =
      _$TaskSummaryCopyWithImpl<$Res, TaskSummary>;
  @useResult
  $Res call(
      {int id,
      String type,
      String title,
      String petName,
      int? petId,
      DateTime scheduledTime,
      String? description,
      bool isCompleted,
      bool isOverdue});
}

/// @nodoc
class _$TaskSummaryCopyWithImpl<$Res, $Val extends TaskSummary>
    implements $TaskSummaryCopyWith<$Res> {
  _$TaskSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? petName = null,
    Object? petId = freezed,
    Object? scheduledTime = null,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? isOverdue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOverdue: null == isOverdue
          ? _value.isOverdue
          : isOverdue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskSummaryImplCopyWith<$Res>
    implements $TaskSummaryCopyWith<$Res> {
  factory _$$TaskSummaryImplCopyWith(
          _$TaskSummaryImpl value, $Res Function(_$TaskSummaryImpl) then) =
      __$$TaskSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String type,
      String title,
      String petName,
      int? petId,
      DateTime scheduledTime,
      String? description,
      bool isCompleted,
      bool isOverdue});
}

/// @nodoc
class __$$TaskSummaryImplCopyWithImpl<$Res>
    extends _$TaskSummaryCopyWithImpl<$Res, _$TaskSummaryImpl>
    implements _$$TaskSummaryImplCopyWith<$Res> {
  __$$TaskSummaryImplCopyWithImpl(
      _$TaskSummaryImpl _value, $Res Function(_$TaskSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? petName = null,
    Object? petId = freezed,
    Object? scheduledTime = null,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? isOverdue = null,
  }) {
    return _then(_$TaskSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOverdue: null == isOverdue
          ? _value.isOverdue
          : isOverdue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskSummaryImpl implements _TaskSummary {
  const _$TaskSummaryImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.petName,
      this.petId,
      required this.scheduledTime,
      this.description,
      this.isCompleted = false,
      this.isOverdue = false});

  factory _$TaskSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskSummaryImplFromJson(json);

  @override
  final int id;
  @override
  final String type;
// medication, vaccination, appointment, weight
  @override
  final String title;
  @override
  final String petName;
  @override
  final int? petId;
  @override
  final DateTime scheduledTime;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final bool isOverdue;

  @override
  String toString() {
    return 'TaskSummary(id: $id, type: $type, title: $title, petName: $petName, petId: $petId, scheduledTime: $scheduledTime, description: $description, isCompleted: $isCompleted, isOverdue: $isOverdue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.petName, petName) || other.petName == petName) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isOverdue, isOverdue) ||
                other.isOverdue == isOverdue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, petName, petId,
      scheduledTime, description, isCompleted, isOverdue);

  /// Create a copy of TaskSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskSummaryImplCopyWith<_$TaskSummaryImpl> get copyWith =>
      __$$TaskSummaryImplCopyWithImpl<_$TaskSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskSummaryImplToJson(
      this,
    );
  }
}

abstract class _TaskSummary implements TaskSummary {
  const factory _TaskSummary(
      {required final int id,
      required final String type,
      required final String title,
      required final String petName,
      final int? petId,
      required final DateTime scheduledTime,
      final String? description,
      final bool isCompleted,
      final bool isOverdue}) = _$TaskSummaryImpl;

  factory _TaskSummary.fromJson(Map<String, dynamic> json) =
      _$TaskSummaryImpl.fromJson;

  @override
  int get id;
  @override
  String get type; // medication, vaccination, appointment, weight
  @override
  String get title;
  @override
  String get petName;
  @override
  int? get petId;
  @override
  DateTime get scheduledTime;
  @override
  String? get description;
  @override
  bool get isCompleted;
  @override
  bool get isOverdue;

  /// Create a copy of TaskSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskSummaryImplCopyWith<_$TaskSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthSummary _$HealthSummaryFromJson(Map<String, dynamic> json) {
  return _HealthSummary.fromJson(json);
}

/// @nodoc
mixin _$HealthSummary {
  String get petName => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  String get healthStatus => throw _privateConstructorUsedError;
  String get lastVetVisit => throw _privateConstructorUsedError;
  String? get petImageUrl => throw _privateConstructorUsedError;
  String? get petLocalPath => throw _privateConstructorUsedError;

  /// Serializes this HealthSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthSummaryCopyWith<HealthSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthSummaryCopyWith<$Res> {
  factory $HealthSummaryCopyWith(
          HealthSummary value, $Res Function(HealthSummary) then) =
      _$HealthSummaryCopyWithImpl<$Res, HealthSummary>;
  @useResult
  $Res call(
      {String petName,
      String weight,
      String healthStatus,
      String lastVetVisit,
      String? petImageUrl,
      String? petLocalPath});
}

/// @nodoc
class _$HealthSummaryCopyWithImpl<$Res, $Val extends HealthSummary>
    implements $HealthSummaryCopyWith<$Res> {
  _$HealthSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petName = null,
    Object? weight = null,
    Object? healthStatus = null,
    Object? lastVetVisit = null,
    Object? petImageUrl = freezed,
    Object? petLocalPath = freezed,
  }) {
    return _then(_value.copyWith(
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      healthStatus: null == healthStatus
          ? _value.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lastVetVisit: null == lastVetVisit
          ? _value.lastVetVisit
          : lastVetVisit // ignore: cast_nullable_to_non_nullable
              as String,
      petImageUrl: freezed == petImageUrl
          ? _value.petImageUrl
          : petImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      petLocalPath: freezed == petLocalPath
          ? _value.petLocalPath
          : petLocalPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthSummaryImplCopyWith<$Res>
    implements $HealthSummaryCopyWith<$Res> {
  factory _$$HealthSummaryImplCopyWith(
          _$HealthSummaryImpl value, $Res Function(_$HealthSummaryImpl) then) =
      __$$HealthSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String petName,
      String weight,
      String healthStatus,
      String lastVetVisit,
      String? petImageUrl,
      String? petLocalPath});
}

/// @nodoc
class __$$HealthSummaryImplCopyWithImpl<$Res>
    extends _$HealthSummaryCopyWithImpl<$Res, _$HealthSummaryImpl>
    implements _$$HealthSummaryImplCopyWith<$Res> {
  __$$HealthSummaryImplCopyWithImpl(
      _$HealthSummaryImpl _value, $Res Function(_$HealthSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petName = null,
    Object? weight = null,
    Object? healthStatus = null,
    Object? lastVetVisit = null,
    Object? petImageUrl = freezed,
    Object? petLocalPath = freezed,
  }) {
    return _then(_$HealthSummaryImpl(
      petName: null == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      healthStatus: null == healthStatus
          ? _value.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lastVetVisit: null == lastVetVisit
          ? _value.lastVetVisit
          : lastVetVisit // ignore: cast_nullable_to_non_nullable
              as String,
      petImageUrl: freezed == petImageUrl
          ? _value.petImageUrl
          : petImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      petLocalPath: freezed == petLocalPath
          ? _value.petLocalPath
          : petLocalPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthSummaryImpl implements _HealthSummary {
  const _$HealthSummaryImpl(
      {required this.petName,
      required this.weight,
      required this.healthStatus,
      required this.lastVetVisit,
      this.petImageUrl,
      this.petLocalPath});

  factory _$HealthSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthSummaryImplFromJson(json);

  @override
  final String petName;
  @override
  final String weight;
  @override
  final String healthStatus;
  @override
  final String lastVetVisit;
  @override
  final String? petImageUrl;
  @override
  final String? petLocalPath;

  @override
  String toString() {
    return 'HealthSummary(petName: $petName, weight: $weight, healthStatus: $healthStatus, lastVetVisit: $lastVetVisit, petImageUrl: $petImageUrl, petLocalPath: $petLocalPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthSummaryImpl &&
            (identical(other.petName, petName) || other.petName == petName) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.healthStatus, healthStatus) ||
                other.healthStatus == healthStatus) &&
            (identical(other.lastVetVisit, lastVetVisit) ||
                other.lastVetVisit == lastVetVisit) &&
            (identical(other.petImageUrl, petImageUrl) ||
                other.petImageUrl == petImageUrl) &&
            (identical(other.petLocalPath, petLocalPath) ||
                other.petLocalPath == petLocalPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, petName, weight, healthStatus,
      lastVetVisit, petImageUrl, petLocalPath);

  /// Create a copy of HealthSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthSummaryImplCopyWith<_$HealthSummaryImpl> get copyWith =>
      __$$HealthSummaryImplCopyWithImpl<_$HealthSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthSummaryImplToJson(
      this,
    );
  }
}

abstract class _HealthSummary implements HealthSummary {
  const factory _HealthSummary(
      {required final String petName,
      required final String weight,
      required final String healthStatus,
      required final String lastVetVisit,
      final String? petImageUrl,
      final String? petLocalPath}) = _$HealthSummaryImpl;

  factory _HealthSummary.fromJson(Map<String, dynamic> json) =
      _$HealthSummaryImpl.fromJson;

  @override
  String get petName;
  @override
  String get weight;
  @override
  String get healthStatus;
  @override
  String get lastVetVisit;
  @override
  String? get petImageUrl;
  @override
  String? get petLocalPath;

  /// Create a copy of HealthSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthSummaryImplCopyWith<_$HealthSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
