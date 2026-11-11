// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FamilyMemberModel _$FamilyMemberModelFromJson(Map<String, dynamic> json) {
  return _FamilyMemberModel.fromJson(json);
}

/// @nodoc
mixin _$FamilyMemberModel {
  int get id => throw _privateConstructorUsedError;
  int get petId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get invitedBy => throw _privateConstructorUsedError;
  DateTime get invitedAt => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FamilyMemberModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyMemberModelCopyWith<FamilyMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyMemberModelCopyWith<$Res> {
  factory $FamilyMemberModelCopyWith(
          FamilyMemberModel value, $Res Function(FamilyMemberModel) then) =
      _$FamilyMemberModelCopyWithImpl<$Res, FamilyMemberModel>;
  @useResult
  $Res call(
      {int id,
      int petId,
      int? userId,
      String email,
      String? name,
      String role,
      String status,
      String invitedBy,
      DateTime invitedAt,
      DateTime? respondedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$FamilyMemberModelCopyWithImpl<$Res, $Val extends FamilyMemberModel>
    implements $FamilyMemberModelCopyWith<$Res> {
  _$FamilyMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? userId = freezed,
    Object? email = null,
    Object? name = freezed,
    Object? role = null,
    Object? status = null,
    Object? invitedBy = null,
    Object? invitedAt = null,
    Object? respondedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedAt: null == invitedAt
          ? _value.invitedAt
          : invitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$FamilyMemberModelImplCopyWith<$Res>
    implements $FamilyMemberModelCopyWith<$Res> {
  factory _$$FamilyMemberModelImplCopyWith(_$FamilyMemberModelImpl value,
          $Res Function(_$FamilyMemberModelImpl) then) =
      __$$FamilyMemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int petId,
      int? userId,
      String email,
      String? name,
      String role,
      String status,
      String invitedBy,
      DateTime invitedAt,
      DateTime? respondedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$FamilyMemberModelImplCopyWithImpl<$Res>
    extends _$FamilyMemberModelCopyWithImpl<$Res, _$FamilyMemberModelImpl>
    implements _$$FamilyMemberModelImplCopyWith<$Res> {
  __$$FamilyMemberModelImplCopyWithImpl(_$FamilyMemberModelImpl _value,
      $Res Function(_$FamilyMemberModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? userId = freezed,
    Object? email = null,
    Object? name = freezed,
    Object? role = null,
    Object? status = null,
    Object? invitedBy = null,
    Object? invitedAt = null,
    Object? respondedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$FamilyMemberModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      petId: null == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedAt: null == invitedAt
          ? _value.invitedAt
          : invitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$FamilyMemberModelImpl extends _FamilyMemberModel {
  const _$FamilyMemberModelImpl(
      {required this.id,
      required this.petId,
      this.userId,
      required this.email,
      this.name,
      this.role = 'viewer',
      this.status = 'pending',
      required this.invitedBy,
      required this.invitedAt,
      this.respondedAt,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$FamilyMemberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyMemberModelImplFromJson(json);

  @override
  final int id;
  @override
  final int petId;
  @override
  final int? userId;
  @override
  final String email;
  @override
  final String? name;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String status;
  @override
  final String invitedBy;
  @override
  final DateTime invitedAt;
  @override
  final DateTime? respondedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'FamilyMemberModel(id: $id, petId: $petId, userId: $userId, email: $email, name: $name, role: $role, status: $status, invitedBy: $invitedBy, invitedAt: $invitedAt, respondedAt: $respondedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyMemberModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.invitedAt, invitedAt) ||
                other.invitedAt == invitedAt) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, petId, userId, email, name,
      role, status, invitedBy, invitedAt, respondedAt, createdAt, updatedAt);

  /// Create a copy of FamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyMemberModelImplCopyWith<_$FamilyMemberModelImpl> get copyWith =>
      __$$FamilyMemberModelImplCopyWithImpl<_$FamilyMemberModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyMemberModelImplToJson(
      this,
    );
  }
}

abstract class _FamilyMemberModel extends FamilyMemberModel {
  const factory _FamilyMemberModel(
      {required final int id,
      required final int petId,
      final int? userId,
      required final String email,
      final String? name,
      final String role,
      final String status,
      required final String invitedBy,
      required final DateTime invitedAt,
      final DateTime? respondedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$FamilyMemberModelImpl;
  const _FamilyMemberModel._() : super._();

  factory _FamilyMemberModel.fromJson(Map<String, dynamic> json) =
      _$FamilyMemberModelImpl.fromJson;

  @override
  int get id;
  @override
  int get petId;
  @override
  int? get userId;
  @override
  String get email;
  @override
  String? get name;
  @override
  String get role;
  @override
  String get status;
  @override
  String get invitedBy;
  @override
  DateTime get invitedAt;
  @override
  DateTime? get respondedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of FamilyMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyMemberModelImplCopyWith<_$FamilyMemberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
