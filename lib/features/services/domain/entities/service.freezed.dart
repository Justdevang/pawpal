// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  String? get settingsSchema =>
      throw _privateConstructorUsedError; // JSON schema for service settings
  List<String>? get reminderTypes =>
      throw _privateConstructorUsedError; // Types of reminders this service provides
  int get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this Service to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String iconName,
      DateTime createdAt,
      DateTime updatedAt,
      String? route,
      bool isEnabled,
      String? settingsSchema,
      List<String>? reminderTypes,
      int sortOrder});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? iconName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? route = freezed,
    Object? isEnabled = null,
    Object? settingsSchema = freezed,
    Object? reminderTypes = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      settingsSchema: freezed == settingsSchema
          ? _value.settingsSchema
          : settingsSchema // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderTypes: freezed == reminderTypes
          ? _value.reminderTypes
          : reminderTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String iconName,
      DateTime createdAt,
      DateTime updatedAt,
      String? route,
      bool isEnabled,
      String? settingsSchema,
      List<String>? reminderTypes,
      int sortOrder});
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? iconName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? route = freezed,
    Object? isEnabled = null,
    Object? settingsSchema = freezed,
    Object? reminderTypes = freezed,
    Object? sortOrder = null,
  }) {
    return _then(_$ServiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      settingsSchema: freezed == settingsSchema
          ? _value.settingsSchema
          : settingsSchema // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderTypes: freezed == reminderTypes
          ? _value._reminderTypes
          : reminderTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.iconName,
      required this.createdAt,
      required this.updatedAt,
      this.route,
      this.isEnabled = true,
      this.settingsSchema,
      final List<String>? reminderTypes,
      this.sortOrder = 0})
      : _reminderTypes = reminderTypes;

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String iconName;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? route;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  final String? settingsSchema;
// JSON schema for service settings
  final List<String>? _reminderTypes;
// JSON schema for service settings
  @override
  List<String>? get reminderTypes {
    final value = _reminderTypes;
    if (value == null) return null;
    if (_reminderTypes is EqualUnmodifiableListView) return _reminderTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Types of reminders this service provides
  @override
  @JsonKey()
  final int sortOrder;

  @override
  String toString() {
    return 'Service(id: $id, name: $name, description: $description, iconName: $iconName, createdAt: $createdAt, updatedAt: $updatedAt, route: $route, isEnabled: $isEnabled, settingsSchema: $settingsSchema, reminderTypes: $reminderTypes, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.settingsSchema, settingsSchema) ||
                other.settingsSchema == settingsSchema) &&
            const DeepCollectionEquality()
                .equals(other._reminderTypes, _reminderTypes) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      iconName,
      createdAt,
      updatedAt,
      route,
      isEnabled,
      settingsSchema,
      const DeepCollectionEquality().hash(_reminderTypes),
      sortOrder);

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {required final String id,
      required final String name,
      required final String description,
      required final String iconName,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? route,
      final bool isEnabled,
      final String? settingsSchema,
      final List<String>? reminderTypes,
      final int sortOrder}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get iconName;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get route;
  @override
  bool get isEnabled;
  @override
  String? get settingsSchema; // JSON schema for service settings
  @override
  List<String>? get reminderTypes; // Types of reminders this service provides
  @override
  int get sortOrder;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
