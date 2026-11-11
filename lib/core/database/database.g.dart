// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firebaseUidMeta =
      const VerificationMeta('firebaseUid');
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
      'firebase_uid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _photoUrlMeta =
      const VerificationMeta('photoUrl');
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
      'photo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _preferredLanguageMeta =
      const VerificationMeta('preferredLanguage');
  @override
  late final GeneratedColumn<String> preferredLanguage =
      GeneratedColumn<String>('preferred_language', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('en'));
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<String> units = GeneratedColumn<String>(
      'units', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('metric'));
  static const VerificationMeta _darkModeMeta =
      const VerificationMeta('darkMode');
  @override
  late final GeneratedColumn<bool> darkMode = GeneratedColumn<bool>(
      'dark_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dark_mode" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
      'notifications_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notifications_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _quietHoursStartMeta =
      const VerificationMeta('quietHoursStart');
  @override
  late final GeneratedColumn<DateTime> quietHoursStart =
      GeneratedColumn<DateTime>('quiet_hours_start', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _quietHoursEndMeta =
      const VerificationMeta('quietHoursEnd');
  @override
  late final GeneratedColumn<DateTime> quietHoursEnd =
      GeneratedColumn<DateTime>('quiet_hours_end', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firebaseUid,
        email,
        displayName,
        photoUrl,
        preferredLanguage,
        units,
        darkMode,
        notificationsEnabled,
        quietHoursStart,
        quietHoursEnd,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('firebase_uid')) {
      context.handle(
          _firebaseUidMeta,
          firebaseUid.isAcceptableOrUnknown(
              data['firebase_uid']!, _firebaseUidMeta));
    } else if (isInserting) {
      context.missing(_firebaseUidMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    }
    if (data.containsKey('photo_url')) {
      context.handle(_photoUrlMeta,
          photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta));
    }
    if (data.containsKey('preferred_language')) {
      context.handle(
          _preferredLanguageMeta,
          preferredLanguage.isAcceptableOrUnknown(
              data['preferred_language']!, _preferredLanguageMeta));
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    }
    if (data.containsKey('dark_mode')) {
      context.handle(_darkModeMeta,
          darkMode.isAcceptableOrUnknown(data['dark_mode']!, _darkModeMeta));
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
          _notificationsEnabledMeta,
          notificationsEnabled.isAcceptableOrUnknown(
              data['notifications_enabled']!, _notificationsEnabledMeta));
    }
    if (data.containsKey('quiet_hours_start')) {
      context.handle(
          _quietHoursStartMeta,
          quietHoursStart.isAcceptableOrUnknown(
              data['quiet_hours_start']!, _quietHoursStartMeta));
    }
    if (data.containsKey('quiet_hours_end')) {
      context.handle(
          _quietHoursEndMeta,
          quietHoursEnd.isAcceptableOrUnknown(
              data['quiet_hours_end']!, _quietHoursEndMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firebaseUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firebase_uid'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name']),
      photoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_url']),
      preferredLanguage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}preferred_language'])!,
      units: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}units'])!,
      darkMode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dark_mode'])!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}notifications_enabled'])!,
      quietHoursStart: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}quiet_hours_start']),
      quietHoursEnd: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}quiet_hours_end']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String firebaseUid;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final String preferredLanguage;
  final String units;
  final bool darkMode;
  final bool notificationsEnabled;
  final DateTime? quietHoursStart;
  final DateTime? quietHoursEnd;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const User(
      {required this.id,
      required this.firebaseUid,
      required this.email,
      this.displayName,
      this.photoUrl,
      required this.preferredLanguage,
      required this.units,
      required this.darkMode,
      required this.notificationsEnabled,
      this.quietHoursStart,
      this.quietHoursEnd,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['firebase_uid'] = Variable<String>(firebaseUid);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    map['preferred_language'] = Variable<String>(preferredLanguage);
    map['units'] = Variable<String>(units);
    map['dark_mode'] = Variable<bool>(darkMode);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    if (!nullToAbsent || quietHoursStart != null) {
      map['quiet_hours_start'] = Variable<DateTime>(quietHoursStart);
    }
    if (!nullToAbsent || quietHoursEnd != null) {
      map['quiet_hours_end'] = Variable<DateTime>(quietHoursEnd);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      firebaseUid: Value(firebaseUid),
      email: Value(email),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      preferredLanguage: Value(preferredLanguage),
      units: Value(units),
      darkMode: Value(darkMode),
      notificationsEnabled: Value(notificationsEnabled),
      quietHoursStart: quietHoursStart == null && nullToAbsent
          ? const Value.absent()
          : Value(quietHoursStart),
      quietHoursEnd: quietHoursEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(quietHoursEnd),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      firebaseUid: serializer.fromJson<String>(json['firebaseUid']),
      email: serializer.fromJson<String>(json['email']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      preferredLanguage: serializer.fromJson<String>(json['preferredLanguage']),
      units: serializer.fromJson<String>(json['units']),
      darkMode: serializer.fromJson<bool>(json['darkMode']),
      notificationsEnabled:
          serializer.fromJson<bool>(json['notificationsEnabled']),
      quietHoursStart: serializer.fromJson<DateTime?>(json['quietHoursStart']),
      quietHoursEnd: serializer.fromJson<DateTime?>(json['quietHoursEnd']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firebaseUid': serializer.toJson<String>(firebaseUid),
      'email': serializer.toJson<String>(email),
      'displayName': serializer.toJson<String?>(displayName),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'preferredLanguage': serializer.toJson<String>(preferredLanguage),
      'units': serializer.toJson<String>(units),
      'darkMode': serializer.toJson<bool>(darkMode),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'quietHoursStart': serializer.toJson<DateTime?>(quietHoursStart),
      'quietHoursEnd': serializer.toJson<DateTime?>(quietHoursEnd),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  User copyWith(
          {int? id,
          String? firebaseUid,
          String? email,
          Value<String?> displayName = const Value.absent(),
          Value<String?> photoUrl = const Value.absent(),
          String? preferredLanguage,
          String? units,
          bool? darkMode,
          bool? notificationsEnabled,
          Value<DateTime?> quietHoursStart = const Value.absent(),
          Value<DateTime?> quietHoursEnd = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        firebaseUid: firebaseUid ?? this.firebaseUid,
        email: email ?? this.email,
        displayName: displayName.present ? displayName.value : this.displayName,
        photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        units: units ?? this.units,
        darkMode: darkMode ?? this.darkMode,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        quietHoursStart: quietHoursStart.present
            ? quietHoursStart.value
            : this.quietHoursStart,
        quietHoursEnd:
            quietHoursEnd.present ? quietHoursEnd.value : this.quietHoursEnd,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      firebaseUid:
          data.firebaseUid.present ? data.firebaseUid.value : this.firebaseUid,
      email: data.email.present ? data.email.value : this.email,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      preferredLanguage: data.preferredLanguage.present
          ? data.preferredLanguage.value
          : this.preferredLanguage,
      units: data.units.present ? data.units.value : this.units,
      darkMode: data.darkMode.present ? data.darkMode.value : this.darkMode,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      quietHoursStart: data.quietHoursStart.present
          ? data.quietHoursStart.value
          : this.quietHoursStart,
      quietHoursEnd: data.quietHoursEnd.present
          ? data.quietHoursEnd.value
          : this.quietHoursEnd,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('preferredLanguage: $preferredLanguage, ')
          ..write('units: $units, ')
          ..write('darkMode: $darkMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('quietHoursStart: $quietHoursStart, ')
          ..write('quietHoursEnd: $quietHoursEnd, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      firebaseUid,
      email,
      displayName,
      photoUrl,
      preferredLanguage,
      units,
      darkMode,
      notificationsEnabled,
      quietHoursStart,
      quietHoursEnd,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.firebaseUid == this.firebaseUid &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.photoUrl == this.photoUrl &&
          other.preferredLanguage == this.preferredLanguage &&
          other.units == this.units &&
          other.darkMode == this.darkMode &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.quietHoursStart == this.quietHoursStart &&
          other.quietHoursEnd == this.quietHoursEnd &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> firebaseUid;
  final Value<String> email;
  final Value<String?> displayName;
  final Value<String?> photoUrl;
  final Value<String> preferredLanguage;
  final Value<String> units;
  final Value<bool> darkMode;
  final Value<bool> notificationsEnabled;
  final Value<DateTime?> quietHoursStart;
  final Value<DateTime?> quietHoursEnd;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.preferredLanguage = const Value.absent(),
    this.units = const Value.absent(),
    this.darkMode = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.quietHoursStart = const Value.absent(),
    this.quietHoursEnd = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String firebaseUid,
    required String email,
    this.displayName = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.preferredLanguage = const Value.absent(),
    this.units = const Value.absent(),
    this.darkMode = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.quietHoursStart = const Value.absent(),
    this.quietHoursEnd = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : firebaseUid = Value(firebaseUid),
        email = Value(email);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? firebaseUid,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? photoUrl,
    Expression<String>? preferredLanguage,
    Expression<String>? units,
    Expression<bool>? darkMode,
    Expression<bool>? notificationsEnabled,
    Expression<DateTime>? quietHoursStart,
    Expression<DateTime>? quietHoursEnd,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (preferredLanguage != null) 'preferred_language': preferredLanguage,
      if (units != null) 'units': units,
      if (darkMode != null) 'dark_mode': darkMode,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (quietHoursStart != null) 'quiet_hours_start': quietHoursStart,
      if (quietHoursEnd != null) 'quiet_hours_end': quietHoursEnd,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? firebaseUid,
      Value<String>? email,
      Value<String?>? displayName,
      Value<String?>? photoUrl,
      Value<String>? preferredLanguage,
      Value<String>? units,
      Value<bool>? darkMode,
      Value<bool>? notificationsEnabled,
      Value<DateTime?>? quietHoursStart,
      Value<DateTime?>? quietHoursEnd,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return UsersCompanion(
      id: id ?? this.id,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      units: units ?? this.units,
      darkMode: darkMode ?? this.darkMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (preferredLanguage.present) {
      map['preferred_language'] = Variable<String>(preferredLanguage.value);
    }
    if (units.present) {
      map['units'] = Variable<String>(units.value);
    }
    if (darkMode.present) {
      map['dark_mode'] = Variable<bool>(darkMode.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (quietHoursStart.present) {
      map['quiet_hours_start'] = Variable<DateTime>(quietHoursStart.value);
    }
    if (quietHoursEnd.present) {
      map['quiet_hours_end'] = Variable<DateTime>(quietHoursEnd.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('preferredLanguage: $preferredLanguage, ')
          ..write('units: $units, ')
          ..write('darkMode: $darkMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('quietHoursStart: $quietHoursStart, ')
          ..write('quietHoursEnd: $quietHoursEnd, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $PetsTable extends Pets with TableInfo<$PetsTable, Pet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
      'breed', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _approximateAgeMeta =
      const VerificationMeta('approximateAge');
  @override
  late final GeneratedColumn<String> approximateAge = GeneratedColumn<String>(
      'approximate_age', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _weightUnitMeta =
      const VerificationMeta('weightUnit');
  @override
  late final GeneratedColumn<String> weightUnit = GeneratedColumn<String>(
      'weight_unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('kg'));
  static const VerificationMeta _microchipNumberMeta =
      const VerificationMeta('microchipNumber');
  @override
  late final GeneratedColumn<String> microchipNumber = GeneratedColumn<String>(
      'microchip_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _photoUrlMeta =
      const VerificationMeta('photoUrl');
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
      'photo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localPhotoPathMeta =
      const VerificationMeta('localPhotoPath');
  @override
  late final GeneratedColumn<String> localPhotoPath = GeneratedColumn<String>(
      'local_photo_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        name,
        species,
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
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(Insertable<Pet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
          _breedMeta, breed.isAcceptableOrUnknown(data['breed']!, _breedMeta));
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    }
    if (data.containsKey('approximate_age')) {
      context.handle(
          _approximateAgeMeta,
          approximateAge.isAcceptableOrUnknown(
              data['approximate_age']!, _approximateAgeMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('weight_unit')) {
      context.handle(
          _weightUnitMeta,
          weightUnit.isAcceptableOrUnknown(
              data['weight_unit']!, _weightUnitMeta));
    }
    if (data.containsKey('microchip_number')) {
      context.handle(
          _microchipNumberMeta,
          microchipNumber.isAcceptableOrUnknown(
              data['microchip_number']!, _microchipNumberMeta));
    }
    if (data.containsKey('photo_url')) {
      context.handle(_photoUrlMeta,
          photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta));
    }
    if (data.containsKey('local_photo_path')) {
      context.handle(
          _localPhotoPathMeta,
          localPhotoPath.isAcceptableOrUnknown(
              data['local_photo_path']!, _localPhotoPathMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      breed: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed']),
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex']),
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date']),
      approximateAge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}approximate_age']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      weightUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weight_unit'])!,
      microchipNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}microchip_number']),
      photoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_url']),
      localPhotoPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_photo_path']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $PetsTable createAlias(String alias) {
    return $PetsTable(attachedDatabase, alias);
  }
}

class Pet extends DataClass implements Insertable<Pet> {
  final int id;
  final int userId;
  final String name;
  final String species;
  final String? breed;
  final String? sex;
  final DateTime? birthDate;
  final String? approximateAge;
  final double? weight;
  final String weightUnit;
  final String? microchipNumber;
  final String? photoUrl;
  final String? localPhotoPath;
  final String? notes;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Pet(
      {required this.id,
      required this.userId,
      required this.name,
      required this.species,
      this.breed,
      this.sex,
      this.birthDate,
      this.approximateAge,
      this.weight,
      required this.weightUnit,
      this.microchipNumber,
      this.photoUrl,
      this.localPhotoPath,
      this.notes,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['species'] = Variable<String>(species);
    if (!nullToAbsent || breed != null) {
      map['breed'] = Variable<String>(breed);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || approximateAge != null) {
      map['approximate_age'] = Variable<String>(approximateAge);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    map['weight_unit'] = Variable<String>(weightUnit);
    if (!nullToAbsent || microchipNumber != null) {
      map['microchip_number'] = Variable<String>(microchipNumber);
    }
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    if (!nullToAbsent || localPhotoPath != null) {
      map['local_photo_path'] = Variable<String>(localPhotoPath);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  PetsCompanion toCompanion(bool nullToAbsent) {
    return PetsCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      species: Value(species),
      breed:
          breed == null && nullToAbsent ? const Value.absent() : Value(breed),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      approximateAge: approximateAge == null && nullToAbsent
          ? const Value.absent()
          : Value(approximateAge),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      weightUnit: Value(weightUnit),
      microchipNumber: microchipNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(microchipNumber),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      localPhotoPath: localPhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPhotoPath),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Pet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pet(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      species: serializer.fromJson<String>(json['species']),
      breed: serializer.fromJson<String?>(json['breed']),
      sex: serializer.fromJson<String?>(json['sex']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      approximateAge: serializer.fromJson<String?>(json['approximateAge']),
      weight: serializer.fromJson<double?>(json['weight']),
      weightUnit: serializer.fromJson<String>(json['weightUnit']),
      microchipNumber: serializer.fromJson<String?>(json['microchipNumber']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      localPhotoPath: serializer.fromJson<String?>(json['localPhotoPath']),
      notes: serializer.fromJson<String?>(json['notes']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'species': serializer.toJson<String>(species),
      'breed': serializer.toJson<String?>(breed),
      'sex': serializer.toJson<String?>(sex),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'approximateAge': serializer.toJson<String?>(approximateAge),
      'weight': serializer.toJson<double?>(weight),
      'weightUnit': serializer.toJson<String>(weightUnit),
      'microchipNumber': serializer.toJson<String?>(microchipNumber),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'localPhotoPath': serializer.toJson<String?>(localPhotoPath),
      'notes': serializer.toJson<String?>(notes),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Pet copyWith(
          {int? id,
          int? userId,
          String? name,
          String? species,
          Value<String?> breed = const Value.absent(),
          Value<String?> sex = const Value.absent(),
          Value<DateTime?> birthDate = const Value.absent(),
          Value<String?> approximateAge = const Value.absent(),
          Value<double?> weight = const Value.absent(),
          String? weightUnit,
          Value<String?> microchipNumber = const Value.absent(),
          Value<String?> photoUrl = const Value.absent(),
          Value<String?> localPhotoPath = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Pet(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        species: species ?? this.species,
        breed: breed.present ? breed.value : this.breed,
        sex: sex.present ? sex.value : this.sex,
        birthDate: birthDate.present ? birthDate.value : this.birthDate,
        approximateAge:
            approximateAge.present ? approximateAge.value : this.approximateAge,
        weight: weight.present ? weight.value : this.weight,
        weightUnit: weightUnit ?? this.weightUnit,
        microchipNumber: microchipNumber.present
            ? microchipNumber.value
            : this.microchipNumber,
        photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
        localPhotoPath:
            localPhotoPath.present ? localPhotoPath.value : this.localPhotoPath,
        notes: notes.present ? notes.value : this.notes,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Pet copyWithCompanion(PetsCompanion data) {
    return Pet(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      species: data.species.present ? data.species.value : this.species,
      breed: data.breed.present ? data.breed.value : this.breed,
      sex: data.sex.present ? data.sex.value : this.sex,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      approximateAge: data.approximateAge.present
          ? data.approximateAge.value
          : this.approximateAge,
      weight: data.weight.present ? data.weight.value : this.weight,
      weightUnit:
          data.weightUnit.present ? data.weightUnit.value : this.weightUnit,
      microchipNumber: data.microchipNumber.present
          ? data.microchipNumber.value
          : this.microchipNumber,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      localPhotoPath: data.localPhotoPath.present
          ? data.localPhotoPath.value
          : this.localPhotoPath,
      notes: data.notes.present ? data.notes.value : this.notes,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pet(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('approximateAge: $approximateAge, ')
          ..write('weight: $weight, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('microchipNumber: $microchipNumber, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('localPhotoPath: $localPhotoPath, ')
          ..write('notes: $notes, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      name,
      species,
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
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pet &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.species == this.species &&
          other.breed == this.breed &&
          other.sex == this.sex &&
          other.birthDate == this.birthDate &&
          other.approximateAge == this.approximateAge &&
          other.weight == this.weight &&
          other.weightUnit == this.weightUnit &&
          other.microchipNumber == this.microchipNumber &&
          other.photoUrl == this.photoUrl &&
          other.localPhotoPath == this.localPhotoPath &&
          other.notes == this.notes &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class PetsCompanion extends UpdateCompanion<Pet> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<String> species;
  final Value<String?> breed;
  final Value<String?> sex;
  final Value<DateTime?> birthDate;
  final Value<String?> approximateAge;
  final Value<double?> weight;
  final Value<String> weightUnit;
  final Value<String?> microchipNumber;
  final Value<String?> photoUrl;
  final Value<String?> localPhotoPath;
  final Value<String?> notes;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const PetsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.species = const Value.absent(),
    this.breed = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.approximateAge = const Value.absent(),
    this.weight = const Value.absent(),
    this.weightUnit = const Value.absent(),
    this.microchipNumber = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.localPhotoPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  PetsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    required String species,
    this.breed = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.approximateAge = const Value.absent(),
    this.weight = const Value.absent(),
    this.weightUnit = const Value.absent(),
    this.microchipNumber = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.localPhotoPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : userId = Value(userId),
        name = Value(name),
        species = Value(species);
  static Insertable<Pet> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? species,
    Expression<String>? breed,
    Expression<String>? sex,
    Expression<DateTime>? birthDate,
    Expression<String>? approximateAge,
    Expression<double>? weight,
    Expression<String>? weightUnit,
    Expression<String>? microchipNumber,
    Expression<String>? photoUrl,
    Expression<String>? localPhotoPath,
    Expression<String>? notes,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (species != null) 'species': species,
      if (breed != null) 'breed': breed,
      if (sex != null) 'sex': sex,
      if (birthDate != null) 'birth_date': birthDate,
      if (approximateAge != null) 'approximate_age': approximateAge,
      if (weight != null) 'weight': weight,
      if (weightUnit != null) 'weight_unit': weightUnit,
      if (microchipNumber != null) 'microchip_number': microchipNumber,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (localPhotoPath != null) 'local_photo_path': localPhotoPath,
      if (notes != null) 'notes': notes,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  PetsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? name,
      Value<String>? species,
      Value<String?>? breed,
      Value<String?>? sex,
      Value<DateTime?>? birthDate,
      Value<String?>? approximateAge,
      Value<double?>? weight,
      Value<String>? weightUnit,
      Value<String?>? microchipNumber,
      Value<String?>? photoUrl,
      Value<String?>? localPhotoPath,
      Value<String?>? notes,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return PetsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      birthDate: birthDate ?? this.birthDate,
      approximateAge: approximateAge ?? this.approximateAge,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      microchipNumber: microchipNumber ?? this.microchipNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      localPhotoPath: localPhotoPath ?? this.localPhotoPath,
      notes: notes ?? this.notes,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (approximateAge.present) {
      map['approximate_age'] = Variable<String>(approximateAge.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (weightUnit.present) {
      map['weight_unit'] = Variable<String>(weightUnit.value);
    }
    if (microchipNumber.present) {
      map['microchip_number'] = Variable<String>(microchipNumber.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (localPhotoPath.present) {
      map['local_photo_path'] = Variable<String>(localPhotoPath.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('approximateAge: $approximateAge, ')
          ..write('weight: $weight, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('microchipNumber: $microchipNumber, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('localPhotoPath: $localPhotoPath, ')
          ..write('notes: $notes, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $VaccinesTable extends Vaccines with TableInfo<$VaccinesTable, Vaccine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VaccinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _initialDoseWeeksMeta =
      const VerificationMeta('initialDoseWeeks');
  @override
  late final GeneratedColumn<int> initialDoseWeeks = GeneratedColumn<int>(
      'initial_dose_weeks', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _boosterIntervalWeeksMeta =
      const VerificationMeta('boosterIntervalWeeks');
  @override
  late final GeneratedColumn<int> boosterIntervalWeeks = GeneratedColumn<int>(
      'booster_interval_weeks', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _boosterCountMeta =
      const VerificationMeta('boosterCount');
  @override
  late final GeneratedColumn<int> boosterCount = GeneratedColumn<int>(
      'booster_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
      'region', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('global'));
  static const VerificationMeta _isCoreMeta = const VerificationMeta('isCore');
  @override
  late final GeneratedColumn<bool> isCore = GeneratedColumn<bool>(
      'is_core', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_core" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
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
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vaccines';
  @override
  VerificationContext validateIntegrity(Insertable<Vaccine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('initial_dose_weeks')) {
      context.handle(
          _initialDoseWeeksMeta,
          initialDoseWeeks.isAcceptableOrUnknown(
              data['initial_dose_weeks']!, _initialDoseWeeksMeta));
    }
    if (data.containsKey('booster_interval_weeks')) {
      context.handle(
          _boosterIntervalWeeksMeta,
          boosterIntervalWeeks.isAcceptableOrUnknown(
              data['booster_interval_weeks']!, _boosterIntervalWeeksMeta));
    }
    if (data.containsKey('booster_count')) {
      context.handle(
          _boosterCountMeta,
          boosterCount.isAcceptableOrUnknown(
              data['booster_count']!, _boosterCountMeta));
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    }
    if (data.containsKey('is_core')) {
      context.handle(_isCoreMeta,
          isCore.isAcceptableOrUnknown(data['is_core']!, _isCoreMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vaccine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vaccine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      initialDoseWeeks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}initial_dose_weeks']),
      boosterIntervalWeeks: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}booster_interval_weeks']),
      boosterCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}booster_count']),
      region: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region'])!,
      isCore: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_core'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $VaccinesTable createAlias(String alias) {
    return $VaccinesTable(attachedDatabase, alias);
  }
}

class Vaccine extends DataClass implements Insertable<Vaccine> {
  final int id;
  final String name;
  final String species;
  final String? description;
  final int? initialDoseWeeks;
  final int? boosterIntervalWeeks;
  final int? boosterCount;
  final String region;
  final bool isCore;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Vaccine(
      {required this.id,
      required this.name,
      required this.species,
      this.description,
      this.initialDoseWeeks,
      this.boosterIntervalWeeks,
      this.boosterCount,
      required this.region,
      required this.isCore,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['species'] = Variable<String>(species);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || initialDoseWeeks != null) {
      map['initial_dose_weeks'] = Variable<int>(initialDoseWeeks);
    }
    if (!nullToAbsent || boosterIntervalWeeks != null) {
      map['booster_interval_weeks'] = Variable<int>(boosterIntervalWeeks);
    }
    if (!nullToAbsent || boosterCount != null) {
      map['booster_count'] = Variable<int>(boosterCount);
    }
    map['region'] = Variable<String>(region);
    map['is_core'] = Variable<bool>(isCore);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VaccinesCompanion toCompanion(bool nullToAbsent) {
    return VaccinesCompanion(
      id: Value(id),
      name: Value(name),
      species: Value(species),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      initialDoseWeeks: initialDoseWeeks == null && nullToAbsent
          ? const Value.absent()
          : Value(initialDoseWeeks),
      boosterIntervalWeeks: boosterIntervalWeeks == null && nullToAbsent
          ? const Value.absent()
          : Value(boosterIntervalWeeks),
      boosterCount: boosterCount == null && nullToAbsent
          ? const Value.absent()
          : Value(boosterCount),
      region: Value(region),
      isCore: Value(isCore),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Vaccine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vaccine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      species: serializer.fromJson<String>(json['species']),
      description: serializer.fromJson<String?>(json['description']),
      initialDoseWeeks: serializer.fromJson<int?>(json['initialDoseWeeks']),
      boosterIntervalWeeks:
          serializer.fromJson<int?>(json['boosterIntervalWeeks']),
      boosterCount: serializer.fromJson<int?>(json['boosterCount']),
      region: serializer.fromJson<String>(json['region']),
      isCore: serializer.fromJson<bool>(json['isCore']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'species': serializer.toJson<String>(species),
      'description': serializer.toJson<String?>(description),
      'initialDoseWeeks': serializer.toJson<int?>(initialDoseWeeks),
      'boosterIntervalWeeks': serializer.toJson<int?>(boosterIntervalWeeks),
      'boosterCount': serializer.toJson<int?>(boosterCount),
      'region': serializer.toJson<String>(region),
      'isCore': serializer.toJson<bool>(isCore),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Vaccine copyWith(
          {int? id,
          String? name,
          String? species,
          Value<String?> description = const Value.absent(),
          Value<int?> initialDoseWeeks = const Value.absent(),
          Value<int?> boosterIntervalWeeks = const Value.absent(),
          Value<int?> boosterCount = const Value.absent(),
          String? region,
          bool? isCore,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Vaccine(
        id: id ?? this.id,
        name: name ?? this.name,
        species: species ?? this.species,
        description: description.present ? description.value : this.description,
        initialDoseWeeks: initialDoseWeeks.present
            ? initialDoseWeeks.value
            : this.initialDoseWeeks,
        boosterIntervalWeeks: boosterIntervalWeeks.present
            ? boosterIntervalWeeks.value
            : this.boosterIntervalWeeks,
        boosterCount:
            boosterCount.present ? boosterCount.value : this.boosterCount,
        region: region ?? this.region,
        isCore: isCore ?? this.isCore,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Vaccine copyWithCompanion(VaccinesCompanion data) {
    return Vaccine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      species: data.species.present ? data.species.value : this.species,
      description:
          data.description.present ? data.description.value : this.description,
      initialDoseWeeks: data.initialDoseWeeks.present
          ? data.initialDoseWeeks.value
          : this.initialDoseWeeks,
      boosterIntervalWeeks: data.boosterIntervalWeeks.present
          ? data.boosterIntervalWeeks.value
          : this.boosterIntervalWeeks,
      boosterCount: data.boosterCount.present
          ? data.boosterCount.value
          : this.boosterCount,
      region: data.region.present ? data.region.value : this.region,
      isCore: data.isCore.present ? data.isCore.value : this.isCore,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vaccine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('description: $description, ')
          ..write('initialDoseWeeks: $initialDoseWeeks, ')
          ..write('boosterIntervalWeeks: $boosterIntervalWeeks, ')
          ..write('boosterCount: $boosterCount, ')
          ..write('region: $region, ')
          ..write('isCore: $isCore, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vaccine &&
          other.id == this.id &&
          other.name == this.name &&
          other.species == this.species &&
          other.description == this.description &&
          other.initialDoseWeeks == this.initialDoseWeeks &&
          other.boosterIntervalWeeks == this.boosterIntervalWeeks &&
          other.boosterCount == this.boosterCount &&
          other.region == this.region &&
          other.isCore == this.isCore &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VaccinesCompanion extends UpdateCompanion<Vaccine> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> species;
  final Value<String?> description;
  final Value<int?> initialDoseWeeks;
  final Value<int?> boosterIntervalWeeks;
  final Value<int?> boosterCount;
  final Value<String> region;
  final Value<bool> isCore;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VaccinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.species = const Value.absent(),
    this.description = const Value.absent(),
    this.initialDoseWeeks = const Value.absent(),
    this.boosterIntervalWeeks = const Value.absent(),
    this.boosterCount = const Value.absent(),
    this.region = const Value.absent(),
    this.isCore = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VaccinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String species,
    this.description = const Value.absent(),
    this.initialDoseWeeks = const Value.absent(),
    this.boosterIntervalWeeks = const Value.absent(),
    this.boosterCount = const Value.absent(),
    this.region = const Value.absent(),
    this.isCore = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        species = Value(species);
  static Insertable<Vaccine> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? species,
    Expression<String>? description,
    Expression<int>? initialDoseWeeks,
    Expression<int>? boosterIntervalWeeks,
    Expression<int>? boosterCount,
    Expression<String>? region,
    Expression<bool>? isCore,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (species != null) 'species': species,
      if (description != null) 'description': description,
      if (initialDoseWeeks != null) 'initial_dose_weeks': initialDoseWeeks,
      if (boosterIntervalWeeks != null)
        'booster_interval_weeks': boosterIntervalWeeks,
      if (boosterCount != null) 'booster_count': boosterCount,
      if (region != null) 'region': region,
      if (isCore != null) 'is_core': isCore,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VaccinesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? species,
      Value<String?>? description,
      Value<int?>? initialDoseWeeks,
      Value<int?>? boosterIntervalWeeks,
      Value<int?>? boosterCount,
      Value<String>? region,
      Value<bool>? isCore,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return VaccinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      description: description ?? this.description,
      initialDoseWeeks: initialDoseWeeks ?? this.initialDoseWeeks,
      boosterIntervalWeeks: boosterIntervalWeeks ?? this.boosterIntervalWeeks,
      boosterCount: boosterCount ?? this.boosterCount,
      region: region ?? this.region,
      isCore: isCore ?? this.isCore,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (initialDoseWeeks.present) {
      map['initial_dose_weeks'] = Variable<int>(initialDoseWeeks.value);
    }
    if (boosterIntervalWeeks.present) {
      map['booster_interval_weeks'] = Variable<int>(boosterIntervalWeeks.value);
    }
    if (boosterCount.present) {
      map['booster_count'] = Variable<int>(boosterCount.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (isCore.present) {
      map['is_core'] = Variable<bool>(isCore.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaccinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('description: $description, ')
          ..write('initialDoseWeeks: $initialDoseWeeks, ')
          ..write('boosterIntervalWeeks: $boosterIntervalWeeks, ')
          ..write('boosterCount: $boosterCount, ')
          ..write('region: $region, ')
          ..write('isCore: $isCore, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VaccinationRecordsTable extends VaccinationRecords
    with TableInfo<$VaccinationRecordsTable, VaccinationRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VaccinationRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pets (id) ON DELETE CASCADE'));
  static const VerificationMeta _vaccineIdMeta =
      const VerificationMeta('vaccineId');
  @override
  late final GeneratedColumn<int> vaccineId = GeneratedColumn<int>(
      'vaccine_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vaccines (id) ON DELETE RESTRICT'));
  static const VerificationMeta _vaccineNameMeta =
      const VerificationMeta('vaccineName');
  @override
  late final GeneratedColumn<String> vaccineName = GeneratedColumn<String>(
      'vaccine_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateGivenMeta =
      const VerificationMeta('dateGiven');
  @override
  late final GeneratedColumn<DateTime> dateGiven = GeneratedColumn<DateTime>(
      'date_given', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nextDueDateMeta =
      const VerificationMeta('nextDueDate');
  @override
  late final GeneratedColumn<DateTime> nextDueDate = GeneratedColumn<DateTime>(
      'next_due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _vetClinicMeta =
      const VerificationMeta('vetClinic');
  @override
  late final GeneratedColumn<String> vetClinic = GeneratedColumn<String>(
      'vet_clinic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _batchNumberMeta =
      const VerificationMeta('batchNumber');
  @override
  late final GeneratedColumn<String> batchNumber = GeneratedColumn<String>(
      'batch_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _certificatePhotoUrlMeta =
      const VerificationMeta('certificatePhotoUrl');
  @override
  late final GeneratedColumn<String> certificatePhotoUrl =
      GeneratedColumn<String>('certificate_photo_url', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _certificateLocalPathMeta =
      const VerificationMeta('certificateLocalPath');
  @override
  late final GeneratedColumn<String> certificateLocalPath =
      GeneratedColumn<String>('certificate_local_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vaccination_records';
  @override
  VerificationContext validateIntegrity(Insertable<VaccinationRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('vaccine_id')) {
      context.handle(_vaccineIdMeta,
          vaccineId.isAcceptableOrUnknown(data['vaccine_id']!, _vaccineIdMeta));
    } else if (isInserting) {
      context.missing(_vaccineIdMeta);
    }
    if (data.containsKey('vaccine_name')) {
      context.handle(
          _vaccineNameMeta,
          vaccineName.isAcceptableOrUnknown(
              data['vaccine_name']!, _vaccineNameMeta));
    } else if (isInserting) {
      context.missing(_vaccineNameMeta);
    }
    if (data.containsKey('date_given')) {
      context.handle(_dateGivenMeta,
          dateGiven.isAcceptableOrUnknown(data['date_given']!, _dateGivenMeta));
    } else if (isInserting) {
      context.missing(_dateGivenMeta);
    }
    if (data.containsKey('next_due_date')) {
      context.handle(
          _nextDueDateMeta,
          nextDueDate.isAcceptableOrUnknown(
              data['next_due_date']!, _nextDueDateMeta));
    }
    if (data.containsKey('vet_clinic')) {
      context.handle(_vetClinicMeta,
          vetClinic.isAcceptableOrUnknown(data['vet_clinic']!, _vetClinicMeta));
    }
    if (data.containsKey('batch_number')) {
      context.handle(
          _batchNumberMeta,
          batchNumber.isAcceptableOrUnknown(
              data['batch_number']!, _batchNumberMeta));
    }
    if (data.containsKey('certificate_photo_url')) {
      context.handle(
          _certificatePhotoUrlMeta,
          certificatePhotoUrl.isAcceptableOrUnknown(
              data['certificate_photo_url']!, _certificatePhotoUrlMeta));
    }
    if (data.containsKey('certificate_local_path')) {
      context.handle(
          _certificateLocalPathMeta,
          certificateLocalPath.isAcceptableOrUnknown(
              data['certificate_local_path']!, _certificateLocalPathMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VaccinationRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VaccinationRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      vaccineId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vaccine_id'])!,
      vaccineName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vaccine_name'])!,
      dateGiven: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_given'])!,
      nextDueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_due_date']),
      vetClinic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vet_clinic']),
      batchNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_number']),
      certificatePhotoUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}certificate_photo_url']),
      certificateLocalPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}certificate_local_path']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $VaccinationRecordsTable createAlias(String alias) {
    return $VaccinationRecordsTable(attachedDatabase, alias);
  }
}

class VaccinationRecord extends DataClass
    implements Insertable<VaccinationRecord> {
  final int id;
  final int petId;
  final int vaccineId;
  final String vaccineName;
  final DateTime dateGiven;
  final DateTime? nextDueDate;
  final String? vetClinic;
  final String? batchNumber;
  final String? certificatePhotoUrl;
  final String? certificateLocalPath;
  final String? notes;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const VaccinationRecord(
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
      required this.isCompleted,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pet_id'] = Variable<int>(petId);
    map['vaccine_id'] = Variable<int>(vaccineId);
    map['vaccine_name'] = Variable<String>(vaccineName);
    map['date_given'] = Variable<DateTime>(dateGiven);
    if (!nullToAbsent || nextDueDate != null) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate);
    }
    if (!nullToAbsent || vetClinic != null) {
      map['vet_clinic'] = Variable<String>(vetClinic);
    }
    if (!nullToAbsent || batchNumber != null) {
      map['batch_number'] = Variable<String>(batchNumber);
    }
    if (!nullToAbsent || certificatePhotoUrl != null) {
      map['certificate_photo_url'] = Variable<String>(certificatePhotoUrl);
    }
    if (!nullToAbsent || certificateLocalPath != null) {
      map['certificate_local_path'] = Variable<String>(certificateLocalPath);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  VaccinationRecordsCompanion toCompanion(bool nullToAbsent) {
    return VaccinationRecordsCompanion(
      id: Value(id),
      petId: Value(petId),
      vaccineId: Value(vaccineId),
      vaccineName: Value(vaccineName),
      dateGiven: Value(dateGiven),
      nextDueDate: nextDueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueDate),
      vetClinic: vetClinic == null && nullToAbsent
          ? const Value.absent()
          : Value(vetClinic),
      batchNumber: batchNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(batchNumber),
      certificatePhotoUrl: certificatePhotoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(certificatePhotoUrl),
      certificateLocalPath: certificateLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(certificateLocalPath),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isCompleted: Value(isCompleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory VaccinationRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VaccinationRecord(
      id: serializer.fromJson<int>(json['id']),
      petId: serializer.fromJson<int>(json['petId']),
      vaccineId: serializer.fromJson<int>(json['vaccineId']),
      vaccineName: serializer.fromJson<String>(json['vaccineName']),
      dateGiven: serializer.fromJson<DateTime>(json['dateGiven']),
      nextDueDate: serializer.fromJson<DateTime?>(json['nextDueDate']),
      vetClinic: serializer.fromJson<String?>(json['vetClinic']),
      batchNumber: serializer.fromJson<String?>(json['batchNumber']),
      certificatePhotoUrl:
          serializer.fromJson<String?>(json['certificatePhotoUrl']),
      certificateLocalPath:
          serializer.fromJson<String?>(json['certificateLocalPath']),
      notes: serializer.fromJson<String?>(json['notes']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'petId': serializer.toJson<int>(petId),
      'vaccineId': serializer.toJson<int>(vaccineId),
      'vaccineName': serializer.toJson<String>(vaccineName),
      'dateGiven': serializer.toJson<DateTime>(dateGiven),
      'nextDueDate': serializer.toJson<DateTime?>(nextDueDate),
      'vetClinic': serializer.toJson<String?>(vetClinic),
      'batchNumber': serializer.toJson<String?>(batchNumber),
      'certificatePhotoUrl': serializer.toJson<String?>(certificatePhotoUrl),
      'certificateLocalPath': serializer.toJson<String?>(certificateLocalPath),
      'notes': serializer.toJson<String?>(notes),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  VaccinationRecord copyWith(
          {int? id,
          int? petId,
          int? vaccineId,
          String? vaccineName,
          DateTime? dateGiven,
          Value<DateTime?> nextDueDate = const Value.absent(),
          Value<String?> vetClinic = const Value.absent(),
          Value<String?> batchNumber = const Value.absent(),
          Value<String?> certificatePhotoUrl = const Value.absent(),
          Value<String?> certificateLocalPath = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isCompleted,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      VaccinationRecord(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        vaccineId: vaccineId ?? this.vaccineId,
        vaccineName: vaccineName ?? this.vaccineName,
        dateGiven: dateGiven ?? this.dateGiven,
        nextDueDate: nextDueDate.present ? nextDueDate.value : this.nextDueDate,
        vetClinic: vetClinic.present ? vetClinic.value : this.vetClinic,
        batchNumber: batchNumber.present ? batchNumber.value : this.batchNumber,
        certificatePhotoUrl: certificatePhotoUrl.present
            ? certificatePhotoUrl.value
            : this.certificatePhotoUrl,
        certificateLocalPath: certificateLocalPath.present
            ? certificateLocalPath.value
            : this.certificateLocalPath,
        notes: notes.present ? notes.value : this.notes,
        isCompleted: isCompleted ?? this.isCompleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  VaccinationRecord copyWithCompanion(VaccinationRecordsCompanion data) {
    return VaccinationRecord(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      vaccineId: data.vaccineId.present ? data.vaccineId.value : this.vaccineId,
      vaccineName:
          data.vaccineName.present ? data.vaccineName.value : this.vaccineName,
      dateGiven: data.dateGiven.present ? data.dateGiven.value : this.dateGiven,
      nextDueDate:
          data.nextDueDate.present ? data.nextDueDate.value : this.nextDueDate,
      vetClinic: data.vetClinic.present ? data.vetClinic.value : this.vetClinic,
      batchNumber:
          data.batchNumber.present ? data.batchNumber.value : this.batchNumber,
      certificatePhotoUrl: data.certificatePhotoUrl.present
          ? data.certificatePhotoUrl.value
          : this.certificatePhotoUrl,
      certificateLocalPath: data.certificateLocalPath.present
          ? data.certificateLocalPath.value
          : this.certificateLocalPath,
      notes: data.notes.present ? data.notes.value : this.notes,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VaccinationRecord(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vaccineId: $vaccineId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('dateGiven: $dateGiven, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('vetClinic: $vetClinic, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('certificatePhotoUrl: $certificatePhotoUrl, ')
          ..write('certificateLocalPath: $certificateLocalPath, ')
          ..write('notes: $notes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VaccinationRecord &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.vaccineId == this.vaccineId &&
          other.vaccineName == this.vaccineName &&
          other.dateGiven == this.dateGiven &&
          other.nextDueDate == this.nextDueDate &&
          other.vetClinic == this.vetClinic &&
          other.batchNumber == this.batchNumber &&
          other.certificatePhotoUrl == this.certificatePhotoUrl &&
          other.certificateLocalPath == this.certificateLocalPath &&
          other.notes == this.notes &&
          other.isCompleted == this.isCompleted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class VaccinationRecordsCompanion extends UpdateCompanion<VaccinationRecord> {
  final Value<int> id;
  final Value<int> petId;
  final Value<int> vaccineId;
  final Value<String> vaccineName;
  final Value<DateTime> dateGiven;
  final Value<DateTime?> nextDueDate;
  final Value<String?> vetClinic;
  final Value<String?> batchNumber;
  final Value<String?> certificatePhotoUrl;
  final Value<String?> certificateLocalPath;
  final Value<String?> notes;
  final Value<bool> isCompleted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const VaccinationRecordsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.vaccineId = const Value.absent(),
    this.vaccineName = const Value.absent(),
    this.dateGiven = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.vetClinic = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.certificatePhotoUrl = const Value.absent(),
    this.certificateLocalPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  VaccinationRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int petId,
    required int vaccineId,
    required String vaccineName,
    required DateTime dateGiven,
    this.nextDueDate = const Value.absent(),
    this.vetClinic = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.certificatePhotoUrl = const Value.absent(),
    this.certificateLocalPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : petId = Value(petId),
        vaccineId = Value(vaccineId),
        vaccineName = Value(vaccineName),
        dateGiven = Value(dateGiven);
  static Insertable<VaccinationRecord> custom({
    Expression<int>? id,
    Expression<int>? petId,
    Expression<int>? vaccineId,
    Expression<String>? vaccineName,
    Expression<DateTime>? dateGiven,
    Expression<DateTime>? nextDueDate,
    Expression<String>? vetClinic,
    Expression<String>? batchNumber,
    Expression<String>? certificatePhotoUrl,
    Expression<String>? certificateLocalPath,
    Expression<String>? notes,
    Expression<bool>? isCompleted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (vaccineId != null) 'vaccine_id': vaccineId,
      if (vaccineName != null) 'vaccine_name': vaccineName,
      if (dateGiven != null) 'date_given': dateGiven,
      if (nextDueDate != null) 'next_due_date': nextDueDate,
      if (vetClinic != null) 'vet_clinic': vetClinic,
      if (batchNumber != null) 'batch_number': batchNumber,
      if (certificatePhotoUrl != null)
        'certificate_photo_url': certificatePhotoUrl,
      if (certificateLocalPath != null)
        'certificate_local_path': certificateLocalPath,
      if (notes != null) 'notes': notes,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  VaccinationRecordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? petId,
      Value<int>? vaccineId,
      Value<String>? vaccineName,
      Value<DateTime>? dateGiven,
      Value<DateTime?>? nextDueDate,
      Value<String?>? vetClinic,
      Value<String?>? batchNumber,
      Value<String?>? certificatePhotoUrl,
      Value<String?>? certificateLocalPath,
      Value<String?>? notes,
      Value<bool>? isCompleted,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return VaccinationRecordsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      vaccineId: vaccineId ?? this.vaccineId,
      vaccineName: vaccineName ?? this.vaccineName,
      dateGiven: dateGiven ?? this.dateGiven,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      vetClinic: vetClinic ?? this.vetClinic,
      batchNumber: batchNumber ?? this.batchNumber,
      certificatePhotoUrl: certificatePhotoUrl ?? this.certificatePhotoUrl,
      certificateLocalPath: certificateLocalPath ?? this.certificateLocalPath,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (vaccineId.present) {
      map['vaccine_id'] = Variable<int>(vaccineId.value);
    }
    if (vaccineName.present) {
      map['vaccine_name'] = Variable<String>(vaccineName.value);
    }
    if (dateGiven.present) {
      map['date_given'] = Variable<DateTime>(dateGiven.value);
    }
    if (nextDueDate.present) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate.value);
    }
    if (vetClinic.present) {
      map['vet_clinic'] = Variable<String>(vetClinic.value);
    }
    if (batchNumber.present) {
      map['batch_number'] = Variable<String>(batchNumber.value);
    }
    if (certificatePhotoUrl.present) {
      map['certificate_photo_url'] =
          Variable<String>(certificatePhotoUrl.value);
    }
    if (certificateLocalPath.present) {
      map['certificate_local_path'] =
          Variable<String>(certificateLocalPath.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaccinationRecordsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vaccineId: $vaccineId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('dateGiven: $dateGiven, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('vetClinic: $vetClinic, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('certificatePhotoUrl: $certificatePhotoUrl, ')
          ..write('certificateLocalPath: $certificateLocalPath, ')
          ..write('notes: $notes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pets (id) ON DELETE CASCADE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
      'dosage', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _formMeta = const VerificationMeta('form');
  @override
  late final GeneratedColumn<String> form = GeneratedColumn<String>(
      'form', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _frequencyTypeMeta =
      const VerificationMeta('frequencyType');
  @override
  late final GeneratedColumn<String> frequencyType = GeneratedColumn<String>(
      'frequency_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timesPerDayMeta =
      const VerificationMeta('timesPerDay');
  @override
  late final GeneratedColumn<int> timesPerDay = GeneratedColumn<int>(
      'times_per_day', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _everyNHoursMeta =
      const VerificationMeta('everyNHours');
  @override
  late final GeneratedColumn<int> everyNHours = GeneratedColumn<int>(
      'every_n_hours', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _specificWeekdaysMeta =
      const VerificationMeta('specificWeekdays');
  @override
  late final GeneratedColumn<String> specificWeekdays = GeneratedColumn<String>(
      'specific_weekdays', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customCronMeta =
      const VerificationMeta('customCron');
  @override
  late final GeneratedColumn<String> customCron = GeneratedColumn<String>(
      'custom_cron', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _withFoodMeta =
      const VerificationMeta('withFood');
  @override
  late final GeneratedColumn<bool> withFood = GeneratedColumn<bool>(
      'with_food', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("with_food" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
      'instructions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _remainingDosesMeta =
      const VerificationMeta('remainingDoses');
  @override
  late final GeneratedColumn<int> remainingDoses = GeneratedColumn<int>(
      'remaining_doses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _refillThresholdMeta =
      const VerificationMeta('refillThreshold');
  @override
  late final GeneratedColumn<int> refillThreshold = GeneratedColumn<int>(
      'refill_threshold', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _vetClinicMeta =
      const VerificationMeta('vetClinic');
  @override
  late final GeneratedColumn<String> vetClinic = GeneratedColumn<String>(
      'vet_clinic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _prescribingVetMeta =
      const VerificationMeta('prescribingVet');
  @override
  late final GeneratedColumn<String> prescribingVet = GeneratedColumn<String>(
      'prescribing_vet', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        petId,
        name,
        dosage,
        form,
        frequencyType,
        timesPerDay,
        everyNHours,
        specificWeekdays,
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
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(Insertable<Medication> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(_dosageMeta,
          dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta));
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('form')) {
      context.handle(
          _formMeta, form.isAcceptableOrUnknown(data['form']!, _formMeta));
    } else if (isInserting) {
      context.missing(_formMeta);
    }
    if (data.containsKey('frequency_type')) {
      context.handle(
          _frequencyTypeMeta,
          frequencyType.isAcceptableOrUnknown(
              data['frequency_type']!, _frequencyTypeMeta));
    } else if (isInserting) {
      context.missing(_frequencyTypeMeta);
    }
    if (data.containsKey('times_per_day')) {
      context.handle(
          _timesPerDayMeta,
          timesPerDay.isAcceptableOrUnknown(
              data['times_per_day']!, _timesPerDayMeta));
    }
    if (data.containsKey('every_n_hours')) {
      context.handle(
          _everyNHoursMeta,
          everyNHours.isAcceptableOrUnknown(
              data['every_n_hours']!, _everyNHoursMeta));
    }
    if (data.containsKey('specific_weekdays')) {
      context.handle(
          _specificWeekdaysMeta,
          specificWeekdays.isAcceptableOrUnknown(
              data['specific_weekdays']!, _specificWeekdaysMeta));
    }
    if (data.containsKey('custom_cron')) {
      context.handle(
          _customCronMeta,
          customCron.isAcceptableOrUnknown(
              data['custom_cron']!, _customCronMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('with_food')) {
      context.handle(_withFoodMeta,
          withFood.isAcceptableOrUnknown(data['with_food']!, _withFoodMeta));
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    }
    if (data.containsKey('remaining_doses')) {
      context.handle(
          _remainingDosesMeta,
          remainingDoses.isAcceptableOrUnknown(
              data['remaining_doses']!, _remainingDosesMeta));
    }
    if (data.containsKey('refill_threshold')) {
      context.handle(
          _refillThresholdMeta,
          refillThreshold.isAcceptableOrUnknown(
              data['refill_threshold']!, _refillThresholdMeta));
    }
    if (data.containsKey('vet_clinic')) {
      context.handle(_vetClinicMeta,
          vetClinic.isAcceptableOrUnknown(data['vet_clinic']!, _vetClinicMeta));
    }
    if (data.containsKey('prescribing_vet')) {
      context.handle(
          _prescribingVetMeta,
          prescribingVet.isAcceptableOrUnknown(
              data['prescribing_vet']!, _prescribingVetMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dosage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dosage'])!,
      form: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}form'])!,
      frequencyType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frequency_type'])!,
      timesPerDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_per_day']),
      everyNHours: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}every_n_hours']),
      specificWeekdays: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}specific_weekdays']),
      customCron: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}custom_cron']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      withFood: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}with_food'])!,
      instructions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instructions']),
      remainingDoses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remaining_doses']),
      refillThreshold: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}refill_threshold']),
      vetClinic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vet_clinic']),
      prescribingVet: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prescribing_vet']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final int id;
  final int petId;
  final String name;
  final String dosage;
  final String form;
  final String frequencyType;
  final int? timesPerDay;
  final int? everyNHours;
  final String? specificWeekdays;
  final String? customCron;
  final DateTime startDate;
  final DateTime? endDate;
  final bool withFood;
  final String? instructions;
  final int? remainingDoses;
  final int? refillThreshold;
  final String? vetClinic;
  final String? prescribingVet;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Medication(
      {required this.id,
      required this.petId,
      required this.name,
      required this.dosage,
      required this.form,
      required this.frequencyType,
      this.timesPerDay,
      this.everyNHours,
      this.specificWeekdays,
      this.customCron,
      required this.startDate,
      this.endDate,
      required this.withFood,
      this.instructions,
      this.remainingDoses,
      this.refillThreshold,
      this.vetClinic,
      this.prescribingVet,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pet_id'] = Variable<int>(petId);
    map['name'] = Variable<String>(name);
    map['dosage'] = Variable<String>(dosage);
    map['form'] = Variable<String>(form);
    map['frequency_type'] = Variable<String>(frequencyType);
    if (!nullToAbsent || timesPerDay != null) {
      map['times_per_day'] = Variable<int>(timesPerDay);
    }
    if (!nullToAbsent || everyNHours != null) {
      map['every_n_hours'] = Variable<int>(everyNHours);
    }
    if (!nullToAbsent || specificWeekdays != null) {
      map['specific_weekdays'] = Variable<String>(specificWeekdays);
    }
    if (!nullToAbsent || customCron != null) {
      map['custom_cron'] = Variable<String>(customCron);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['with_food'] = Variable<bool>(withFood);
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || remainingDoses != null) {
      map['remaining_doses'] = Variable<int>(remainingDoses);
    }
    if (!nullToAbsent || refillThreshold != null) {
      map['refill_threshold'] = Variable<int>(refillThreshold);
    }
    if (!nullToAbsent || vetClinic != null) {
      map['vet_clinic'] = Variable<String>(vetClinic);
    }
    if (!nullToAbsent || prescribingVet != null) {
      map['prescribing_vet'] = Variable<String>(prescribingVet);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      petId: Value(petId),
      name: Value(name),
      dosage: Value(dosage),
      form: Value(form),
      frequencyType: Value(frequencyType),
      timesPerDay: timesPerDay == null && nullToAbsent
          ? const Value.absent()
          : Value(timesPerDay),
      everyNHours: everyNHours == null && nullToAbsent
          ? const Value.absent()
          : Value(everyNHours),
      specificWeekdays: specificWeekdays == null && nullToAbsent
          ? const Value.absent()
          : Value(specificWeekdays),
      customCron: customCron == null && nullToAbsent
          ? const Value.absent()
          : Value(customCron),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      withFood: Value(withFood),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      remainingDoses: remainingDoses == null && nullToAbsent
          ? const Value.absent()
          : Value(remainingDoses),
      refillThreshold: refillThreshold == null && nullToAbsent
          ? const Value.absent()
          : Value(refillThreshold),
      vetClinic: vetClinic == null && nullToAbsent
          ? const Value.absent()
          : Value(vetClinic),
      prescribingVet: prescribingVet == null && nullToAbsent
          ? const Value.absent()
          : Value(prescribingVet),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Medication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<int>(json['id']),
      petId: serializer.fromJson<int>(json['petId']),
      name: serializer.fromJson<String>(json['name']),
      dosage: serializer.fromJson<String>(json['dosage']),
      form: serializer.fromJson<String>(json['form']),
      frequencyType: serializer.fromJson<String>(json['frequencyType']),
      timesPerDay: serializer.fromJson<int?>(json['timesPerDay']),
      everyNHours: serializer.fromJson<int?>(json['everyNHours']),
      specificWeekdays: serializer.fromJson<String?>(json['specificWeekdays']),
      customCron: serializer.fromJson<String?>(json['customCron']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      withFood: serializer.fromJson<bool>(json['withFood']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      remainingDoses: serializer.fromJson<int?>(json['remainingDoses']),
      refillThreshold: serializer.fromJson<int?>(json['refillThreshold']),
      vetClinic: serializer.fromJson<String?>(json['vetClinic']),
      prescribingVet: serializer.fromJson<String?>(json['prescribingVet']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'petId': serializer.toJson<int>(petId),
      'name': serializer.toJson<String>(name),
      'dosage': serializer.toJson<String>(dosage),
      'form': serializer.toJson<String>(form),
      'frequencyType': serializer.toJson<String>(frequencyType),
      'timesPerDay': serializer.toJson<int?>(timesPerDay),
      'everyNHours': serializer.toJson<int?>(everyNHours),
      'specificWeekdays': serializer.toJson<String?>(specificWeekdays),
      'customCron': serializer.toJson<String?>(customCron),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'withFood': serializer.toJson<bool>(withFood),
      'instructions': serializer.toJson<String?>(instructions),
      'remainingDoses': serializer.toJson<int?>(remainingDoses),
      'refillThreshold': serializer.toJson<int?>(refillThreshold),
      'vetClinic': serializer.toJson<String?>(vetClinic),
      'prescribingVet': serializer.toJson<String?>(prescribingVet),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Medication copyWith(
          {int? id,
          int? petId,
          String? name,
          String? dosage,
          String? form,
          String? frequencyType,
          Value<int?> timesPerDay = const Value.absent(),
          Value<int?> everyNHours = const Value.absent(),
          Value<String?> specificWeekdays = const Value.absent(),
          Value<String?> customCron = const Value.absent(),
          DateTime? startDate,
          Value<DateTime?> endDate = const Value.absent(),
          bool? withFood,
          Value<String?> instructions = const Value.absent(),
          Value<int?> remainingDoses = const Value.absent(),
          Value<int?> refillThreshold = const Value.absent(),
          Value<String?> vetClinic = const Value.absent(),
          Value<String?> prescribingVet = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Medication(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        name: name ?? this.name,
        dosage: dosage ?? this.dosage,
        form: form ?? this.form,
        frequencyType: frequencyType ?? this.frequencyType,
        timesPerDay: timesPerDay.present ? timesPerDay.value : this.timesPerDay,
        everyNHours: everyNHours.present ? everyNHours.value : this.everyNHours,
        specificWeekdays: specificWeekdays.present
            ? specificWeekdays.value
            : this.specificWeekdays,
        customCron: customCron.present ? customCron.value : this.customCron,
        startDate: startDate ?? this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        withFood: withFood ?? this.withFood,
        instructions:
            instructions.present ? instructions.value : this.instructions,
        remainingDoses:
            remainingDoses.present ? remainingDoses.value : this.remainingDoses,
        refillThreshold: refillThreshold.present
            ? refillThreshold.value
            : this.refillThreshold,
        vetClinic: vetClinic.present ? vetClinic.value : this.vetClinic,
        prescribingVet:
            prescribingVet.present ? prescribingVet.value : this.prescribingVet,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      name: data.name.present ? data.name.value : this.name,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      form: data.form.present ? data.form.value : this.form,
      frequencyType: data.frequencyType.present
          ? data.frequencyType.value
          : this.frequencyType,
      timesPerDay:
          data.timesPerDay.present ? data.timesPerDay.value : this.timesPerDay,
      everyNHours:
          data.everyNHours.present ? data.everyNHours.value : this.everyNHours,
      specificWeekdays: data.specificWeekdays.present
          ? data.specificWeekdays.value
          : this.specificWeekdays,
      customCron:
          data.customCron.present ? data.customCron.value : this.customCron,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      withFood: data.withFood.present ? data.withFood.value : this.withFood,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      remainingDoses: data.remainingDoses.present
          ? data.remainingDoses.value
          : this.remainingDoses,
      refillThreshold: data.refillThreshold.present
          ? data.refillThreshold.value
          : this.refillThreshold,
      vetClinic: data.vetClinic.present ? data.vetClinic.value : this.vetClinic,
      prescribingVet: data.prescribingVet.present
          ? data.prescribingVet.value
          : this.prescribingVet,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('form: $form, ')
          ..write('frequencyType: $frequencyType, ')
          ..write('timesPerDay: $timesPerDay, ')
          ..write('everyNHours: $everyNHours, ')
          ..write('specificWeekdays: $specificWeekdays, ')
          ..write('customCron: $customCron, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('withFood: $withFood, ')
          ..write('instructions: $instructions, ')
          ..write('remainingDoses: $remainingDoses, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('vetClinic: $vetClinic, ')
          ..write('prescribingVet: $prescribingVet, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        petId,
        name,
        dosage,
        form,
        frequencyType,
        timesPerDay,
        everyNHours,
        specificWeekdays,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.name == this.name &&
          other.dosage == this.dosage &&
          other.form == this.form &&
          other.frequencyType == this.frequencyType &&
          other.timesPerDay == this.timesPerDay &&
          other.everyNHours == this.everyNHours &&
          other.specificWeekdays == this.specificWeekdays &&
          other.customCron == this.customCron &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.withFood == this.withFood &&
          other.instructions == this.instructions &&
          other.remainingDoses == this.remainingDoses &&
          other.refillThreshold == this.refillThreshold &&
          other.vetClinic == this.vetClinic &&
          other.prescribingVet == this.prescribingVet &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<int> id;
  final Value<int> petId;
  final Value<String> name;
  final Value<String> dosage;
  final Value<String> form;
  final Value<String> frequencyType;
  final Value<int?> timesPerDay;
  final Value<int?> everyNHours;
  final Value<String?> specificWeekdays;
  final Value<String?> customCron;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<bool> withFood;
  final Value<String?> instructions;
  final Value<int?> remainingDoses;
  final Value<int?> refillThreshold;
  final Value<String?> vetClinic;
  final Value<String?> prescribingVet;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.name = const Value.absent(),
    this.dosage = const Value.absent(),
    this.form = const Value.absent(),
    this.frequencyType = const Value.absent(),
    this.timesPerDay = const Value.absent(),
    this.everyNHours = const Value.absent(),
    this.specificWeekdays = const Value.absent(),
    this.customCron = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.withFood = const Value.absent(),
    this.instructions = const Value.absent(),
    this.remainingDoses = const Value.absent(),
    this.refillThreshold = const Value.absent(),
    this.vetClinic = const Value.absent(),
    this.prescribingVet = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  MedicationsCompanion.insert({
    this.id = const Value.absent(),
    required int petId,
    required String name,
    required String dosage,
    required String form,
    required String frequencyType,
    this.timesPerDay = const Value.absent(),
    this.everyNHours = const Value.absent(),
    this.specificWeekdays = const Value.absent(),
    this.customCron = const Value.absent(),
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.withFood = const Value.absent(),
    this.instructions = const Value.absent(),
    this.remainingDoses = const Value.absent(),
    this.refillThreshold = const Value.absent(),
    this.vetClinic = const Value.absent(),
    this.prescribingVet = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : petId = Value(petId),
        name = Value(name),
        dosage = Value(dosage),
        form = Value(form),
        frequencyType = Value(frequencyType),
        startDate = Value(startDate);
  static Insertable<Medication> custom({
    Expression<int>? id,
    Expression<int>? petId,
    Expression<String>? name,
    Expression<String>? dosage,
    Expression<String>? form,
    Expression<String>? frequencyType,
    Expression<int>? timesPerDay,
    Expression<int>? everyNHours,
    Expression<String>? specificWeekdays,
    Expression<String>? customCron,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? withFood,
    Expression<String>? instructions,
    Expression<int>? remainingDoses,
    Expression<int>? refillThreshold,
    Expression<String>? vetClinic,
    Expression<String>? prescribingVet,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (name != null) 'name': name,
      if (dosage != null) 'dosage': dosage,
      if (form != null) 'form': form,
      if (frequencyType != null) 'frequency_type': frequencyType,
      if (timesPerDay != null) 'times_per_day': timesPerDay,
      if (everyNHours != null) 'every_n_hours': everyNHours,
      if (specificWeekdays != null) 'specific_weekdays': specificWeekdays,
      if (customCron != null) 'custom_cron': customCron,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (withFood != null) 'with_food': withFood,
      if (instructions != null) 'instructions': instructions,
      if (remainingDoses != null) 'remaining_doses': remainingDoses,
      if (refillThreshold != null) 'refill_threshold': refillThreshold,
      if (vetClinic != null) 'vet_clinic': vetClinic,
      if (prescribingVet != null) 'prescribing_vet': prescribingVet,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  MedicationsCompanion copyWith(
      {Value<int>? id,
      Value<int>? petId,
      Value<String>? name,
      Value<String>? dosage,
      Value<String>? form,
      Value<String>? frequencyType,
      Value<int?>? timesPerDay,
      Value<int?>? everyNHours,
      Value<String?>? specificWeekdays,
      Value<String?>? customCron,
      Value<DateTime>? startDate,
      Value<DateTime?>? endDate,
      Value<bool>? withFood,
      Value<String?>? instructions,
      Value<int?>? remainingDoses,
      Value<int?>? refillThreshold,
      Value<String?>? vetClinic,
      Value<String?>? prescribingVet,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return MedicationsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      form: form ?? this.form,
      frequencyType: frequencyType ?? this.frequencyType,
      timesPerDay: timesPerDay ?? this.timesPerDay,
      everyNHours: everyNHours ?? this.everyNHours,
      specificWeekdays: specificWeekdays ?? this.specificWeekdays,
      customCron: customCron ?? this.customCron,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      withFood: withFood ?? this.withFood,
      instructions: instructions ?? this.instructions,
      remainingDoses: remainingDoses ?? this.remainingDoses,
      refillThreshold: refillThreshold ?? this.refillThreshold,
      vetClinic: vetClinic ?? this.vetClinic,
      prescribingVet: prescribingVet ?? this.prescribingVet,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (form.present) {
      map['form'] = Variable<String>(form.value);
    }
    if (frequencyType.present) {
      map['frequency_type'] = Variable<String>(frequencyType.value);
    }
    if (timesPerDay.present) {
      map['times_per_day'] = Variable<int>(timesPerDay.value);
    }
    if (everyNHours.present) {
      map['every_n_hours'] = Variable<int>(everyNHours.value);
    }
    if (specificWeekdays.present) {
      map['specific_weekdays'] = Variable<String>(specificWeekdays.value);
    }
    if (customCron.present) {
      map['custom_cron'] = Variable<String>(customCron.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (withFood.present) {
      map['with_food'] = Variable<bool>(withFood.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (remainingDoses.present) {
      map['remaining_doses'] = Variable<int>(remainingDoses.value);
    }
    if (refillThreshold.present) {
      map['refill_threshold'] = Variable<int>(refillThreshold.value);
    }
    if (vetClinic.present) {
      map['vet_clinic'] = Variable<String>(vetClinic.value);
    }
    if (prescribingVet.present) {
      map['prescribing_vet'] = Variable<String>(prescribingVet.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('form: $form, ')
          ..write('frequencyType: $frequencyType, ')
          ..write('timesPerDay: $timesPerDay, ')
          ..write('everyNHours: $everyNHours, ')
          ..write('specificWeekdays: $specificWeekdays, ')
          ..write('customCron: $customCron, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('withFood: $withFood, ')
          ..write('instructions: $instructions, ')
          ..write('remainingDoses: $remainingDoses, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('vetClinic: $vetClinic, ')
          ..write('prescribingVet: $prescribingVet, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $DoseSchedulesTable extends DoseSchedules
    with TableInfo<$DoseSchedulesTable, DoseSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _medicationIdMeta =
      const VerificationMeta('medicationId');
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
      'medication_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES medications (id) ON DELETE CASCADE'));
  static const VerificationMeta _scheduledTimeMeta =
      const VerificationMeta('scheduledTime');
  @override
  late final GeneratedColumn<DateTime> scheduledTime =
      GeneratedColumn<DateTime>('scheduled_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isTakenMeta =
      const VerificationMeta('isTaken');
  @override
  late final GeneratedColumn<bool> isTaken = GeneratedColumn<bool>(
      'is_taken', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_taken" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isSkippedMeta =
      const VerificationMeta('isSkipped');
  @override
  late final GeneratedColumn<bool> isSkipped = GeneratedColumn<bool>(
      'is_skipped', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_skipped" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _takenAtMeta =
      const VerificationMeta('takenAt');
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
      'taken_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        medicationId,
        scheduledTime,
        isTaken,
        isSkipped,
        takenAt,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_schedules';
  @override
  VerificationContext validateIntegrity(Insertable<DoseSchedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medicationIdMeta,
          medicationId.isAcceptableOrUnknown(
              data['medication_id']!, _medicationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
          _scheduledTimeMeta,
          scheduledTime.isAcceptableOrUnknown(
              data['scheduled_time']!, _scheduledTimeMeta));
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('is_taken')) {
      context.handle(_isTakenMeta,
          isTaken.isAcceptableOrUnknown(data['is_taken']!, _isTakenMeta));
    }
    if (data.containsKey('is_skipped')) {
      context.handle(_isSkippedMeta,
          isSkipped.isAcceptableOrUnknown(data['is_skipped']!, _isSkippedMeta));
    }
    if (data.containsKey('taken_at')) {
      context.handle(_takenAtMeta,
          takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseSchedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      medicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}medication_id'])!,
      scheduledTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_time'])!,
      isTaken: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_taken'])!,
      isSkipped: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_skipped'])!,
      takenAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}taken_at']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DoseSchedulesTable createAlias(String alias) {
    return $DoseSchedulesTable(attachedDatabase, alias);
  }
}

class DoseSchedule extends DataClass implements Insertable<DoseSchedule> {
  final int id;
  final int medicationId;
  final DateTime scheduledTime;
  final bool isTaken;
  final bool isSkipped;
  final DateTime? takenAt;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DoseSchedule(
      {required this.id,
      required this.medicationId,
      required this.scheduledTime,
      required this.isTaken,
      required this.isSkipped,
      this.takenAt,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medication_id'] = Variable<int>(medicationId);
    map['scheduled_time'] = Variable<DateTime>(scheduledTime);
    map['is_taken'] = Variable<bool>(isTaken);
    map['is_skipped'] = Variable<bool>(isSkipped);
    if (!nullToAbsent || takenAt != null) {
      map['taken_at'] = Variable<DateTime>(takenAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DoseSchedulesCompanion toCompanion(bool nullToAbsent) {
    return DoseSchedulesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      scheduledTime: Value(scheduledTime),
      isTaken: Value(isTaken),
      isSkipped: Value(isSkipped),
      takenAt: takenAt == null && nullToAbsent
          ? const Value.absent()
          : Value(takenAt),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DoseSchedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseSchedule(
      id: serializer.fromJson<int>(json['id']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      scheduledTime: serializer.fromJson<DateTime>(json['scheduledTime']),
      isTaken: serializer.fromJson<bool>(json['isTaken']),
      isSkipped: serializer.fromJson<bool>(json['isSkipped']),
      takenAt: serializer.fromJson<DateTime?>(json['takenAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicationId': serializer.toJson<int>(medicationId),
      'scheduledTime': serializer.toJson<DateTime>(scheduledTime),
      'isTaken': serializer.toJson<bool>(isTaken),
      'isSkipped': serializer.toJson<bool>(isSkipped),
      'takenAt': serializer.toJson<DateTime?>(takenAt),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DoseSchedule copyWith(
          {int? id,
          int? medicationId,
          DateTime? scheduledTime,
          bool? isTaken,
          bool? isSkipped,
          Value<DateTime?> takenAt = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      DoseSchedule(
        id: id ?? this.id,
        medicationId: medicationId ?? this.medicationId,
        scheduledTime: scheduledTime ?? this.scheduledTime,
        isTaken: isTaken ?? this.isTaken,
        isSkipped: isSkipped ?? this.isSkipped,
        takenAt: takenAt.present ? takenAt.value : this.takenAt,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DoseSchedule copyWithCompanion(DoseSchedulesCompanion data) {
    return DoseSchedule(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      isTaken: data.isTaken.present ? data.isTaken.value : this.isTaken,
      isSkipped: data.isSkipped.present ? data.isSkipped.value : this.isSkipped,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseSchedule(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('isTaken: $isTaken, ')
          ..write('isSkipped: $isSkipped, ')
          ..write('takenAt: $takenAt, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicationId, scheduledTime, isTaken,
      isSkipped, takenAt, notes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseSchedule &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.scheduledTime == this.scheduledTime &&
          other.isTaken == this.isTaken &&
          other.isSkipped == this.isSkipped &&
          other.takenAt == this.takenAt &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DoseSchedulesCompanion extends UpdateCompanion<DoseSchedule> {
  final Value<int> id;
  final Value<int> medicationId;
  final Value<DateTime> scheduledTime;
  final Value<bool> isTaken;
  final Value<bool> isSkipped;
  final Value<DateTime?> takenAt;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DoseSchedulesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.isTaken = const Value.absent(),
    this.isSkipped = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DoseSchedulesCompanion.insert({
    this.id = const Value.absent(),
    required int medicationId,
    required DateTime scheduledTime,
    this.isTaken = const Value.absent(),
    this.isSkipped = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : medicationId = Value(medicationId),
        scheduledTime = Value(scheduledTime);
  static Insertable<DoseSchedule> custom({
    Expression<int>? id,
    Expression<int>? medicationId,
    Expression<DateTime>? scheduledTime,
    Expression<bool>? isTaken,
    Expression<bool>? isSkipped,
    Expression<DateTime>? takenAt,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (isTaken != null) 'is_taken': isTaken,
      if (isSkipped != null) 'is_skipped': isSkipped,
      if (takenAt != null) 'taken_at': takenAt,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DoseSchedulesCompanion copyWith(
      {Value<int>? id,
      Value<int>? medicationId,
      Value<DateTime>? scheduledTime,
      Value<bool>? isTaken,
      Value<bool>? isSkipped,
      Value<DateTime?>? takenAt,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return DoseSchedulesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      isTaken: isTaken ?? this.isTaken,
      isSkipped: isSkipped ?? this.isSkipped,
      takenAt: takenAt ?? this.takenAt,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<DateTime>(scheduledTime.value);
    }
    if (isTaken.present) {
      map['is_taken'] = Variable<bool>(isTaken.value);
    }
    if (isSkipped.present) {
      map['is_skipped'] = Variable<bool>(isSkipped.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseSchedulesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('isTaken: $isTaken, ')
          ..write('isSkipped: $isSkipped, ')
          ..write('takenAt: $takenAt, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DoseLogsTable extends DoseLogs with TableInfo<$DoseLogsTable, DoseLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _medicationIdMeta =
      const VerificationMeta('medicationId');
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
      'medication_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES medications (id) ON DELETE CASCADE'));
  static const VerificationMeta _doseScheduleIdMeta =
      const VerificationMeta('doseScheduleId');
  @override
  late final GeneratedColumn<int> doseScheduleId = GeneratedColumn<int>(
      'dose_schedule_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES dose_schedules (id) ON DELETE SET NULL'));
  static const VerificationMeta _scheduledTimeMeta =
      const VerificationMeta('scheduledTime');
  @override
  late final GeneratedColumn<DateTime> scheduledTime =
      GeneratedColumn<DateTime>('scheduled_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _actualTimeMeta =
      const VerificationMeta('actualTime');
  @override
  late final GeneratedColumn<DateTime> actualTime = GeneratedColumn<DateTime>(
      'actual_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _wasTakenMeta =
      const VerificationMeta('wasTaken');
  @override
  late final GeneratedColumn<bool> wasTaken = GeneratedColumn<bool>(
      'was_taken', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("was_taken" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _wasSkippedMeta =
      const VerificationMeta('wasSkipped');
  @override
  late final GeneratedColumn<bool> wasSkipped = GeneratedColumn<bool>(
      'was_skipped', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("was_skipped" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sideEffectsMeta =
      const VerificationMeta('sideEffects');
  @override
  late final GeneratedColumn<String> sideEffects = GeneratedColumn<String>(
      'side_effects', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
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
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_logs';
  @override
  VerificationContext validateIntegrity(Insertable<DoseLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medicationIdMeta,
          medicationId.isAcceptableOrUnknown(
              data['medication_id']!, _medicationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('dose_schedule_id')) {
      context.handle(
          _doseScheduleIdMeta,
          doseScheduleId.isAcceptableOrUnknown(
              data['dose_schedule_id']!, _doseScheduleIdMeta));
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
          _scheduledTimeMeta,
          scheduledTime.isAcceptableOrUnknown(
              data['scheduled_time']!, _scheduledTimeMeta));
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('actual_time')) {
      context.handle(
          _actualTimeMeta,
          actualTime.isAcceptableOrUnknown(
              data['actual_time']!, _actualTimeMeta));
    }
    if (data.containsKey('was_taken')) {
      context.handle(_wasTakenMeta,
          wasTaken.isAcceptableOrUnknown(data['was_taken']!, _wasTakenMeta));
    }
    if (data.containsKey('was_skipped')) {
      context.handle(
          _wasSkippedMeta,
          wasSkipped.isAcceptableOrUnknown(
              data['was_skipped']!, _wasSkippedMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('side_effects')) {
      context.handle(
          _sideEffectsMeta,
          sideEffects.isAcceptableOrUnknown(
              data['side_effects']!, _sideEffectsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      medicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}medication_id'])!,
      doseScheduleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dose_schedule_id']),
      scheduledTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_time'])!,
      actualTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}actual_time']),
      wasTaken: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}was_taken'])!,
      wasSkipped: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}was_skipped'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      sideEffects: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}side_effects']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DoseLogsTable createAlias(String alias) {
    return $DoseLogsTable(attachedDatabase, alias);
  }
}

class DoseLog extends DataClass implements Insertable<DoseLog> {
  final int id;
  final int medicationId;
  final int? doseScheduleId;
  final DateTime scheduledTime;
  final DateTime? actualTime;
  final bool wasTaken;
  final bool wasSkipped;
  final String? notes;
  final String? sideEffects;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DoseLog(
      {required this.id,
      required this.medicationId,
      this.doseScheduleId,
      required this.scheduledTime,
      this.actualTime,
      required this.wasTaken,
      required this.wasSkipped,
      this.notes,
      this.sideEffects,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medication_id'] = Variable<int>(medicationId);
    if (!nullToAbsent || doseScheduleId != null) {
      map['dose_schedule_id'] = Variable<int>(doseScheduleId);
    }
    map['scheduled_time'] = Variable<DateTime>(scheduledTime);
    if (!nullToAbsent || actualTime != null) {
      map['actual_time'] = Variable<DateTime>(actualTime);
    }
    map['was_taken'] = Variable<bool>(wasTaken);
    map['was_skipped'] = Variable<bool>(wasSkipped);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || sideEffects != null) {
      map['side_effects'] = Variable<String>(sideEffects);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DoseLogsCompanion toCompanion(bool nullToAbsent) {
    return DoseLogsCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      doseScheduleId: doseScheduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(doseScheduleId),
      scheduledTime: Value(scheduledTime),
      actualTime: actualTime == null && nullToAbsent
          ? const Value.absent()
          : Value(actualTime),
      wasTaken: Value(wasTaken),
      wasSkipped: Value(wasSkipped),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      sideEffects: sideEffects == null && nullToAbsent
          ? const Value.absent()
          : Value(sideEffects),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DoseLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseLog(
      id: serializer.fromJson<int>(json['id']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      doseScheduleId: serializer.fromJson<int?>(json['doseScheduleId']),
      scheduledTime: serializer.fromJson<DateTime>(json['scheduledTime']),
      actualTime: serializer.fromJson<DateTime?>(json['actualTime']),
      wasTaken: serializer.fromJson<bool>(json['wasTaken']),
      wasSkipped: serializer.fromJson<bool>(json['wasSkipped']),
      notes: serializer.fromJson<String?>(json['notes']),
      sideEffects: serializer.fromJson<String?>(json['sideEffects']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicationId': serializer.toJson<int>(medicationId),
      'doseScheduleId': serializer.toJson<int?>(doseScheduleId),
      'scheduledTime': serializer.toJson<DateTime>(scheduledTime),
      'actualTime': serializer.toJson<DateTime?>(actualTime),
      'wasTaken': serializer.toJson<bool>(wasTaken),
      'wasSkipped': serializer.toJson<bool>(wasSkipped),
      'notes': serializer.toJson<String?>(notes),
      'sideEffects': serializer.toJson<String?>(sideEffects),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DoseLog copyWith(
          {int? id,
          int? medicationId,
          Value<int?> doseScheduleId = const Value.absent(),
          DateTime? scheduledTime,
          Value<DateTime?> actualTime = const Value.absent(),
          bool? wasTaken,
          bool? wasSkipped,
          Value<String?> notes = const Value.absent(),
          Value<String?> sideEffects = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      DoseLog(
        id: id ?? this.id,
        medicationId: medicationId ?? this.medicationId,
        doseScheduleId:
            doseScheduleId.present ? doseScheduleId.value : this.doseScheduleId,
        scheduledTime: scheduledTime ?? this.scheduledTime,
        actualTime: actualTime.present ? actualTime.value : this.actualTime,
        wasTaken: wasTaken ?? this.wasTaken,
        wasSkipped: wasSkipped ?? this.wasSkipped,
        notes: notes.present ? notes.value : this.notes,
        sideEffects: sideEffects.present ? sideEffects.value : this.sideEffects,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DoseLog copyWithCompanion(DoseLogsCompanion data) {
    return DoseLog(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      doseScheduleId: data.doseScheduleId.present
          ? data.doseScheduleId.value
          : this.doseScheduleId,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      actualTime:
          data.actualTime.present ? data.actualTime.value : this.actualTime,
      wasTaken: data.wasTaken.present ? data.wasTaken.value : this.wasTaken,
      wasSkipped:
          data.wasSkipped.present ? data.wasSkipped.value : this.wasSkipped,
      notes: data.notes.present ? data.notes.value : this.notes,
      sideEffects:
          data.sideEffects.present ? data.sideEffects.value : this.sideEffects,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseLog(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('doseScheduleId: $doseScheduleId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('actualTime: $actualTime, ')
          ..write('wasTaken: $wasTaken, ')
          ..write('wasSkipped: $wasSkipped, ')
          ..write('notes: $notes, ')
          ..write('sideEffects: $sideEffects, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseLog &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.doseScheduleId == this.doseScheduleId &&
          other.scheduledTime == this.scheduledTime &&
          other.actualTime == this.actualTime &&
          other.wasTaken == this.wasTaken &&
          other.wasSkipped == this.wasSkipped &&
          other.notes == this.notes &&
          other.sideEffects == this.sideEffects &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DoseLogsCompanion extends UpdateCompanion<DoseLog> {
  final Value<int> id;
  final Value<int> medicationId;
  final Value<int?> doseScheduleId;
  final Value<DateTime> scheduledTime;
  final Value<DateTime?> actualTime;
  final Value<bool> wasTaken;
  final Value<bool> wasSkipped;
  final Value<String?> notes;
  final Value<String?> sideEffects;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DoseLogsCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.doseScheduleId = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.actualTime = const Value.absent(),
    this.wasTaken = const Value.absent(),
    this.wasSkipped = const Value.absent(),
    this.notes = const Value.absent(),
    this.sideEffects = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DoseLogsCompanion.insert({
    this.id = const Value.absent(),
    required int medicationId,
    this.doseScheduleId = const Value.absent(),
    required DateTime scheduledTime,
    this.actualTime = const Value.absent(),
    this.wasTaken = const Value.absent(),
    this.wasSkipped = const Value.absent(),
    this.notes = const Value.absent(),
    this.sideEffects = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : medicationId = Value(medicationId),
        scheduledTime = Value(scheduledTime);
  static Insertable<DoseLog> custom({
    Expression<int>? id,
    Expression<int>? medicationId,
    Expression<int>? doseScheduleId,
    Expression<DateTime>? scheduledTime,
    Expression<DateTime>? actualTime,
    Expression<bool>? wasTaken,
    Expression<bool>? wasSkipped,
    Expression<String>? notes,
    Expression<String>? sideEffects,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (doseScheduleId != null) 'dose_schedule_id': doseScheduleId,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (actualTime != null) 'actual_time': actualTime,
      if (wasTaken != null) 'was_taken': wasTaken,
      if (wasSkipped != null) 'was_skipped': wasSkipped,
      if (notes != null) 'notes': notes,
      if (sideEffects != null) 'side_effects': sideEffects,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DoseLogsCompanion copyWith(
      {Value<int>? id,
      Value<int>? medicationId,
      Value<int?>? doseScheduleId,
      Value<DateTime>? scheduledTime,
      Value<DateTime?>? actualTime,
      Value<bool>? wasTaken,
      Value<bool>? wasSkipped,
      Value<String?>? notes,
      Value<String?>? sideEffects,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return DoseLogsCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      doseScheduleId: doseScheduleId ?? this.doseScheduleId,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      actualTime: actualTime ?? this.actualTime,
      wasTaken: wasTaken ?? this.wasTaken,
      wasSkipped: wasSkipped ?? this.wasSkipped,
      notes: notes ?? this.notes,
      sideEffects: sideEffects ?? this.sideEffects,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (doseScheduleId.present) {
      map['dose_schedule_id'] = Variable<int>(doseScheduleId.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<DateTime>(scheduledTime.value);
    }
    if (actualTime.present) {
      map['actual_time'] = Variable<DateTime>(actualTime.value);
    }
    if (wasTaken.present) {
      map['was_taken'] = Variable<bool>(wasTaken.value);
    }
    if (wasSkipped.present) {
      map['was_skipped'] = Variable<bool>(wasSkipped.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (sideEffects.present) {
      map['side_effects'] = Variable<String>(sideEffects.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseLogsCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('doseScheduleId: $doseScheduleId, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('actualTime: $actualTime, ')
          ..write('wasTaken: $wasTaken, ')
          ..write('wasSkipped: $wasSkipped, ')
          ..write('notes: $notes, ')
          ..write('sideEffects: $sideEffects, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pets (id) ON DELETE CASCADE'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _scheduleRuleMeta =
      const VerificationMeta('scheduleRule');
  @override
  late final GeneratedColumn<String> scheduleRule = GeneratedColumn<String>(
      'schedule_rule', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nextTriggerAtMeta =
      const VerificationMeta('nextTriggerAt');
  @override
  late final GeneratedColumn<DateTime> nextTriggerAt =
      GeneratedColumn<DateTime>('next_trigger_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastTriggeredAtMeta =
      const VerificationMeta('lastTriggeredAt');
  @override
  late final GeneratedColumn<DateTime> lastTriggeredAt =
      GeneratedColumn<DateTime>('last_triggered_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _escalationCountMeta =
      const VerificationMeta('escalationCount');
  @override
  late final GeneratedColumn<int> escalationCount = GeneratedColumn<int>(
      'escalation_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxEscalationsMeta =
      const VerificationMeta('maxEscalations');
  @override
  late final GeneratedColumn<int> maxEscalations = GeneratedColumn<int>(
      'max_escalations', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(3));
  static const VerificationMeta _isEnabledMeta =
      const VerificationMeta('isEnabled');
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
      'is_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _notifyFamilyMeta =
      const VerificationMeta('notifyFamily');
  @override
  late final GeneratedColumn<bool> notifyFamily = GeneratedColumn<bool>(
      'notify_family', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notify_family" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        petId,
        type,
        title,
        description,
        scheduleRule,
        payload,
        nextTriggerAt,
        lastTriggeredAt,
        escalationCount,
        maxEscalations,
        isEnabled,
        notifyFamily,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(Insertable<Reminder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('schedule_rule')) {
      context.handle(
          _scheduleRuleMeta,
          scheduleRule.isAcceptableOrUnknown(
              data['schedule_rule']!, _scheduleRuleMeta));
    } else if (isInserting) {
      context.missing(_scheduleRuleMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    }
    if (data.containsKey('next_trigger_at')) {
      context.handle(
          _nextTriggerAtMeta,
          nextTriggerAt.isAcceptableOrUnknown(
              data['next_trigger_at']!, _nextTriggerAtMeta));
    } else if (isInserting) {
      context.missing(_nextTriggerAtMeta);
    }
    if (data.containsKey('last_triggered_at')) {
      context.handle(
          _lastTriggeredAtMeta,
          lastTriggeredAt.isAcceptableOrUnknown(
              data['last_triggered_at']!, _lastTriggeredAtMeta));
    }
    if (data.containsKey('escalation_count')) {
      context.handle(
          _escalationCountMeta,
          escalationCount.isAcceptableOrUnknown(
              data['escalation_count']!, _escalationCountMeta));
    }
    if (data.containsKey('max_escalations')) {
      context.handle(
          _maxEscalationsMeta,
          maxEscalations.isAcceptableOrUnknown(
              data['max_escalations']!, _maxEscalationsMeta));
    }
    if (data.containsKey('is_enabled')) {
      context.handle(_isEnabledMeta,
          isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta));
    }
    if (data.containsKey('notify_family')) {
      context.handle(
          _notifyFamilyMeta,
          notifyFamily.isAcceptableOrUnknown(
              data['notify_family']!, _notifyFamilyMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      scheduleRule: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}schedule_rule'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload']),
      nextTriggerAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_trigger_at'])!,
      lastTriggeredAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_triggered_at']),
      escalationCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}escalation_count'])!,
      maxEscalations: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_escalations'])!,
      isEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_enabled'])!,
      notifyFamily: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}notify_family'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final int id;
  final int userId;
  final int? petId;
  final String type;
  final String title;
  final String? description;
  final String scheduleRule;
  final String? payload;
  final DateTime nextTriggerAt;
  final DateTime? lastTriggeredAt;
  final int escalationCount;
  final int maxEscalations;
  final bool isEnabled;
  final bool notifyFamily;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Reminder(
      {required this.id,
      required this.userId,
      this.petId,
      required this.type,
      required this.title,
      this.description,
      required this.scheduleRule,
      this.payload,
      required this.nextTriggerAt,
      this.lastTriggeredAt,
      required this.escalationCount,
      required this.maxEscalations,
      required this.isEnabled,
      required this.notifyFamily,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<int>(petId);
    }
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['schedule_rule'] = Variable<String>(scheduleRule);
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    map['next_trigger_at'] = Variable<DateTime>(nextTriggerAt);
    if (!nullToAbsent || lastTriggeredAt != null) {
      map['last_triggered_at'] = Variable<DateTime>(lastTriggeredAt);
    }
    map['escalation_count'] = Variable<int>(escalationCount);
    map['max_escalations'] = Variable<int>(maxEscalations);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['notify_family'] = Variable<bool>(notifyFamily);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      userId: Value(userId),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      type: Value(type),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      scheduleRule: Value(scheduleRule),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      nextTriggerAt: Value(nextTriggerAt),
      lastTriggeredAt: lastTriggeredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTriggeredAt),
      escalationCount: Value(escalationCount),
      maxEscalations: Value(maxEscalations),
      isEnabled: Value(isEnabled),
      notifyFamily: Value(notifyFamily),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Reminder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      petId: serializer.fromJson<int?>(json['petId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      scheduleRule: serializer.fromJson<String>(json['scheduleRule']),
      payload: serializer.fromJson<String?>(json['payload']),
      nextTriggerAt: serializer.fromJson<DateTime>(json['nextTriggerAt']),
      lastTriggeredAt: serializer.fromJson<DateTime?>(json['lastTriggeredAt']),
      escalationCount: serializer.fromJson<int>(json['escalationCount']),
      maxEscalations: serializer.fromJson<int>(json['maxEscalations']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      notifyFamily: serializer.fromJson<bool>(json['notifyFamily']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'petId': serializer.toJson<int?>(petId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'scheduleRule': serializer.toJson<String>(scheduleRule),
      'payload': serializer.toJson<String?>(payload),
      'nextTriggerAt': serializer.toJson<DateTime>(nextTriggerAt),
      'lastTriggeredAt': serializer.toJson<DateTime?>(lastTriggeredAt),
      'escalationCount': serializer.toJson<int>(escalationCount),
      'maxEscalations': serializer.toJson<int>(maxEscalations),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'notifyFamily': serializer.toJson<bool>(notifyFamily),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Reminder copyWith(
          {int? id,
          int? userId,
          Value<int?> petId = const Value.absent(),
          String? type,
          String? title,
          Value<String?> description = const Value.absent(),
          String? scheduleRule,
          Value<String?> payload = const Value.absent(),
          DateTime? nextTriggerAt,
          Value<DateTime?> lastTriggeredAt = const Value.absent(),
          int? escalationCount,
          int? maxEscalations,
          bool? isEnabled,
          bool? notifyFamily,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Reminder(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        petId: petId.present ? petId.value : this.petId,
        type: type ?? this.type,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        scheduleRule: scheduleRule ?? this.scheduleRule,
        payload: payload.present ? payload.value : this.payload,
        nextTriggerAt: nextTriggerAt ?? this.nextTriggerAt,
        lastTriggeredAt: lastTriggeredAt.present
            ? lastTriggeredAt.value
            : this.lastTriggeredAt,
        escalationCount: escalationCount ?? this.escalationCount,
        maxEscalations: maxEscalations ?? this.maxEscalations,
        isEnabled: isEnabled ?? this.isEnabled,
        notifyFamily: notifyFamily ?? this.notifyFamily,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      petId: data.petId.present ? data.petId.value : this.petId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      scheduleRule: data.scheduleRule.present
          ? data.scheduleRule.value
          : this.scheduleRule,
      payload: data.payload.present ? data.payload.value : this.payload,
      nextTriggerAt: data.nextTriggerAt.present
          ? data.nextTriggerAt.value
          : this.nextTriggerAt,
      lastTriggeredAt: data.lastTriggeredAt.present
          ? data.lastTriggeredAt.value
          : this.lastTriggeredAt,
      escalationCount: data.escalationCount.present
          ? data.escalationCount.value
          : this.escalationCount,
      maxEscalations: data.maxEscalations.present
          ? data.maxEscalations.value
          : this.maxEscalations,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      notifyFamily: data.notifyFamily.present
          ? data.notifyFamily.value
          : this.notifyFamily,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('petId: $petId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduleRule: $scheduleRule, ')
          ..write('payload: $payload, ')
          ..write('nextTriggerAt: $nextTriggerAt, ')
          ..write('lastTriggeredAt: $lastTriggeredAt, ')
          ..write('escalationCount: $escalationCount, ')
          ..write('maxEscalations: $maxEscalations, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('notifyFamily: $notifyFamily, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      petId,
      type,
      title,
      description,
      scheduleRule,
      payload,
      nextTriggerAt,
      lastTriggeredAt,
      escalationCount,
      maxEscalations,
      isEnabled,
      notifyFamily,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.petId == this.petId &&
          other.type == this.type &&
          other.title == this.title &&
          other.description == this.description &&
          other.scheduleRule == this.scheduleRule &&
          other.payload == this.payload &&
          other.nextTriggerAt == this.nextTriggerAt &&
          other.lastTriggeredAt == this.lastTriggeredAt &&
          other.escalationCount == this.escalationCount &&
          other.maxEscalations == this.maxEscalations &&
          other.isEnabled == this.isEnabled &&
          other.notifyFamily == this.notifyFamily &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int?> petId;
  final Value<String> type;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> scheduleRule;
  final Value<String?> payload;
  final Value<DateTime> nextTriggerAt;
  final Value<DateTime?> lastTriggeredAt;
  final Value<int> escalationCount;
  final Value<int> maxEscalations;
  final Value<bool> isEnabled;
  final Value<bool> notifyFamily;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.petId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.scheduleRule = const Value.absent(),
    this.payload = const Value.absent(),
    this.nextTriggerAt = const Value.absent(),
    this.lastTriggeredAt = const Value.absent(),
    this.escalationCount = const Value.absent(),
    this.maxEscalations = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.notifyFamily = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  RemindersCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.petId = const Value.absent(),
    required String type,
    required String title,
    this.description = const Value.absent(),
    required String scheduleRule,
    this.payload = const Value.absent(),
    required DateTime nextTriggerAt,
    this.lastTriggeredAt = const Value.absent(),
    this.escalationCount = const Value.absent(),
    this.maxEscalations = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.notifyFamily = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : userId = Value(userId),
        type = Value(type),
        title = Value(title),
        scheduleRule = Value(scheduleRule),
        nextTriggerAt = Value(nextTriggerAt);
  static Insertable<Reminder> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? petId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? scheduleRule,
    Expression<String>? payload,
    Expression<DateTime>? nextTriggerAt,
    Expression<DateTime>? lastTriggeredAt,
    Expression<int>? escalationCount,
    Expression<int>? maxEscalations,
    Expression<bool>? isEnabled,
    Expression<bool>? notifyFamily,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (petId != null) 'pet_id': petId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (scheduleRule != null) 'schedule_rule': scheduleRule,
      if (payload != null) 'payload': payload,
      if (nextTriggerAt != null) 'next_trigger_at': nextTriggerAt,
      if (lastTriggeredAt != null) 'last_triggered_at': lastTriggeredAt,
      if (escalationCount != null) 'escalation_count': escalationCount,
      if (maxEscalations != null) 'max_escalations': maxEscalations,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (notifyFamily != null) 'notify_family': notifyFamily,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  RemindersCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int?>? petId,
      Value<String>? type,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? scheduleRule,
      Value<String?>? payload,
      Value<DateTime>? nextTriggerAt,
      Value<DateTime?>? lastTriggeredAt,
      Value<int>? escalationCount,
      Value<int>? maxEscalations,
      Value<bool>? isEnabled,
      Value<bool>? notifyFamily,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return RemindersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      petId: petId ?? this.petId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduleRule: scheduleRule ?? this.scheduleRule,
      payload: payload ?? this.payload,
      nextTriggerAt: nextTriggerAt ?? this.nextTriggerAt,
      lastTriggeredAt: lastTriggeredAt ?? this.lastTriggeredAt,
      escalationCount: escalationCount ?? this.escalationCount,
      maxEscalations: maxEscalations ?? this.maxEscalations,
      isEnabled: isEnabled ?? this.isEnabled,
      notifyFamily: notifyFamily ?? this.notifyFamily,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (scheduleRule.present) {
      map['schedule_rule'] = Variable<String>(scheduleRule.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (nextTriggerAt.present) {
      map['next_trigger_at'] = Variable<DateTime>(nextTriggerAt.value);
    }
    if (lastTriggeredAt.present) {
      map['last_triggered_at'] = Variable<DateTime>(lastTriggeredAt.value);
    }
    if (escalationCount.present) {
      map['escalation_count'] = Variable<int>(escalationCount.value);
    }
    if (maxEscalations.present) {
      map['max_escalations'] = Variable<int>(maxEscalations.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (notifyFamily.present) {
      map['notify_family'] = Variable<bool>(notifyFamily.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('petId: $petId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduleRule: $scheduleRule, ')
          ..write('payload: $payload, ')
          ..write('nextTriggerAt: $nextTriggerAt, ')
          ..write('lastTriggeredAt: $lastTriggeredAt, ')
          ..write('escalationCount: $escalationCount, ')
          ..write('maxEscalations: $maxEscalations, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('notifyFamily: $notifyFamily, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $AppointmentsTable extends Appointments
    with TableInfo<$AppointmentsTable, Appointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pets (id) ON DELETE CASCADE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clinicNameMeta =
      const VerificationMeta('clinicName');
  @override
  late final GeneratedColumn<String> clinicName = GeneratedColumn<String>(
      'clinic_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clinicAddressMeta =
      const VerificationMeta('clinicAddress');
  @override
  late final GeneratedColumn<String> clinicAddress = GeneratedColumn<String>(
      'clinic_address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clinicPhoneMeta =
      const VerificationMeta('clinicPhone');
  @override
  late final GeneratedColumn<String> clinicPhone = GeneratedColumn<String>(
      'clinic_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clinicWebsiteMeta =
      const VerificationMeta('clinicWebsite');
  @override
  late final GeneratedColumn<String> clinicWebsite = GeneratedColumn<String>(
      'clinic_website', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clinicLatitudeMeta =
      const VerificationMeta('clinicLatitude');
  @override
  late final GeneratedColumn<double> clinicLatitude = GeneratedColumn<double>(
      'clinic_latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _clinicLongitudeMeta =
      const VerificationMeta('clinicLongitude');
  @override
  late final GeneratedColumn<double> clinicLongitude = GeneratedColumn<double>(
      'clinic_longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _appointmentDateMeta =
      const VerificationMeta('appointmentDate');
  @override
  late final GeneratedColumn<DateTime> appointmentDate =
      GeneratedColumn<DateTime>('appointment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(30));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reminderSetMeta =
      const VerificationMeta('reminderSet');
  @override
  late final GeneratedColumn<bool> reminderSet = GeneratedColumn<bool>(
      'reminder_set', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("reminder_set" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _reminderTimeMeta =
      const VerificationMeta('reminderTime');
  @override
  late final GeneratedColumn<DateTime> reminderTime = GeneratedColumn<DateTime>(
      'reminder_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        petId,
        title,
        clinicName,
        clinicAddress,
        clinicPhone,
        clinicWebsite,
        clinicLatitude,
        clinicLongitude,
        appointmentDate,
        durationMinutes,
        type,
        notes,
        reminderSet,
        reminderTime,
        isCompleted,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointments';
  @override
  VerificationContext validateIntegrity(Insertable<Appointment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('clinic_name')) {
      context.handle(
          _clinicNameMeta,
          clinicName.isAcceptableOrUnknown(
              data['clinic_name']!, _clinicNameMeta));
    }
    if (data.containsKey('clinic_address')) {
      context.handle(
          _clinicAddressMeta,
          clinicAddress.isAcceptableOrUnknown(
              data['clinic_address']!, _clinicAddressMeta));
    }
    if (data.containsKey('clinic_phone')) {
      context.handle(
          _clinicPhoneMeta,
          clinicPhone.isAcceptableOrUnknown(
              data['clinic_phone']!, _clinicPhoneMeta));
    }
    if (data.containsKey('clinic_website')) {
      context.handle(
          _clinicWebsiteMeta,
          clinicWebsite.isAcceptableOrUnknown(
              data['clinic_website']!, _clinicWebsiteMeta));
    }
    if (data.containsKey('clinic_latitude')) {
      context.handle(
          _clinicLatitudeMeta,
          clinicLatitude.isAcceptableOrUnknown(
              data['clinic_latitude']!, _clinicLatitudeMeta));
    }
    if (data.containsKey('clinic_longitude')) {
      context.handle(
          _clinicLongitudeMeta,
          clinicLongitude.isAcceptableOrUnknown(
              data['clinic_longitude']!, _clinicLongitudeMeta));
    }
    if (data.containsKey('appointment_date')) {
      context.handle(
          _appointmentDateMeta,
          appointmentDate.isAcceptableOrUnknown(
              data['appointment_date']!, _appointmentDateMeta));
    } else if (isInserting) {
      context.missing(_appointmentDateMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('reminder_set')) {
      context.handle(
          _reminderSetMeta,
          reminderSet.isAcceptableOrUnknown(
              data['reminder_set']!, _reminderSetMeta));
    }
    if (data.containsKey('reminder_time')) {
      context.handle(
          _reminderTimeMeta,
          reminderTime.isAcceptableOrUnknown(
              data['reminder_time']!, _reminderTimeMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Appointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Appointment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      clinicName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clinic_name']),
      clinicAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clinic_address']),
      clinicPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clinic_phone']),
      clinicWebsite: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clinic_website']),
      clinicLatitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}clinic_latitude']),
      clinicLongitude: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}clinic_longitude']),
      appointmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}appointment_date'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      reminderSet: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}reminder_set'])!,
      reminderTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reminder_time']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $AppointmentsTable createAlias(String alias) {
    return $AppointmentsTable(attachedDatabase, alias);
  }
}

class Appointment extends DataClass implements Insertable<Appointment> {
  final int id;
  final int petId;
  final String title;
  final String? clinicName;
  final String? clinicAddress;
  final String? clinicPhone;
  final String? clinicWebsite;
  final double? clinicLatitude;
  final double? clinicLongitude;
  final DateTime appointmentDate;
  final int durationMinutes;
  final String? type;
  final String? notes;
  final bool reminderSet;
  final DateTime? reminderTime;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Appointment(
      {required this.id,
      required this.petId,
      required this.title,
      this.clinicName,
      this.clinicAddress,
      this.clinicPhone,
      this.clinicWebsite,
      this.clinicLatitude,
      this.clinicLongitude,
      required this.appointmentDate,
      required this.durationMinutes,
      this.type,
      this.notes,
      required this.reminderSet,
      this.reminderTime,
      required this.isCompleted,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pet_id'] = Variable<int>(petId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || clinicName != null) {
      map['clinic_name'] = Variable<String>(clinicName);
    }
    if (!nullToAbsent || clinicAddress != null) {
      map['clinic_address'] = Variable<String>(clinicAddress);
    }
    if (!nullToAbsent || clinicPhone != null) {
      map['clinic_phone'] = Variable<String>(clinicPhone);
    }
    if (!nullToAbsent || clinicWebsite != null) {
      map['clinic_website'] = Variable<String>(clinicWebsite);
    }
    if (!nullToAbsent || clinicLatitude != null) {
      map['clinic_latitude'] = Variable<double>(clinicLatitude);
    }
    if (!nullToAbsent || clinicLongitude != null) {
      map['clinic_longitude'] = Variable<double>(clinicLongitude);
    }
    map['appointment_date'] = Variable<DateTime>(appointmentDate);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['reminder_set'] = Variable<bool>(reminderSet);
    if (!nullToAbsent || reminderTime != null) {
      map['reminder_time'] = Variable<DateTime>(reminderTime);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AppointmentsCompanion toCompanion(bool nullToAbsent) {
    return AppointmentsCompanion(
      id: Value(id),
      petId: Value(petId),
      title: Value(title),
      clinicName: clinicName == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicName),
      clinicAddress: clinicAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicAddress),
      clinicPhone: clinicPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicPhone),
      clinicWebsite: clinicWebsite == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicWebsite),
      clinicLatitude: clinicLatitude == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicLatitude),
      clinicLongitude: clinicLongitude == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicLongitude),
      appointmentDate: Value(appointmentDate),
      durationMinutes: Value(durationMinutes),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      reminderSet: Value(reminderSet),
      reminderTime: reminderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTime),
      isCompleted: Value(isCompleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Appointment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Appointment(
      id: serializer.fromJson<int>(json['id']),
      petId: serializer.fromJson<int>(json['petId']),
      title: serializer.fromJson<String>(json['title']),
      clinicName: serializer.fromJson<String?>(json['clinicName']),
      clinicAddress: serializer.fromJson<String?>(json['clinicAddress']),
      clinicPhone: serializer.fromJson<String?>(json['clinicPhone']),
      clinicWebsite: serializer.fromJson<String?>(json['clinicWebsite']),
      clinicLatitude: serializer.fromJson<double?>(json['clinicLatitude']),
      clinicLongitude: serializer.fromJson<double?>(json['clinicLongitude']),
      appointmentDate: serializer.fromJson<DateTime>(json['appointmentDate']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      type: serializer.fromJson<String?>(json['type']),
      notes: serializer.fromJson<String?>(json['notes']),
      reminderSet: serializer.fromJson<bool>(json['reminderSet']),
      reminderTime: serializer.fromJson<DateTime?>(json['reminderTime']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'petId': serializer.toJson<int>(petId),
      'title': serializer.toJson<String>(title),
      'clinicName': serializer.toJson<String?>(clinicName),
      'clinicAddress': serializer.toJson<String?>(clinicAddress),
      'clinicPhone': serializer.toJson<String?>(clinicPhone),
      'clinicWebsite': serializer.toJson<String?>(clinicWebsite),
      'clinicLatitude': serializer.toJson<double?>(clinicLatitude),
      'clinicLongitude': serializer.toJson<double?>(clinicLongitude),
      'appointmentDate': serializer.toJson<DateTime>(appointmentDate),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'type': serializer.toJson<String?>(type),
      'notes': serializer.toJson<String?>(notes),
      'reminderSet': serializer.toJson<bool>(reminderSet),
      'reminderTime': serializer.toJson<DateTime?>(reminderTime),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Appointment copyWith(
          {int? id,
          int? petId,
          String? title,
          Value<String?> clinicName = const Value.absent(),
          Value<String?> clinicAddress = const Value.absent(),
          Value<String?> clinicPhone = const Value.absent(),
          Value<String?> clinicWebsite = const Value.absent(),
          Value<double?> clinicLatitude = const Value.absent(),
          Value<double?> clinicLongitude = const Value.absent(),
          DateTime? appointmentDate,
          int? durationMinutes,
          Value<String?> type = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? reminderSet,
          Value<DateTime?> reminderTime = const Value.absent(),
          bool? isCompleted,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Appointment(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        title: title ?? this.title,
        clinicName: clinicName.present ? clinicName.value : this.clinicName,
        clinicAddress:
            clinicAddress.present ? clinicAddress.value : this.clinicAddress,
        clinicPhone: clinicPhone.present ? clinicPhone.value : this.clinicPhone,
        clinicWebsite:
            clinicWebsite.present ? clinicWebsite.value : this.clinicWebsite,
        clinicLatitude:
            clinicLatitude.present ? clinicLatitude.value : this.clinicLatitude,
        clinicLongitude: clinicLongitude.present
            ? clinicLongitude.value
            : this.clinicLongitude,
        appointmentDate: appointmentDate ?? this.appointmentDate,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        type: type.present ? type.value : this.type,
        notes: notes.present ? notes.value : this.notes,
        reminderSet: reminderSet ?? this.reminderSet,
        reminderTime:
            reminderTime.present ? reminderTime.value : this.reminderTime,
        isCompleted: isCompleted ?? this.isCompleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Appointment copyWithCompanion(AppointmentsCompanion data) {
    return Appointment(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      title: data.title.present ? data.title.value : this.title,
      clinicName:
          data.clinicName.present ? data.clinicName.value : this.clinicName,
      clinicAddress: data.clinicAddress.present
          ? data.clinicAddress.value
          : this.clinicAddress,
      clinicPhone:
          data.clinicPhone.present ? data.clinicPhone.value : this.clinicPhone,
      clinicWebsite: data.clinicWebsite.present
          ? data.clinicWebsite.value
          : this.clinicWebsite,
      clinicLatitude: data.clinicLatitude.present
          ? data.clinicLatitude.value
          : this.clinicLatitude,
      clinicLongitude: data.clinicLongitude.present
          ? data.clinicLongitude.value
          : this.clinicLongitude,
      appointmentDate: data.appointmentDate.present
          ? data.appointmentDate.value
          : this.appointmentDate,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      type: data.type.present ? data.type.value : this.type,
      notes: data.notes.present ? data.notes.value : this.notes,
      reminderSet:
          data.reminderSet.present ? data.reminderSet.value : this.reminderSet,
      reminderTime: data.reminderTime.present
          ? data.reminderTime.value
          : this.reminderTime,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Appointment(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('clinicName: $clinicName, ')
          ..write('clinicAddress: $clinicAddress, ')
          ..write('clinicPhone: $clinicPhone, ')
          ..write('clinicWebsite: $clinicWebsite, ')
          ..write('clinicLatitude: $clinicLatitude, ')
          ..write('clinicLongitude: $clinicLongitude, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('type: $type, ')
          ..write('notes: $notes, ')
          ..write('reminderSet: $reminderSet, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      petId,
      title,
      clinicName,
      clinicAddress,
      clinicPhone,
      clinicWebsite,
      clinicLatitude,
      clinicLongitude,
      appointmentDate,
      durationMinutes,
      type,
      notes,
      reminderSet,
      reminderTime,
      isCompleted,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appointment &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.title == this.title &&
          other.clinicName == this.clinicName &&
          other.clinicAddress == this.clinicAddress &&
          other.clinicPhone == this.clinicPhone &&
          other.clinicWebsite == this.clinicWebsite &&
          other.clinicLatitude == this.clinicLatitude &&
          other.clinicLongitude == this.clinicLongitude &&
          other.appointmentDate == this.appointmentDate &&
          other.durationMinutes == this.durationMinutes &&
          other.type == this.type &&
          other.notes == this.notes &&
          other.reminderSet == this.reminderSet &&
          other.reminderTime == this.reminderTime &&
          other.isCompleted == this.isCompleted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class AppointmentsCompanion extends UpdateCompanion<Appointment> {
  final Value<int> id;
  final Value<int> petId;
  final Value<String> title;
  final Value<String?> clinicName;
  final Value<String?> clinicAddress;
  final Value<String?> clinicPhone;
  final Value<String?> clinicWebsite;
  final Value<double?> clinicLatitude;
  final Value<double?> clinicLongitude;
  final Value<DateTime> appointmentDate;
  final Value<int> durationMinutes;
  final Value<String?> type;
  final Value<String?> notes;
  final Value<bool> reminderSet;
  final Value<DateTime?> reminderTime;
  final Value<bool> isCompleted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const AppointmentsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.title = const Value.absent(),
    this.clinicName = const Value.absent(),
    this.clinicAddress = const Value.absent(),
    this.clinicPhone = const Value.absent(),
    this.clinicWebsite = const Value.absent(),
    this.clinicLatitude = const Value.absent(),
    this.clinicLongitude = const Value.absent(),
    this.appointmentDate = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.type = const Value.absent(),
    this.notes = const Value.absent(),
    this.reminderSet = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  AppointmentsCompanion.insert({
    this.id = const Value.absent(),
    required int petId,
    required String title,
    this.clinicName = const Value.absent(),
    this.clinicAddress = const Value.absent(),
    this.clinicPhone = const Value.absent(),
    this.clinicWebsite = const Value.absent(),
    this.clinicLatitude = const Value.absent(),
    this.clinicLongitude = const Value.absent(),
    required DateTime appointmentDate,
    this.durationMinutes = const Value.absent(),
    this.type = const Value.absent(),
    this.notes = const Value.absent(),
    this.reminderSet = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : petId = Value(petId),
        title = Value(title),
        appointmentDate = Value(appointmentDate);
  static Insertable<Appointment> custom({
    Expression<int>? id,
    Expression<int>? petId,
    Expression<String>? title,
    Expression<String>? clinicName,
    Expression<String>? clinicAddress,
    Expression<String>? clinicPhone,
    Expression<String>? clinicWebsite,
    Expression<double>? clinicLatitude,
    Expression<double>? clinicLongitude,
    Expression<DateTime>? appointmentDate,
    Expression<int>? durationMinutes,
    Expression<String>? type,
    Expression<String>? notes,
    Expression<bool>? reminderSet,
    Expression<DateTime>? reminderTime,
    Expression<bool>? isCompleted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (title != null) 'title': title,
      if (clinicName != null) 'clinic_name': clinicName,
      if (clinicAddress != null) 'clinic_address': clinicAddress,
      if (clinicPhone != null) 'clinic_phone': clinicPhone,
      if (clinicWebsite != null) 'clinic_website': clinicWebsite,
      if (clinicLatitude != null) 'clinic_latitude': clinicLatitude,
      if (clinicLongitude != null) 'clinic_longitude': clinicLongitude,
      if (appointmentDate != null) 'appointment_date': appointmentDate,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (type != null) 'type': type,
      if (notes != null) 'notes': notes,
      if (reminderSet != null) 'reminder_set': reminderSet,
      if (reminderTime != null) 'reminder_time': reminderTime,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  AppointmentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? petId,
      Value<String>? title,
      Value<String?>? clinicName,
      Value<String?>? clinicAddress,
      Value<String?>? clinicPhone,
      Value<String?>? clinicWebsite,
      Value<double?>? clinicLatitude,
      Value<double?>? clinicLongitude,
      Value<DateTime>? appointmentDate,
      Value<int>? durationMinutes,
      Value<String?>? type,
      Value<String?>? notes,
      Value<bool>? reminderSet,
      Value<DateTime?>? reminderTime,
      Value<bool>? isCompleted,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return AppointmentsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      title: title ?? this.title,
      clinicName: clinicName ?? this.clinicName,
      clinicAddress: clinicAddress ?? this.clinicAddress,
      clinicPhone: clinicPhone ?? this.clinicPhone,
      clinicWebsite: clinicWebsite ?? this.clinicWebsite,
      clinicLatitude: clinicLatitude ?? this.clinicLatitude,
      clinicLongitude: clinicLongitude ?? this.clinicLongitude,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      type: type ?? this.type,
      notes: notes ?? this.notes,
      reminderSet: reminderSet ?? this.reminderSet,
      reminderTime: reminderTime ?? this.reminderTime,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (clinicName.present) {
      map['clinic_name'] = Variable<String>(clinicName.value);
    }
    if (clinicAddress.present) {
      map['clinic_address'] = Variable<String>(clinicAddress.value);
    }
    if (clinicPhone.present) {
      map['clinic_phone'] = Variable<String>(clinicPhone.value);
    }
    if (clinicWebsite.present) {
      map['clinic_website'] = Variable<String>(clinicWebsite.value);
    }
    if (clinicLatitude.present) {
      map['clinic_latitude'] = Variable<double>(clinicLatitude.value);
    }
    if (clinicLongitude.present) {
      map['clinic_longitude'] = Variable<double>(clinicLongitude.value);
    }
    if (appointmentDate.present) {
      map['appointment_date'] = Variable<DateTime>(appointmentDate.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (reminderSet.present) {
      map['reminder_set'] = Variable<bool>(reminderSet.value);
    }
    if (reminderTime.present) {
      map['reminder_time'] = Variable<DateTime>(reminderTime.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('clinicName: $clinicName, ')
          ..write('clinicAddress: $clinicAddress, ')
          ..write('clinicPhone: $clinicPhone, ')
          ..write('clinicWebsite: $clinicWebsite, ')
          ..write('clinicLatitude: $clinicLatitude, ')
          ..write('clinicLongitude: $clinicLongitude, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('type: $type, ')
          ..write('notes: $notes, ')
          ..write('reminderSet: $reminderSet, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $WeightEntriesTable extends WeightEntries
    with TableInfo<$WeightEntriesTable, WeightEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pets (id) ON DELETE CASCADE'));
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('kg'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('manual'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        petId,
        weight,
        unit,
        date,
        notes,
        source,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WeightEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeightEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $WeightEntriesTable createAlias(String alias) {
    return $WeightEntriesTable(attachedDatabase, alias);
  }
}

class WeightEntry extends DataClass implements Insertable<WeightEntry> {
  final int id;
  final int petId;
  final double weight;
  final String unit;
  final DateTime date;
  final String? notes;
  final String source;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const WeightEntry(
      {required this.id,
      required this.petId,
      required this.weight,
      required this.unit,
      required this.date,
      this.notes,
      required this.source,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pet_id'] = Variable<int>(petId);
    map['weight'] = Variable<double>(weight);
    map['unit'] = Variable<String>(unit);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  WeightEntriesCompanion toCompanion(bool nullToAbsent) {
    return WeightEntriesCompanion(
      id: Value(id),
      petId: Value(petId),
      weight: Value(weight),
      unit: Value(unit),
      date: Value(date),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      source: Value(source),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory WeightEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightEntry(
      id: serializer.fromJson<int>(json['id']),
      petId: serializer.fromJson<int>(json['petId']),
      weight: serializer.fromJson<double>(json['weight']),
      unit: serializer.fromJson<String>(json['unit']),
      date: serializer.fromJson<DateTime>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'petId': serializer.toJson<int>(petId),
      'weight': serializer.toJson<double>(weight),
      'unit': serializer.toJson<String>(unit),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String?>(notes),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  WeightEntry copyWith(
          {int? id,
          int? petId,
          double? weight,
          String? unit,
          DateTime? date,
          Value<String?> notes = const Value.absent(),
          String? source,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      WeightEntry(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        weight: weight ?? this.weight,
        unit: unit ?? this.unit,
        date: date ?? this.date,
        notes: notes.present ? notes.value : this.notes,
        source: source ?? this.source,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  WeightEntry copyWithCompanion(WeightEntriesCompanion data) {
    return WeightEntry(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      weight: data.weight.present ? data.weight.value : this.weight,
      unit: data.unit.present ? data.unit.value : this.unit,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightEntry(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('weight: $weight, ')
          ..write('unit: $unit, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, petId, weight, unit, date, notes, source,
      createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightEntry &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.weight == this.weight &&
          other.unit == this.unit &&
          other.date == this.date &&
          other.notes == this.notes &&
          other.source == this.source &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class WeightEntriesCompanion extends UpdateCompanion<WeightEntry> {
  final Value<int> id;
  final Value<int> petId;
  final Value<double> weight;
  final Value<String> unit;
  final Value<DateTime> date;
  final Value<String?> notes;
  final Value<String> source;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const WeightEntriesCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.weight = const Value.absent(),
    this.unit = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  WeightEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int petId,
    required double weight,
    this.unit = const Value.absent(),
    required DateTime date,
    this.notes = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : petId = Value(petId),
        weight = Value(weight),
        date = Value(date);
  static Insertable<WeightEntry> custom({
    Expression<int>? id,
    Expression<int>? petId,
    Expression<double>? weight,
    Expression<String>? unit,
    Expression<DateTime>? date,
    Expression<String>? notes,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (weight != null) 'weight': weight,
      if (unit != null) 'unit': unit,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  WeightEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? petId,
      Value<double>? weight,
      Value<String>? unit,
      Value<DateTime>? date,
      Value<String?>? notes,
      Value<String>? source,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return WeightEntriesCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      weight: weight ?? this.weight,
      unit: unit ?? this.unit,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightEntriesCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('weight: $weight, ')
          ..write('unit: $unit, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pets (id) ON DELETE CASCADE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileUrlMeta =
      const VerificationMeta('fileUrl');
  @override
  late final GeneratedColumn<String> fileUrl = GeneratedColumn<String>(
      'file_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mimeTypeMeta =
      const VerificationMeta('mimeType');
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
      'mime_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileSizeMeta =
      const VerificationMeta('fileSize');
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
      'file_size', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _documentDateMeta =
      const VerificationMeta('documentDate');
  @override
  late final GeneratedColumn<DateTime> documentDate = GeneratedColumn<DateTime>(
      'document_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        petId,
        title,
        type,
        fileUrl,
        localPath,
        mimeType,
        fileSize,
        documentDate,
        tags,
        notes,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(Insertable<Document> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('file_url')) {
      context.handle(_fileUrlMeta,
          fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta));
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    }
    if (data.containsKey('mime_type')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta));
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta));
    }
    if (data.containsKey('document_date')) {
      context.handle(
          _documentDateMeta,
          documentDate.isAcceptableOrUnknown(
              data['document_date']!, _documentDateMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      fileUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_url']),
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path']),
      mimeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mime_type']),
      fileSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size']),
      documentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}document_date']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final int id;
  final int petId;
  final String title;
  final String type;
  final String? fileUrl;
  final String? localPath;
  final String? mimeType;
  final int? fileSize;
  final DateTime? documentDate;
  final String? tags;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Document(
      {required this.id,
      required this.petId,
      required this.title,
      required this.type,
      this.fileUrl,
      this.localPath,
      this.mimeType,
      this.fileSize,
      this.documentDate,
      this.tags,
      this.notes,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pet_id'] = Variable<int>(petId);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || fileUrl != null) {
      map['file_url'] = Variable<String>(fileUrl);
    }
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    if (!nullToAbsent || fileSize != null) {
      map['file_size'] = Variable<int>(fileSize);
    }
    if (!nullToAbsent || documentDate != null) {
      map['document_date'] = Variable<DateTime>(documentDate);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      id: Value(id),
      petId: Value(petId),
      title: Value(title),
      type: Value(type),
      fileUrl: fileUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(fileUrl),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      fileSize: fileSize == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSize),
      documentDate: documentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(documentDate),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Document.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      id: serializer.fromJson<int>(json['id']),
      petId: serializer.fromJson<int>(json['petId']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      fileUrl: serializer.fromJson<String?>(json['fileUrl']),
      localPath: serializer.fromJson<String?>(json['localPath']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
      fileSize: serializer.fromJson<int?>(json['fileSize']),
      documentDate: serializer.fromJson<DateTime?>(json['documentDate']),
      tags: serializer.fromJson<String?>(json['tags']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'petId': serializer.toJson<int>(petId),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'fileUrl': serializer.toJson<String?>(fileUrl),
      'localPath': serializer.toJson<String?>(localPath),
      'mimeType': serializer.toJson<String?>(mimeType),
      'fileSize': serializer.toJson<int?>(fileSize),
      'documentDate': serializer.toJson<DateTime?>(documentDate),
      'tags': serializer.toJson<String?>(tags),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Document copyWith(
          {int? id,
          int? petId,
          String? title,
          String? type,
          Value<String?> fileUrl = const Value.absent(),
          Value<String?> localPath = const Value.absent(),
          Value<String?> mimeType = const Value.absent(),
          Value<int?> fileSize = const Value.absent(),
          Value<DateTime?> documentDate = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Document(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        title: title ?? this.title,
        type: type ?? this.type,
        fileUrl: fileUrl.present ? fileUrl.value : this.fileUrl,
        localPath: localPath.present ? localPath.value : this.localPath,
        mimeType: mimeType.present ? mimeType.value : this.mimeType,
        fileSize: fileSize.present ? fileSize.value : this.fileSize,
        documentDate:
            documentDate.present ? documentDate.value : this.documentDate,
        tags: tags.present ? tags.value : this.tags,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      documentDate: data.documentDate.present
          ? data.documentDate.value
          : this.documentDate,
      tags: data.tags.present ? data.tags.value : this.tags,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('localPath: $localPath, ')
          ..write('mimeType: $mimeType, ')
          ..write('fileSize: $fileSize, ')
          ..write('documentDate: $documentDate, ')
          ..write('tags: $tags, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      petId,
      title,
      type,
      fileUrl,
      localPath,
      mimeType,
      fileSize,
      documentDate,
      tags,
      notes,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.title == this.title &&
          other.type == this.type &&
          other.fileUrl == this.fileUrl &&
          other.localPath == this.localPath &&
          other.mimeType == this.mimeType &&
          other.fileSize == this.fileSize &&
          other.documentDate == this.documentDate &&
          other.tags == this.tags &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> id;
  final Value<int> petId;
  final Value<String> title;
  final Value<String> type;
  final Value<String?> fileUrl;
  final Value<String?> localPath;
  final Value<String?> mimeType;
  final Value<int?> fileSize;
  final Value<DateTime?> documentDate;
  final Value<String?> tags;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const DocumentsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.localPath = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.documentDate = const Value.absent(),
    this.tags = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.id = const Value.absent(),
    required int petId,
    required String title,
    required String type,
    this.fileUrl = const Value.absent(),
    this.localPath = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.documentDate = const Value.absent(),
    this.tags = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : petId = Value(petId),
        title = Value(title),
        type = Value(type);
  static Insertable<Document> custom({
    Expression<int>? id,
    Expression<int>? petId,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? fileUrl,
    Expression<String>? localPath,
    Expression<String>? mimeType,
    Expression<int>? fileSize,
    Expression<DateTime>? documentDate,
    Expression<String>? tags,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (fileUrl != null) 'file_url': fileUrl,
      if (localPath != null) 'local_path': localPath,
      if (mimeType != null) 'mime_type': mimeType,
      if (fileSize != null) 'file_size': fileSize,
      if (documentDate != null) 'document_date': documentDate,
      if (tags != null) 'tags': tags,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  DocumentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? petId,
      Value<String>? title,
      Value<String>? type,
      Value<String?>? fileUrl,
      Value<String?>? localPath,
      Value<String?>? mimeType,
      Value<int?>? fileSize,
      Value<DateTime?>? documentDate,
      Value<String?>? tags,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return DocumentsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      title: title ?? this.title,
      type: type ?? this.type,
      fileUrl: fileUrl ?? this.fileUrl,
      localPath: localPath ?? this.localPath,
      mimeType: mimeType ?? this.mimeType,
      fileSize: fileSize ?? this.fileSize,
      documentDate: documentDate ?? this.documentDate,
      tags: tags ?? this.tags,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (documentDate.present) {
      map['document_date'] = Variable<DateTime>(documentDate.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('localPath: $localPath, ')
          ..write('mimeType: $mimeType, ')
          ..write('fileSize: $fileSize, ')
          ..write('documentDate: $documentDate, ')
          ..write('tags: $tags, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $FamilyMembersTable extends FamilyMembers
    with TableInfo<$FamilyMembersTable, FamilyMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamilyMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<int> petId = GeneratedColumn<int>(
      'pet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pets (id) ON DELETE CASCADE'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('viewer'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _invitedByMeta =
      const VerificationMeta('invitedBy');
  @override
  late final GeneratedColumn<String> invitedBy = GeneratedColumn<String>(
      'invited_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invitedAtMeta =
      const VerificationMeta('invitedAt');
  @override
  late final GeneratedColumn<DateTime> invitedAt = GeneratedColumn<DateTime>(
      'invited_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _respondedAtMeta =
      const VerificationMeta('respondedAt');
  @override
  late final GeneratedColumn<DateTime> respondedAt = GeneratedColumn<DateTime>(
      'responded_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        petId,
        userId,
        email,
        name,
        role,
        status,
        invitedBy,
        invitedAt,
        respondedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'family_members';
  @override
  VerificationContext validateIntegrity(Insertable<FamilyMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pet_id')) {
      context.handle(
          _petIdMeta, petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta));
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('invited_by')) {
      context.handle(_invitedByMeta,
          invitedBy.isAcceptableOrUnknown(data['invited_by']!, _invitedByMeta));
    } else if (isInserting) {
      context.missing(_invitedByMeta);
    }
    if (data.containsKey('invited_at')) {
      context.handle(_invitedAtMeta,
          invitedAt.isAcceptableOrUnknown(data['invited_at']!, _invitedAtMeta));
    }
    if (data.containsKey('responded_at')) {
      context.handle(
          _respondedAtMeta,
          respondedAt.isAcceptableOrUnknown(
              data['responded_at']!, _respondedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FamilyMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FamilyMember(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      petId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pet_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      invitedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invited_by'])!,
      invitedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}invited_at'])!,
      respondedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}responded_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FamilyMembersTable createAlias(String alias) {
    return $FamilyMembersTable(attachedDatabase, alias);
  }
}

class FamilyMember extends DataClass implements Insertable<FamilyMember> {
  final int id;
  final int petId;
  final int? userId;
  final String email;
  final String? name;
  final String role;
  final String status;
  final String invitedBy;
  final DateTime invitedAt;
  final DateTime? respondedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const FamilyMember(
      {required this.id,
      required this.petId,
      this.userId,
      required this.email,
      this.name,
      required this.role,
      required this.status,
      required this.invitedBy,
      required this.invitedAt,
      this.respondedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pet_id'] = Variable<int>(petId);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['role'] = Variable<String>(role);
    map['status'] = Variable<String>(status);
    map['invited_by'] = Variable<String>(invitedBy);
    map['invited_at'] = Variable<DateTime>(invitedAt);
    if (!nullToAbsent || respondedAt != null) {
      map['responded_at'] = Variable<DateTime>(respondedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FamilyMembersCompanion toCompanion(bool nullToAbsent) {
    return FamilyMembersCompanion(
      id: Value(id),
      petId: Value(petId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      email: Value(email),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      role: Value(role),
      status: Value(status),
      invitedBy: Value(invitedBy),
      invitedAt: Value(invitedAt),
      respondedAt: respondedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(respondedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory FamilyMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FamilyMember(
      id: serializer.fromJson<int>(json['id']),
      petId: serializer.fromJson<int>(json['petId']),
      userId: serializer.fromJson<int?>(json['userId']),
      email: serializer.fromJson<String>(json['email']),
      name: serializer.fromJson<String?>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      status: serializer.fromJson<String>(json['status']),
      invitedBy: serializer.fromJson<String>(json['invitedBy']),
      invitedAt: serializer.fromJson<DateTime>(json['invitedAt']),
      respondedAt: serializer.fromJson<DateTime?>(json['respondedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'petId': serializer.toJson<int>(petId),
      'userId': serializer.toJson<int?>(userId),
      'email': serializer.toJson<String>(email),
      'name': serializer.toJson<String?>(name),
      'role': serializer.toJson<String>(role),
      'status': serializer.toJson<String>(status),
      'invitedBy': serializer.toJson<String>(invitedBy),
      'invitedAt': serializer.toJson<DateTime>(invitedAt),
      'respondedAt': serializer.toJson<DateTime?>(respondedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FamilyMember copyWith(
          {int? id,
          int? petId,
          Value<int?> userId = const Value.absent(),
          String? email,
          Value<String?> name = const Value.absent(),
          String? role,
          String? status,
          String? invitedBy,
          DateTime? invitedAt,
          Value<DateTime?> respondedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      FamilyMember(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        userId: userId.present ? userId.value : this.userId,
        email: email ?? this.email,
        name: name.present ? name.value : this.name,
        role: role ?? this.role,
        status: status ?? this.status,
        invitedBy: invitedBy ?? this.invitedBy,
        invitedAt: invitedAt ?? this.invitedAt,
        respondedAt: respondedAt.present ? respondedAt.value : this.respondedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  FamilyMember copyWithCompanion(FamilyMembersCompanion data) {
    return FamilyMember(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      userId: data.userId.present ? data.userId.value : this.userId,
      email: data.email.present ? data.email.value : this.email,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      status: data.status.present ? data.status.value : this.status,
      invitedBy: data.invitedBy.present ? data.invitedBy.value : this.invitedBy,
      invitedAt: data.invitedAt.present ? data.invitedAt.value : this.invitedAt,
      respondedAt:
          data.respondedAt.present ? data.respondedAt.value : this.respondedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FamilyMember(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('status: $status, ')
          ..write('invitedBy: $invitedBy, ')
          ..write('invitedAt: $invitedAt, ')
          ..write('respondedAt: $respondedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, petId, userId, email, name, role, status,
      invitedBy, invitedAt, respondedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FamilyMember &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.userId == this.userId &&
          other.email == this.email &&
          other.name == this.name &&
          other.role == this.role &&
          other.status == this.status &&
          other.invitedBy == this.invitedBy &&
          other.invitedAt == this.invitedAt &&
          other.respondedAt == this.respondedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FamilyMembersCompanion extends UpdateCompanion<FamilyMember> {
  final Value<int> id;
  final Value<int> petId;
  final Value<int?> userId;
  final Value<String> email;
  final Value<String?> name;
  final Value<String> role;
  final Value<String> status;
  final Value<String> invitedBy;
  final Value<DateTime> invitedAt;
  final Value<DateTime?> respondedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const FamilyMembersCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.userId = const Value.absent(),
    this.email = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.status = const Value.absent(),
    this.invitedBy = const Value.absent(),
    this.invitedAt = const Value.absent(),
    this.respondedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FamilyMembersCompanion.insert({
    this.id = const Value.absent(),
    required int petId,
    this.userId = const Value.absent(),
    required String email,
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.status = const Value.absent(),
    required String invitedBy,
    this.invitedAt = const Value.absent(),
    this.respondedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : petId = Value(petId),
        email = Value(email),
        invitedBy = Value(invitedBy);
  static Insertable<FamilyMember> custom({
    Expression<int>? id,
    Expression<int>? petId,
    Expression<int>? userId,
    Expression<String>? email,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? status,
    Expression<String>? invitedBy,
    Expression<DateTime>? invitedAt,
    Expression<DateTime>? respondedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (userId != null) 'user_id': userId,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (status != null) 'status': status,
      if (invitedBy != null) 'invited_by': invitedBy,
      if (invitedAt != null) 'invited_at': invitedAt,
      if (respondedAt != null) 'responded_at': respondedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FamilyMembersCompanion copyWith(
      {Value<int>? id,
      Value<int>? petId,
      Value<int?>? userId,
      Value<String>? email,
      Value<String?>? name,
      Value<String>? role,
      Value<String>? status,
      Value<String>? invitedBy,
      Value<DateTime>? invitedAt,
      Value<DateTime?>? respondedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return FamilyMembersCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      status: status ?? this.status,
      invitedBy: invitedBy ?? this.invitedBy,
      invitedAt: invitedAt ?? this.invitedAt,
      respondedAt: respondedAt ?? this.respondedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<int>(petId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (invitedBy.present) {
      map['invited_by'] = Variable<String>(invitedBy.value);
    }
    if (invitedAt.present) {
      map['invited_at'] = Variable<DateTime>(invitedAt.value);
    }
    if (respondedAt.present) {
      map['responded_at'] = Variable<DateTime>(respondedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilyMembersCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('userId: $userId, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('status: $status, ')
          ..write('invitedBy: $invitedBy, ')
          ..write('invitedAt: $invitedAt, ')
          ..write('respondedAt: $respondedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ServiceConfigsTable extends ServiceConfigs
    with TableInfo<$ServiceConfigsTable, ServiceConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serviceIdMeta =
      const VerificationMeta('serviceId');
  @override
  late final GeneratedColumn<String> serviceId = GeneratedColumn<String>(
      'service_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
      'route', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isEnabledMeta =
      const VerificationMeta('isEnabled');
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
      'is_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _settingsSchemaMeta =
      const VerificationMeta('settingsSchema');
  @override
  late final GeneratedColumn<String> settingsSchema = GeneratedColumn<String>(
      'settings_schema', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reminderTypesMeta =
      const VerificationMeta('reminderTypes');
  @override
  late final GeneratedColumn<String> reminderTypes = GeneratedColumn<String>(
      'reminder_types', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        serviceId,
        name,
        description,
        iconName,
        route,
        isEnabled,
        settingsSchema,
        reminderTypes,
        sortOrder,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_configs';
  @override
  VerificationContext validateIntegrity(Insertable<ServiceConfig> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    }
    if (data.containsKey('route')) {
      context.handle(
          _routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));
    }
    if (data.containsKey('is_enabled')) {
      context.handle(_isEnabledMeta,
          isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta));
    }
    if (data.containsKey('settings_schema')) {
      context.handle(
          _settingsSchemaMeta,
          settingsSchema.isAcceptableOrUnknown(
              data['settings_schema']!, _settingsSchemaMeta));
    }
    if (data.containsKey('reminder_types')) {
      context.handle(
          _reminderTypesMeta,
          reminderTypes.isAcceptableOrUnknown(
              data['reminder_types']!, _reminderTypesMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceConfig(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name']),
      route: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route']),
      isEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_enabled'])!,
      settingsSchema: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings_schema']),
      reminderTypes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder_types']),
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ServiceConfigsTable createAlias(String alias) {
    return $ServiceConfigsTable(attachedDatabase, alias);
  }
}

class ServiceConfig extends DataClass implements Insertable<ServiceConfig> {
  final int id;
  final String serviceId;
  final String name;
  final String? description;
  final String? iconName;
  final String? route;
  final bool isEnabled;
  final String? settingsSchema;
  final String? reminderTypes;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ServiceConfig(
      {required this.id,
      required this.serviceId,
      required this.name,
      this.description,
      this.iconName,
      this.route,
      required this.isEnabled,
      this.settingsSchema,
      this.reminderTypes,
      required this.sortOrder,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['service_id'] = Variable<String>(serviceId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || iconName != null) {
      map['icon_name'] = Variable<String>(iconName);
    }
    if (!nullToAbsent || route != null) {
      map['route'] = Variable<String>(route);
    }
    map['is_enabled'] = Variable<bool>(isEnabled);
    if (!nullToAbsent || settingsSchema != null) {
      map['settings_schema'] = Variable<String>(settingsSchema);
    }
    if (!nullToAbsent || reminderTypes != null) {
      map['reminder_types'] = Variable<String>(reminderTypes);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ServiceConfigsCompanion toCompanion(bool nullToAbsent) {
    return ServiceConfigsCompanion(
      id: Value(id),
      serviceId: Value(serviceId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      iconName: iconName == null && nullToAbsent
          ? const Value.absent()
          : Value(iconName),
      route:
          route == null && nullToAbsent ? const Value.absent() : Value(route),
      isEnabled: Value(isEnabled),
      settingsSchema: settingsSchema == null && nullToAbsent
          ? const Value.absent()
          : Value(settingsSchema),
      reminderTypes: reminderTypes == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTypes),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ServiceConfig.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceConfig(
      id: serializer.fromJson<int>(json['id']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      iconName: serializer.fromJson<String?>(json['iconName']),
      route: serializer.fromJson<String?>(json['route']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      settingsSchema: serializer.fromJson<String?>(json['settingsSchema']),
      reminderTypes: serializer.fromJson<String?>(json['reminderTypes']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceId': serializer.toJson<String>(serviceId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'iconName': serializer.toJson<String?>(iconName),
      'route': serializer.toJson<String?>(route),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'settingsSchema': serializer.toJson<String?>(settingsSchema),
      'reminderTypes': serializer.toJson<String?>(reminderTypes),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ServiceConfig copyWith(
          {int? id,
          String? serviceId,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> iconName = const Value.absent(),
          Value<String?> route = const Value.absent(),
          bool? isEnabled,
          Value<String?> settingsSchema = const Value.absent(),
          Value<String?> reminderTypes = const Value.absent(),
          int? sortOrder,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ServiceConfig(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        iconName: iconName.present ? iconName.value : this.iconName,
        route: route.present ? route.value : this.route,
        isEnabled: isEnabled ?? this.isEnabled,
        settingsSchema:
            settingsSchema.present ? settingsSchema.value : this.settingsSchema,
        reminderTypes:
            reminderTypes.present ? reminderTypes.value : this.reminderTypes,
        sortOrder: sortOrder ?? this.sortOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ServiceConfig copyWithCompanion(ServiceConfigsCompanion data) {
    return ServiceConfig(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      route: data.route.present ? data.route.value : this.route,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      settingsSchema: data.settingsSchema.present
          ? data.settingsSchema.value
          : this.settingsSchema,
      reminderTypes: data.reminderTypes.present
          ? data.reminderTypes.value
          : this.reminderTypes,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceConfig(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('route: $route, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('settingsSchema: $settingsSchema, ')
          ..write('reminderTypes: $reminderTypes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      serviceId,
      name,
      description,
      iconName,
      route,
      isEnabled,
      settingsSchema,
      reminderTypes,
      sortOrder,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceConfig &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.name == this.name &&
          other.description == this.description &&
          other.iconName == this.iconName &&
          other.route == this.route &&
          other.isEnabled == this.isEnabled &&
          other.settingsSchema == this.settingsSchema &&
          other.reminderTypes == this.reminderTypes &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ServiceConfigsCompanion extends UpdateCompanion<ServiceConfig> {
  final Value<int> id;
  final Value<String> serviceId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> iconName;
  final Value<String?> route;
  final Value<bool> isEnabled;
  final Value<String?> settingsSchema;
  final Value<String?> reminderTypes;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ServiceConfigsCompanion({
    this.id = const Value.absent(),
    this.serviceId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iconName = const Value.absent(),
    this.route = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.settingsSchema = const Value.absent(),
    this.reminderTypes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ServiceConfigsCompanion.insert({
    this.id = const Value.absent(),
    required String serviceId,
    required String name,
    this.description = const Value.absent(),
    this.iconName = const Value.absent(),
    this.route = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.settingsSchema = const Value.absent(),
    this.reminderTypes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : serviceId = Value(serviceId),
        name = Value(name);
  static Insertable<ServiceConfig> custom({
    Expression<int>? id,
    Expression<String>? serviceId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? iconName,
    Expression<String>? route,
    Expression<bool>? isEnabled,
    Expression<String>? settingsSchema,
    Expression<String>? reminderTypes,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconName != null) 'icon_name': iconName,
      if (route != null) 'route': route,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (settingsSchema != null) 'settings_schema': settingsSchema,
      if (reminderTypes != null) 'reminder_types': reminderTypes,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ServiceConfigsCompanion copyWith(
      {Value<int>? id,
      Value<String>? serviceId,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? iconName,
      Value<String?>? route,
      Value<bool>? isEnabled,
      Value<String?>? settingsSchema,
      Value<String?>? reminderTypes,
      Value<int>? sortOrder,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ServiceConfigsCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      name: name ?? this.name,
      description: description ?? this.description,
      iconName: iconName ?? this.iconName,
      route: route ?? this.route,
      isEnabled: isEnabled ?? this.isEnabled,
      settingsSchema: settingsSchema ?? this.settingsSchema,
      reminderTypes: reminderTypes ?? this.reminderTypes,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = Variable<String>(serviceId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (settingsSchema.present) {
      map['settings_schema'] = Variable<String>(settingsSchema.value);
    }
    if (reminderTypes.present) {
      map['reminder_types'] = Variable<String>(reminderTypes.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceConfigsCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('route: $route, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('settingsSchema: $settingsSchema, ')
          ..write('reminderTypes: $reminderTypes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $PetsTable pets = $PetsTable(this);
  late final $VaccinesTable vaccines = $VaccinesTable(this);
  late final $VaccinationRecordsTable vaccinationRecords =
      $VaccinationRecordsTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $DoseSchedulesTable doseSchedules = $DoseSchedulesTable(this);
  late final $DoseLogsTable doseLogs = $DoseLogsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $AppointmentsTable appointments = $AppointmentsTable(this);
  late final $WeightEntriesTable weightEntries = $WeightEntriesTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $FamilyMembersTable familyMembers = $FamilyMembersTable(this);
  late final $ServiceConfigsTable serviceConfigs = $ServiceConfigsTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final PetDao petDao = PetDao(this as AppDatabase);
  late final VaccineDao vaccineDao = VaccineDao(this as AppDatabase);
  late final VaccinationRecordDao vaccinationRecordDao =
      VaccinationRecordDao(this as AppDatabase);
  late final MedicationDao medicationDao = MedicationDao(this as AppDatabase);
  late final DoseScheduleDao doseScheduleDao =
      DoseScheduleDao(this as AppDatabase);
  late final DoseLogDao doseLogDao = DoseLogDao(this as AppDatabase);
  late final ReminderDao reminderDao = ReminderDao(this as AppDatabase);
  late final AppointmentDao appointmentDao =
      AppointmentDao(this as AppDatabase);
  late final WeightEntryDao weightEntryDao =
      WeightEntryDao(this as AppDatabase);
  late final DocumentDao documentDao = DocumentDao(this as AppDatabase);
  late final FamilyMemberDao familyMemberDao =
      FamilyMemberDao(this as AppDatabase);
  late final ServiceConfigDao serviceConfigDao =
      ServiceConfigDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        pets,
        vaccines,
        vaccinationRecords,
        medications,
        doseSchedules,
        doseLogs,
        reminders,
        appointments,
        weightEntries,
        documents,
        familyMembers,
        serviceConfigs
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('pets', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pets',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('vaccination_records', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pets',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('medications', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('medications',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('dose_schedules', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('medications',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('dose_logs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('dose_schedules',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('dose_logs', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('reminders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pets',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('reminders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pets',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('appointments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pets',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('weight_entries', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pets',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('documents', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('pets',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('family_members', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('family_members', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String firebaseUid,
  required String email,
  Value<String?> displayName,
  Value<String?> photoUrl,
  Value<String> preferredLanguage,
  Value<String> units,
  Value<bool> darkMode,
  Value<bool> notificationsEnabled,
  Value<DateTime?> quietHoursStart,
  Value<DateTime?> quietHoursEnd,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> firebaseUid,
  Value<String> email,
  Value<String?> displayName,
  Value<String?> photoUrl,
  Value<String> preferredLanguage,
  Value<String> units,
  Value<bool> darkMode,
  Value<bool> notificationsEnabled,
  Value<DateTime?> quietHoursStart,
  Value<DateTime?> quietHoursEnd,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PetsTable, List<Pet>> _petsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.pets,
          aliasName: $_aliasNameGenerator(db.users.id, db.pets.userId));

  $$PetsTableProcessedTableManager get petsRefs {
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_petsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RemindersTable, List<Reminder>>
      _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.reminders,
          aliasName: $_aliasNameGenerator(db.users.id, db.reminders.userId));

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager($_db, $_db.reminders)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FamilyMembersTable, List<FamilyMember>>
      _familyMembersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.familyMembers,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.familyMembers.userId));

  $$FamilyMembersTableProcessedTableManager get familyMembersRefs {
    final manager = $$FamilyMembersTableTableManager($_db, $_db.familyMembers)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_familyMembersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firebaseUid => $composableBuilder(
      column: $table.firebaseUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferredLanguage => $composableBuilder(
      column: $table.preferredLanguage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get darkMode => $composableBuilder(
      column: $table.darkMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get quietHoursStart => $composableBuilder(
      column: $table.quietHoursStart,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get quietHoursEnd => $composableBuilder(
      column: $table.quietHoursEnd, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> petsRefs(
      Expression<bool> Function($$PetsTableFilterComposer f) f) {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> remindersRefs(
      Expression<bool> Function($$RemindersTableFilterComposer f) f) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reminders,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RemindersTableFilterComposer(
              $db: $db,
              $table: $db.reminders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> familyMembersRefs(
      Expression<bool> Function($$FamilyMembersTableFilterComposer f) f) {
    final $$FamilyMembersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.familyMembers,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FamilyMembersTableFilterComposer(
              $db: $db,
              $table: $db.familyMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firebaseUid => $composableBuilder(
      column: $table.firebaseUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferredLanguage => $composableBuilder(
      column: $table.preferredLanguage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get darkMode => $composableBuilder(
      column: $table.darkMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get quietHoursStart => $composableBuilder(
      column: $table.quietHoursStart,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get quietHoursEnd => $composableBuilder(
      column: $table.quietHoursEnd,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firebaseUid => $composableBuilder(
      column: $table.firebaseUid, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<String> get preferredLanguage => $composableBuilder(
      column: $table.preferredLanguage, builder: (column) => column);

  GeneratedColumn<String> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<bool> get darkMode =>
      $composableBuilder(column: $table.darkMode, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get quietHoursStart => $composableBuilder(
      column: $table.quietHoursStart, builder: (column) => column);

  GeneratedColumn<DateTime> get quietHoursEnd => $composableBuilder(
      column: $table.quietHoursEnd, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> petsRefs<T extends Object>(
      Expression<T> Function($$PetsTableAnnotationComposer a) f) {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> remindersRefs<T extends Object>(
      Expression<T> Function($$RemindersTableAnnotationComposer a) f) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reminders,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RemindersTableAnnotationComposer(
              $db: $db,
              $table: $db.reminders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> familyMembersRefs<T extends Object>(
      Expression<T> Function($$FamilyMembersTableAnnotationComposer a) f) {
    final $$FamilyMembersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.familyMembers,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FamilyMembersTableAnnotationComposer(
              $db: $db,
              $table: $db.familyMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function(
        {bool petsRefs, bool remindersRefs, bool familyMembersRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firebaseUid = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String?> displayName = const Value.absent(),
            Value<String?> photoUrl = const Value.absent(),
            Value<String> preferredLanguage = const Value.absent(),
            Value<String> units = const Value.absent(),
            Value<bool> darkMode = const Value.absent(),
            Value<bool> notificationsEnabled = const Value.absent(),
            Value<DateTime?> quietHoursStart = const Value.absent(),
            Value<DateTime?> quietHoursEnd = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            firebaseUid: firebaseUid,
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            preferredLanguage: preferredLanguage,
            units: units,
            darkMode: darkMode,
            notificationsEnabled: notificationsEnabled,
            quietHoursStart: quietHoursStart,
            quietHoursEnd: quietHoursEnd,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firebaseUid,
            required String email,
            Value<String?> displayName = const Value.absent(),
            Value<String?> photoUrl = const Value.absent(),
            Value<String> preferredLanguage = const Value.absent(),
            Value<String> units = const Value.absent(),
            Value<bool> darkMode = const Value.absent(),
            Value<bool> notificationsEnabled = const Value.absent(),
            Value<DateTime?> quietHoursStart = const Value.absent(),
            Value<DateTime?> quietHoursEnd = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            firebaseUid: firebaseUid,
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            preferredLanguage: preferredLanguage,
            units: units,
            darkMode: darkMode,
            notificationsEnabled: notificationsEnabled,
            quietHoursStart: quietHoursStart,
            quietHoursEnd: quietHoursEnd,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {petsRefs = false,
              remindersRefs = false,
              familyMembersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (petsRefs) db.pets,
                if (remindersRefs) db.reminders,
                if (familyMembersRefs) db.familyMembers
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (petsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._petsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).petsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items),
                  if (remindersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._remindersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).remindersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items),
                  if (familyMembersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._familyMembersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .familyMembersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function(
        {bool petsRefs, bool remindersRefs, bool familyMembersRefs})>;
typedef $$PetsTableCreateCompanionBuilder = PetsCompanion Function({
  Value<int> id,
  required int userId,
  required String name,
  required String species,
  Value<String?> breed,
  Value<String?> sex,
  Value<DateTime?> birthDate,
  Value<String?> approximateAge,
  Value<double?> weight,
  Value<String> weightUnit,
  Value<String?> microchipNumber,
  Value<String?> photoUrl,
  Value<String?> localPhotoPath,
  Value<String?> notes,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$PetsTableUpdateCompanionBuilder = PetsCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<String> name,
  Value<String> species,
  Value<String?> breed,
  Value<String?> sex,
  Value<DateTime?> birthDate,
  Value<String?> approximateAge,
  Value<double?> weight,
  Value<String> weightUnit,
  Value<String?> microchipNumber,
  Value<String?> photoUrl,
  Value<String?> localPhotoPath,
  Value<String?> notes,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$PetsTableReferences
    extends BaseReferences<_$AppDatabase, $PetsTable, Pet> {
  $$PetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.pets.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$VaccinationRecordsTable, List<VaccinationRecord>>
      _vaccinationRecordsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.vaccinationRecords,
              aliasName: $_aliasNameGenerator(
                  db.pets.id, db.vaccinationRecords.petId));

  $$VaccinationRecordsTableProcessedTableManager get vaccinationRecordsRefs {
    final manager =
        $$VaccinationRecordsTableTableManager($_db, $_db.vaccinationRecords)
            .filter((f) => f.petId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_vaccinationRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MedicationsTable, List<Medication>>
      _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.medications,
          aliasName: $_aliasNameGenerator(db.pets.id, db.medications.petId));

  $$MedicationsTableProcessedTableManager get medicationsRefs {
    final manager = $$MedicationsTableTableManager($_db, $_db.medications)
        .filter((f) => f.petId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RemindersTable, List<Reminder>>
      _remindersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.reminders,
              aliasName: $_aliasNameGenerator(db.pets.id, db.reminders.petId));

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager($_db, $_db.reminders)
        .filter((f) => f.petId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AppointmentsTable, List<Appointment>>
      _appointmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.appointments,
          aliasName: $_aliasNameGenerator(db.pets.id, db.appointments.petId));

  $$AppointmentsTableProcessedTableManager get appointmentsRefs {
    final manager = $$AppointmentsTableTableManager($_db, $_db.appointments)
        .filter((f) => f.petId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_appointmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WeightEntriesTable, List<WeightEntry>>
      _weightEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.weightEntries,
              aliasName:
                  $_aliasNameGenerator(db.pets.id, db.weightEntries.petId));

  $$WeightEntriesTableProcessedTableManager get weightEntriesRefs {
    final manager = $$WeightEntriesTableTableManager($_db, $_db.weightEntries)
        .filter((f) => f.petId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_weightEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DocumentsTable, List<Document>>
      _documentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.documents,
              aliasName: $_aliasNameGenerator(db.pets.id, db.documents.petId));

  $$DocumentsTableProcessedTableManager get documentsRefs {
    final manager = $$DocumentsTableTableManager($_db, $_db.documents)
        .filter((f) => f.petId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_documentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FamilyMembersTable, List<FamilyMember>>
      _familyMembersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.familyMembers,
              aliasName:
                  $_aliasNameGenerator(db.pets.id, db.familyMembers.petId));

  $$FamilyMembersTableProcessedTableManager get familyMembersRefs {
    final manager = $$FamilyMembersTableTableManager($_db, $_db.familyMembers)
        .filter((f) => f.petId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_familyMembersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PetsTableFilterComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get approximateAge => $composableBuilder(
      column: $table.approximateAge,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get weightUnit => $composableBuilder(
      column: $table.weightUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get microchipNumber => $composableBuilder(
      column: $table.microchipNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPhotoPath => $composableBuilder(
      column: $table.localPhotoPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> vaccinationRecordsRefs(
      Expression<bool> Function($$VaccinationRecordsTableFilterComposer f) f) {
    final $$VaccinationRecordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vaccinationRecords,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaccinationRecordsTableFilterComposer(
              $db: $db,
              $table: $db.vaccinationRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> medicationsRefs(
      Expression<bool> Function($$MedicationsTableFilterComposer f) f) {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableFilterComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> remindersRefs(
      Expression<bool> Function($$RemindersTableFilterComposer f) f) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reminders,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RemindersTableFilterComposer(
              $db: $db,
              $table: $db.reminders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> appointmentsRefs(
      Expression<bool> Function($$AppointmentsTableFilterComposer f) f) {
    final $$AppointmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.appointments,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentsTableFilterComposer(
              $db: $db,
              $table: $db.appointments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> weightEntriesRefs(
      Expression<bool> Function($$WeightEntriesTableFilterComposer f) f) {
    final $$WeightEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.weightEntries,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WeightEntriesTableFilterComposer(
              $db: $db,
              $table: $db.weightEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> documentsRefs(
      Expression<bool> Function($$DocumentsTableFilterComposer f) f) {
    final $$DocumentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.documents,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DocumentsTableFilterComposer(
              $db: $db,
              $table: $db.documents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> familyMembersRefs(
      Expression<bool> Function($$FamilyMembersTableFilterComposer f) f) {
    final $$FamilyMembersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.familyMembers,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FamilyMembersTableFilterComposer(
              $db: $db,
              $table: $db.familyMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PetsTableOrderingComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get approximateAge => $composableBuilder(
      column: $table.approximateAge,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get weightUnit => $composableBuilder(
      column: $table.weightUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get microchipNumber => $composableBuilder(
      column: $table.microchipNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoUrl => $composableBuilder(
      column: $table.photoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPhotoPath => $composableBuilder(
      column: $table.localPhotoPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get approximateAge => $composableBuilder(
      column: $table.approximateAge, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get weightUnit => $composableBuilder(
      column: $table.weightUnit, builder: (column) => column);

  GeneratedColumn<String> get microchipNumber => $composableBuilder(
      column: $table.microchipNumber, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<String> get localPhotoPath => $composableBuilder(
      column: $table.localPhotoPath, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> vaccinationRecordsRefs<T extends Object>(
      Expression<T> Function($$VaccinationRecordsTableAnnotationComposer a) f) {
    final $$VaccinationRecordsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.vaccinationRecords,
            getReferencedColumn: (t) => t.petId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$VaccinationRecordsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.vaccinationRecords,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> medicationsRefs<T extends Object>(
      Expression<T> Function($$MedicationsTableAnnotationComposer a) f) {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableAnnotationComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> remindersRefs<T extends Object>(
      Expression<T> Function($$RemindersTableAnnotationComposer a) f) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reminders,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RemindersTableAnnotationComposer(
              $db: $db,
              $table: $db.reminders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> appointmentsRefs<T extends Object>(
      Expression<T> Function($$AppointmentsTableAnnotationComposer a) f) {
    final $$AppointmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.appointments,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.appointments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> weightEntriesRefs<T extends Object>(
      Expression<T> Function($$WeightEntriesTableAnnotationComposer a) f) {
    final $$WeightEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.weightEntries,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WeightEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.weightEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> documentsRefs<T extends Object>(
      Expression<T> Function($$DocumentsTableAnnotationComposer a) f) {
    final $$DocumentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.documents,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DocumentsTableAnnotationComposer(
              $db: $db,
              $table: $db.documents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> familyMembersRefs<T extends Object>(
      Expression<T> Function($$FamilyMembersTableAnnotationComposer a) f) {
    final $$FamilyMembersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.familyMembers,
        getReferencedColumn: (t) => t.petId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FamilyMembersTableAnnotationComposer(
              $db: $db,
              $table: $db.familyMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PetsTable,
    Pet,
    $$PetsTableFilterComposer,
    $$PetsTableOrderingComposer,
    $$PetsTableAnnotationComposer,
    $$PetsTableCreateCompanionBuilder,
    $$PetsTableUpdateCompanionBuilder,
    (Pet, $$PetsTableReferences),
    Pet,
    PrefetchHooks Function(
        {bool userId,
        bool vaccinationRecordsRefs,
        bool medicationsRefs,
        bool remindersRefs,
        bool appointmentsRefs,
        bool weightEntriesRefs,
        bool documentsRefs,
        bool familyMembersRefs})> {
  $$PetsTableTableManager(_$AppDatabase db, $PetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> species = const Value.absent(),
            Value<String?> breed = const Value.absent(),
            Value<String?> sex = const Value.absent(),
            Value<DateTime?> birthDate = const Value.absent(),
            Value<String?> approximateAge = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<String> weightUnit = const Value.absent(),
            Value<String?> microchipNumber = const Value.absent(),
            Value<String?> photoUrl = const Value.absent(),
            Value<String?> localPhotoPath = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              PetsCompanion(
            id: id,
            userId: userId,
            name: name,
            species: species,
            breed: breed,
            sex: sex,
            birthDate: birthDate,
            approximateAge: approximateAge,
            weight: weight,
            weightUnit: weightUnit,
            microchipNumber: microchipNumber,
            photoUrl: photoUrl,
            localPhotoPath: localPhotoPath,
            notes: notes,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String name,
            required String species,
            Value<String?> breed = const Value.absent(),
            Value<String?> sex = const Value.absent(),
            Value<DateTime?> birthDate = const Value.absent(),
            Value<String?> approximateAge = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<String> weightUnit = const Value.absent(),
            Value<String?> microchipNumber = const Value.absent(),
            Value<String?> photoUrl = const Value.absent(),
            Value<String?> localPhotoPath = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              PetsCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            species: species,
            breed: breed,
            sex: sex,
            birthDate: birthDate,
            approximateAge: approximateAge,
            weight: weight,
            weightUnit: weightUnit,
            microchipNumber: microchipNumber,
            photoUrl: photoUrl,
            localPhotoPath: localPhotoPath,
            notes: notes,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PetsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {userId = false,
              vaccinationRecordsRefs = false,
              medicationsRefs = false,
              remindersRefs = false,
              appointmentsRefs = false,
              weightEntriesRefs = false,
              documentsRefs = false,
              familyMembersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (vaccinationRecordsRefs) db.vaccinationRecords,
                if (medicationsRefs) db.medications,
                if (remindersRefs) db.reminders,
                if (appointmentsRefs) db.appointments,
                if (weightEntriesRefs) db.weightEntries,
                if (documentsRefs) db.documents,
                if (familyMembersRefs) db.familyMembers
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$PetsTableReferences._userIdTable(db),
                    referencedColumn: $$PetsTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vaccinationRecordsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PetsTableReferences
                            ._vaccinationRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0)
                                .vaccinationRecordsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items),
                  if (medicationsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PetsTableReferences._medicationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0)
                                .medicationsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items),
                  if (remindersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PetsTableReferences._remindersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0).remindersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items),
                  if (appointmentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PetsTableReferences._appointmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0)
                                .appointmentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items),
                  if (weightEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PetsTableReferences._weightEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0)
                                .weightEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items),
                  if (documentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PetsTableReferences._documentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0).documentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items),
                  if (familyMembersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PetsTableReferences._familyMembersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PetsTableReferences(db, table, p0)
                                .familyMembersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.petId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PetsTable,
    Pet,
    $$PetsTableFilterComposer,
    $$PetsTableOrderingComposer,
    $$PetsTableAnnotationComposer,
    $$PetsTableCreateCompanionBuilder,
    $$PetsTableUpdateCompanionBuilder,
    (Pet, $$PetsTableReferences),
    Pet,
    PrefetchHooks Function(
        {bool userId,
        bool vaccinationRecordsRefs,
        bool medicationsRefs,
        bool remindersRefs,
        bool appointmentsRefs,
        bool weightEntriesRefs,
        bool documentsRefs,
        bool familyMembersRefs})>;
typedef $$VaccinesTableCreateCompanionBuilder = VaccinesCompanion Function({
  Value<int> id,
  required String name,
  required String species,
  Value<String?> description,
  Value<int?> initialDoseWeeks,
  Value<int?> boosterIntervalWeeks,
  Value<int?> boosterCount,
  Value<String> region,
  Value<bool> isCore,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$VaccinesTableUpdateCompanionBuilder = VaccinesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> species,
  Value<String?> description,
  Value<int?> initialDoseWeeks,
  Value<int?> boosterIntervalWeeks,
  Value<int?> boosterCount,
  Value<String> region,
  Value<bool> isCore,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$VaccinesTableReferences
    extends BaseReferences<_$AppDatabase, $VaccinesTable, Vaccine> {
  $$VaccinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VaccinationRecordsTable, List<VaccinationRecord>>
      _vaccinationRecordsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.vaccinationRecords,
              aliasName: $_aliasNameGenerator(
                  db.vaccines.id, db.vaccinationRecords.vaccineId));

  $$VaccinationRecordsTableProcessedTableManager get vaccinationRecordsRefs {
    final manager =
        $$VaccinationRecordsTableTableManager($_db, $_db.vaccinationRecords)
            .filter((f) => f.vaccineId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_vaccinationRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$VaccinesTableFilterComposer
    extends Composer<_$AppDatabase, $VaccinesTable> {
  $$VaccinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get initialDoseWeeks => $composableBuilder(
      column: $table.initialDoseWeeks,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get boosterIntervalWeeks => $composableBuilder(
      column: $table.boosterIntervalWeeks,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get boosterCount => $composableBuilder(
      column: $table.boosterCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCore => $composableBuilder(
      column: $table.isCore, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> vaccinationRecordsRefs(
      Expression<bool> Function($$VaccinationRecordsTableFilterComposer f) f) {
    final $$VaccinationRecordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vaccinationRecords,
        getReferencedColumn: (t) => t.vaccineId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaccinationRecordsTableFilterComposer(
              $db: $db,
              $table: $db.vaccinationRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VaccinesTableOrderingComposer
    extends Composer<_$AppDatabase, $VaccinesTable> {
  $$VaccinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get initialDoseWeeks => $composableBuilder(
      column: $table.initialDoseWeeks,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get boosterIntervalWeeks => $composableBuilder(
      column: $table.boosterIntervalWeeks,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get boosterCount => $composableBuilder(
      column: $table.boosterCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get region => $composableBuilder(
      column: $table.region, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCore => $composableBuilder(
      column: $table.isCore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$VaccinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VaccinesTable> {
  $$VaccinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get initialDoseWeeks => $composableBuilder(
      column: $table.initialDoseWeeks, builder: (column) => column);

  GeneratedColumn<int> get boosterIntervalWeeks => $composableBuilder(
      column: $table.boosterIntervalWeeks, builder: (column) => column);

  GeneratedColumn<int> get boosterCount => $composableBuilder(
      column: $table.boosterCount, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<bool> get isCore =>
      $composableBuilder(column: $table.isCore, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> vaccinationRecordsRefs<T extends Object>(
      Expression<T> Function($$VaccinationRecordsTableAnnotationComposer a) f) {
    final $$VaccinationRecordsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.vaccinationRecords,
            getReferencedColumn: (t) => t.vaccineId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$VaccinationRecordsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.vaccinationRecords,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$VaccinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VaccinesTable,
    Vaccine,
    $$VaccinesTableFilterComposer,
    $$VaccinesTableOrderingComposer,
    $$VaccinesTableAnnotationComposer,
    $$VaccinesTableCreateCompanionBuilder,
    $$VaccinesTableUpdateCompanionBuilder,
    (Vaccine, $$VaccinesTableReferences),
    Vaccine,
    PrefetchHooks Function({bool vaccinationRecordsRefs})> {
  $$VaccinesTableTableManager(_$AppDatabase db, $VaccinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VaccinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VaccinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VaccinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> species = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> initialDoseWeeks = const Value.absent(),
            Value<int?> boosterIntervalWeeks = const Value.absent(),
            Value<int?> boosterCount = const Value.absent(),
            Value<String> region = const Value.absent(),
            Value<bool> isCore = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              VaccinesCompanion(
            id: id,
            name: name,
            species: species,
            description: description,
            initialDoseWeeks: initialDoseWeeks,
            boosterIntervalWeeks: boosterIntervalWeeks,
            boosterCount: boosterCount,
            region: region,
            isCore: isCore,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String species,
            Value<String?> description = const Value.absent(),
            Value<int?> initialDoseWeeks = const Value.absent(),
            Value<int?> boosterIntervalWeeks = const Value.absent(),
            Value<int?> boosterCount = const Value.absent(),
            Value<String> region = const Value.absent(),
            Value<bool> isCore = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              VaccinesCompanion.insert(
            id: id,
            name: name,
            species: species,
            description: description,
            initialDoseWeeks: initialDoseWeeks,
            boosterIntervalWeeks: boosterIntervalWeeks,
            boosterCount: boosterCount,
            region: region,
            isCore: isCore,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$VaccinesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({vaccinationRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (vaccinationRecordsRefs) db.vaccinationRecords
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vaccinationRecordsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$VaccinesTableReferences
                            ._vaccinationRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VaccinesTableReferences(db, table, p0)
                                .vaccinationRecordsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.vaccineId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$VaccinesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VaccinesTable,
    Vaccine,
    $$VaccinesTableFilterComposer,
    $$VaccinesTableOrderingComposer,
    $$VaccinesTableAnnotationComposer,
    $$VaccinesTableCreateCompanionBuilder,
    $$VaccinesTableUpdateCompanionBuilder,
    (Vaccine, $$VaccinesTableReferences),
    Vaccine,
    PrefetchHooks Function({bool vaccinationRecordsRefs})>;
typedef $$VaccinationRecordsTableCreateCompanionBuilder
    = VaccinationRecordsCompanion Function({
  Value<int> id,
  required int petId,
  required int vaccineId,
  required String vaccineName,
  required DateTime dateGiven,
  Value<DateTime?> nextDueDate,
  Value<String?> vetClinic,
  Value<String?> batchNumber,
  Value<String?> certificatePhotoUrl,
  Value<String?> certificateLocalPath,
  Value<String?> notes,
  Value<bool> isCompleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$VaccinationRecordsTableUpdateCompanionBuilder
    = VaccinationRecordsCompanion Function({
  Value<int> id,
  Value<int> petId,
  Value<int> vaccineId,
  Value<String> vaccineName,
  Value<DateTime> dateGiven,
  Value<DateTime?> nextDueDate,
  Value<String?> vetClinic,
  Value<String?> batchNumber,
  Value<String?> certificatePhotoUrl,
  Value<String?> certificateLocalPath,
  Value<String?> notes,
  Value<bool> isCompleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$VaccinationRecordsTableReferences extends BaseReferences<
    _$AppDatabase, $VaccinationRecordsTable, VaccinationRecord> {
  $$VaccinationRecordsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets.createAlias(
      $_aliasNameGenerator(db.vaccinationRecords.petId, db.pets.id));

  $$PetsTableProcessedTableManager get petId {
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $VaccinesTable _vaccineIdTable(_$AppDatabase db) =>
      db.vaccines.createAlias($_aliasNameGenerator(
          db.vaccinationRecords.vaccineId, db.vaccines.id));

  $$VaccinesTableProcessedTableManager get vaccineId {
    final manager = $$VaccinesTableTableManager($_db, $_db.vaccines)
        .filter((f) => f.id($_item.vaccineId));
    final item = $_typedResult.readTableOrNull(_vaccineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$VaccinationRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $VaccinationRecordsTable> {
  $$VaccinationRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vaccineName => $composableBuilder(
      column: $table.vaccineName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateGiven => $composableBuilder(
      column: $table.dateGiven, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vetClinic => $composableBuilder(
      column: $table.vetClinic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get batchNumber => $composableBuilder(
      column: $table.batchNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get certificatePhotoUrl => $composableBuilder(
      column: $table.certificatePhotoUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get certificateLocalPath => $composableBuilder(
      column: $table.certificateLocalPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VaccinesTableFilterComposer get vaccineId {
    final $$VaccinesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaccineId,
        referencedTable: $db.vaccines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaccinesTableFilterComposer(
              $db: $db,
              $table: $db.vaccines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VaccinationRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $VaccinationRecordsTable> {
  $$VaccinationRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vaccineName => $composableBuilder(
      column: $table.vaccineName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateGiven => $composableBuilder(
      column: $table.dateGiven, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vetClinic => $composableBuilder(
      column: $table.vetClinic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get batchNumber => $composableBuilder(
      column: $table.batchNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get certificatePhotoUrl => $composableBuilder(
      column: $table.certificatePhotoUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get certificateLocalPath => $composableBuilder(
      column: $table.certificateLocalPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableOrderingComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VaccinesTableOrderingComposer get vaccineId {
    final $$VaccinesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaccineId,
        referencedTable: $db.vaccines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaccinesTableOrderingComposer(
              $db: $db,
              $table: $db.vaccines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VaccinationRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VaccinationRecordsTable> {
  $$VaccinationRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vaccineName => $composableBuilder(
      column: $table.vaccineName, builder: (column) => column);

  GeneratedColumn<DateTime> get dateGiven =>
      $composableBuilder(column: $table.dateGiven, builder: (column) => column);

  GeneratedColumn<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => column);

  GeneratedColumn<String> get vetClinic =>
      $composableBuilder(column: $table.vetClinic, builder: (column) => column);

  GeneratedColumn<String> get batchNumber => $composableBuilder(
      column: $table.batchNumber, builder: (column) => column);

  GeneratedColumn<String> get certificatePhotoUrl => $composableBuilder(
      column: $table.certificatePhotoUrl, builder: (column) => column);

  GeneratedColumn<String> get certificateLocalPath => $composableBuilder(
      column: $table.certificateLocalPath, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$VaccinesTableAnnotationComposer get vaccineId {
    final $$VaccinesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaccineId,
        referencedTable: $db.vaccines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaccinesTableAnnotationComposer(
              $db: $db,
              $table: $db.vaccines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VaccinationRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VaccinationRecordsTable,
    VaccinationRecord,
    $$VaccinationRecordsTableFilterComposer,
    $$VaccinationRecordsTableOrderingComposer,
    $$VaccinationRecordsTableAnnotationComposer,
    $$VaccinationRecordsTableCreateCompanionBuilder,
    $$VaccinationRecordsTableUpdateCompanionBuilder,
    (VaccinationRecord, $$VaccinationRecordsTableReferences),
    VaccinationRecord,
    PrefetchHooks Function({bool petId, bool vaccineId})> {
  $$VaccinationRecordsTableTableManager(
      _$AppDatabase db, $VaccinationRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VaccinationRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VaccinationRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VaccinationRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> petId = const Value.absent(),
            Value<int> vaccineId = const Value.absent(),
            Value<String> vaccineName = const Value.absent(),
            Value<DateTime> dateGiven = const Value.absent(),
            Value<DateTime?> nextDueDate = const Value.absent(),
            Value<String?> vetClinic = const Value.absent(),
            Value<String?> batchNumber = const Value.absent(),
            Value<String?> certificatePhotoUrl = const Value.absent(),
            Value<String?> certificateLocalPath = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              VaccinationRecordsCompanion(
            id: id,
            petId: petId,
            vaccineId: vaccineId,
            vaccineName: vaccineName,
            dateGiven: dateGiven,
            nextDueDate: nextDueDate,
            vetClinic: vetClinic,
            batchNumber: batchNumber,
            certificatePhotoUrl: certificatePhotoUrl,
            certificateLocalPath: certificateLocalPath,
            notes: notes,
            isCompleted: isCompleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int petId,
            required int vaccineId,
            required String vaccineName,
            required DateTime dateGiven,
            Value<DateTime?> nextDueDate = const Value.absent(),
            Value<String?> vetClinic = const Value.absent(),
            Value<String?> batchNumber = const Value.absent(),
            Value<String?> certificatePhotoUrl = const Value.absent(),
            Value<String?> certificateLocalPath = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              VaccinationRecordsCompanion.insert(
            id: id,
            petId: petId,
            vaccineId: vaccineId,
            vaccineName: vaccineName,
            dateGiven: dateGiven,
            nextDueDate: nextDueDate,
            vetClinic: vetClinic,
            batchNumber: batchNumber,
            certificatePhotoUrl: certificatePhotoUrl,
            certificateLocalPath: certificateLocalPath,
            notes: notes,
            isCompleted: isCompleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VaccinationRecordsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({petId = false, vaccineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable:
                        $$VaccinationRecordsTableReferences._petIdTable(db),
                    referencedColumn:
                        $$VaccinationRecordsTableReferences._petIdTable(db).id,
                  ) as T;
                }
                if (vaccineId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vaccineId,
                    referencedTable:
                        $$VaccinationRecordsTableReferences._vaccineIdTable(db),
                    referencedColumn: $$VaccinationRecordsTableReferences
                        ._vaccineIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$VaccinationRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VaccinationRecordsTable,
    VaccinationRecord,
    $$VaccinationRecordsTableFilterComposer,
    $$VaccinationRecordsTableOrderingComposer,
    $$VaccinationRecordsTableAnnotationComposer,
    $$VaccinationRecordsTableCreateCompanionBuilder,
    $$VaccinationRecordsTableUpdateCompanionBuilder,
    (VaccinationRecord, $$VaccinationRecordsTableReferences),
    VaccinationRecord,
    PrefetchHooks Function({bool petId, bool vaccineId})>;
typedef $$MedicationsTableCreateCompanionBuilder = MedicationsCompanion
    Function({
  Value<int> id,
  required int petId,
  required String name,
  required String dosage,
  required String form,
  required String frequencyType,
  Value<int?> timesPerDay,
  Value<int?> everyNHours,
  Value<String?> specificWeekdays,
  Value<String?> customCron,
  required DateTime startDate,
  Value<DateTime?> endDate,
  Value<bool> withFood,
  Value<String?> instructions,
  Value<int?> remainingDoses,
  Value<int?> refillThreshold,
  Value<String?> vetClinic,
  Value<String?> prescribingVet,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$MedicationsTableUpdateCompanionBuilder = MedicationsCompanion
    Function({
  Value<int> id,
  Value<int> petId,
  Value<String> name,
  Value<String> dosage,
  Value<String> form,
  Value<String> frequencyType,
  Value<int?> timesPerDay,
  Value<int?> everyNHours,
  Value<String?> specificWeekdays,
  Value<String?> customCron,
  Value<DateTime> startDate,
  Value<DateTime?> endDate,
  Value<bool> withFood,
  Value<String?> instructions,
  Value<int?> remainingDoses,
  Value<int?> refillThreshold,
  Value<String?> vetClinic,
  Value<String?> prescribingVet,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets
      .createAlias($_aliasNameGenerator(db.medications.petId, db.pets.id));

  $$PetsTableProcessedTableManager get petId {
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DoseSchedulesTable, List<DoseSchedule>>
      _doseSchedulesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.doseSchedules,
              aliasName: $_aliasNameGenerator(
                  db.medications.id, db.doseSchedules.medicationId));

  $$DoseSchedulesTableProcessedTableManager get doseSchedulesRefs {
    final manager = $$DoseSchedulesTableTableManager($_db, $_db.doseSchedules)
        .filter((f) => f.medicationId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_doseSchedulesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DoseLogsTable, List<DoseLog>> _doseLogsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.doseLogs,
          aliasName: $_aliasNameGenerator(
              db.medications.id, db.doseLogs.medicationId));

  $$DoseLogsTableProcessedTableManager get doseLogsRefs {
    final manager = $$DoseLogsTableTableManager($_db, $_db.doseLogs)
        .filter((f) => f.medicationId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_doseLogsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get form => $composableBuilder(
      column: $table.form, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frequencyType => $composableBuilder(
      column: $table.frequencyType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timesPerDay => $composableBuilder(
      column: $table.timesPerDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get everyNHours => $composableBuilder(
      column: $table.everyNHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get specificWeekdays => $composableBuilder(
      column: $table.specificWeekdays,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customCron => $composableBuilder(
      column: $table.customCron, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get withFood => $composableBuilder(
      column: $table.withFood, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructions => $composableBuilder(
      column: $table.instructions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remainingDoses => $composableBuilder(
      column: $table.remainingDoses,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refillThreshold => $composableBuilder(
      column: $table.refillThreshold,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vetClinic => $composableBuilder(
      column: $table.vetClinic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prescribingVet => $composableBuilder(
      column: $table.prescribingVet,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> doseSchedulesRefs(
      Expression<bool> Function($$DoseSchedulesTableFilterComposer f) f) {
    final $$DoseSchedulesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.doseSchedules,
        getReferencedColumn: (t) => t.medicationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseSchedulesTableFilterComposer(
              $db: $db,
              $table: $db.doseSchedules,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> doseLogsRefs(
      Expression<bool> Function($$DoseLogsTableFilterComposer f) f) {
    final $$DoseLogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.doseLogs,
        getReferencedColumn: (t) => t.medicationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseLogsTableFilterComposer(
              $db: $db,
              $table: $db.doseLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get form => $composableBuilder(
      column: $table.form, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frequencyType => $composableBuilder(
      column: $table.frequencyType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timesPerDay => $composableBuilder(
      column: $table.timesPerDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get everyNHours => $composableBuilder(
      column: $table.everyNHours, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get specificWeekdays => $composableBuilder(
      column: $table.specificWeekdays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customCron => $composableBuilder(
      column: $table.customCron, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get withFood => $composableBuilder(
      column: $table.withFood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructions => $composableBuilder(
      column: $table.instructions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remainingDoses => $composableBuilder(
      column: $table.remainingDoses,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refillThreshold => $composableBuilder(
      column: $table.refillThreshold,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vetClinic => $composableBuilder(
      column: $table.vetClinic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prescribingVet => $composableBuilder(
      column: $table.prescribingVet,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableOrderingComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<String> get form =>
      $composableBuilder(column: $table.form, builder: (column) => column);

  GeneratedColumn<String> get frequencyType => $composableBuilder(
      column: $table.frequencyType, builder: (column) => column);

  GeneratedColumn<int> get timesPerDay => $composableBuilder(
      column: $table.timesPerDay, builder: (column) => column);

  GeneratedColumn<int> get everyNHours => $composableBuilder(
      column: $table.everyNHours, builder: (column) => column);

  GeneratedColumn<String> get specificWeekdays => $composableBuilder(
      column: $table.specificWeekdays, builder: (column) => column);

  GeneratedColumn<String> get customCron => $composableBuilder(
      column: $table.customCron, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get withFood =>
      $composableBuilder(column: $table.withFood, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
      column: $table.instructions, builder: (column) => column);

  GeneratedColumn<int> get remainingDoses => $composableBuilder(
      column: $table.remainingDoses, builder: (column) => column);

  GeneratedColumn<int> get refillThreshold => $composableBuilder(
      column: $table.refillThreshold, builder: (column) => column);

  GeneratedColumn<String> get vetClinic =>
      $composableBuilder(column: $table.vetClinic, builder: (column) => column);

  GeneratedColumn<String> get prescribingVet => $composableBuilder(
      column: $table.prescribingVet, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> doseSchedulesRefs<T extends Object>(
      Expression<T> Function($$DoseSchedulesTableAnnotationComposer a) f) {
    final $$DoseSchedulesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.doseSchedules,
        getReferencedColumn: (t) => t.medicationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseSchedulesTableAnnotationComposer(
              $db: $db,
              $table: $db.doseSchedules,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> doseLogsRefs<T extends Object>(
      Expression<T> Function($$DoseLogsTableAnnotationComposer a) f) {
    final $$DoseLogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.doseLogs,
        getReferencedColumn: (t) => t.medicationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseLogsTableAnnotationComposer(
              $db: $db,
              $table: $db.doseLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MedicationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicationsTable,
    Medication,
    $$MedicationsTableFilterComposer,
    $$MedicationsTableOrderingComposer,
    $$MedicationsTableAnnotationComposer,
    $$MedicationsTableCreateCompanionBuilder,
    $$MedicationsTableUpdateCompanionBuilder,
    (Medication, $$MedicationsTableReferences),
    Medication,
    PrefetchHooks Function(
        {bool petId, bool doseSchedulesRefs, bool doseLogsRefs})> {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> petId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> dosage = const Value.absent(),
            Value<String> form = const Value.absent(),
            Value<String> frequencyType = const Value.absent(),
            Value<int?> timesPerDay = const Value.absent(),
            Value<int?> everyNHours = const Value.absent(),
            Value<String?> specificWeekdays = const Value.absent(),
            Value<String?> customCron = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool> withFood = const Value.absent(),
            Value<String?> instructions = const Value.absent(),
            Value<int?> remainingDoses = const Value.absent(),
            Value<int?> refillThreshold = const Value.absent(),
            Value<String?> vetClinic = const Value.absent(),
            Value<String?> prescribingVet = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              MedicationsCompanion(
            id: id,
            petId: petId,
            name: name,
            dosage: dosage,
            form: form,
            frequencyType: frequencyType,
            timesPerDay: timesPerDay,
            everyNHours: everyNHours,
            specificWeekdays: specificWeekdays,
            customCron: customCron,
            startDate: startDate,
            endDate: endDate,
            withFood: withFood,
            instructions: instructions,
            remainingDoses: remainingDoses,
            refillThreshold: refillThreshold,
            vetClinic: vetClinic,
            prescribingVet: prescribingVet,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int petId,
            required String name,
            required String dosage,
            required String form,
            required String frequencyType,
            Value<int?> timesPerDay = const Value.absent(),
            Value<int?> everyNHours = const Value.absent(),
            Value<String?> specificWeekdays = const Value.absent(),
            Value<String?> customCron = const Value.absent(),
            required DateTime startDate,
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool> withFood = const Value.absent(),
            Value<String?> instructions = const Value.absent(),
            Value<int?> remainingDoses = const Value.absent(),
            Value<int?> refillThreshold = const Value.absent(),
            Value<String?> vetClinic = const Value.absent(),
            Value<String?> prescribingVet = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              MedicationsCompanion.insert(
            id: id,
            petId: petId,
            name: name,
            dosage: dosage,
            form: form,
            frequencyType: frequencyType,
            timesPerDay: timesPerDay,
            everyNHours: everyNHours,
            specificWeekdays: specificWeekdays,
            customCron: customCron,
            startDate: startDate,
            endDate: endDate,
            withFood: withFood,
            instructions: instructions,
            remainingDoses: remainingDoses,
            refillThreshold: refillThreshold,
            vetClinic: vetClinic,
            prescribingVet: prescribingVet,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MedicationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {petId = false,
              doseSchedulesRefs = false,
              doseLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (doseSchedulesRefs) db.doseSchedules,
                if (doseLogsRefs) db.doseLogs
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable:
                        $$MedicationsTableReferences._petIdTable(db),
                    referencedColumn:
                        $$MedicationsTableReferences._petIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (doseSchedulesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MedicationsTableReferences
                            ._doseSchedulesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MedicationsTableReferences(db, table, p0)
                                .doseSchedulesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.medicationId == item.id),
                        typedResults: items),
                  if (doseLogsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$MedicationsTableReferences._doseLogsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MedicationsTableReferences(db, table, p0)
                                .doseLogsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.medicationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MedicationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicationsTable,
    Medication,
    $$MedicationsTableFilterComposer,
    $$MedicationsTableOrderingComposer,
    $$MedicationsTableAnnotationComposer,
    $$MedicationsTableCreateCompanionBuilder,
    $$MedicationsTableUpdateCompanionBuilder,
    (Medication, $$MedicationsTableReferences),
    Medication,
    PrefetchHooks Function(
        {bool petId, bool doseSchedulesRefs, bool doseLogsRefs})>;
typedef $$DoseSchedulesTableCreateCompanionBuilder = DoseSchedulesCompanion
    Function({
  Value<int> id,
  required int medicationId,
  required DateTime scheduledTime,
  Value<bool> isTaken,
  Value<bool> isSkipped,
  Value<DateTime?> takenAt,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$DoseSchedulesTableUpdateCompanionBuilder = DoseSchedulesCompanion
    Function({
  Value<int> id,
  Value<int> medicationId,
  Value<DateTime> scheduledTime,
  Value<bool> isTaken,
  Value<bool> isSkipped,
  Value<DateTime?> takenAt,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$DoseSchedulesTableReferences
    extends BaseReferences<_$AppDatabase, $DoseSchedulesTable, DoseSchedule> {
  $$DoseSchedulesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias($_aliasNameGenerator(
          db.doseSchedules.medicationId, db.medications.id));

  $$MedicationsTableProcessedTableManager get medicationId {
    final manager = $$MedicationsTableTableManager($_db, $_db.medications)
        .filter((f) => f.id($_item.medicationId));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DoseLogsTable, List<DoseLog>> _doseLogsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.doseLogs,
          aliasName: $_aliasNameGenerator(
              db.doseSchedules.id, db.doseLogs.doseScheduleId));

  $$DoseLogsTableProcessedTableManager get doseLogsRefs {
    final manager = $$DoseLogsTableTableManager($_db, $_db.doseLogs)
        .filter((f) => f.doseScheduleId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_doseLogsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DoseSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isTaken => $composableBuilder(
      column: $table.isTaken, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSkipped => $composableBuilder(
      column: $table.isSkipped, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
      column: $table.takenAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableFilterComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> doseLogsRefs(
      Expression<bool> Function($$DoseLogsTableFilterComposer f) f) {
    final $$DoseLogsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.doseLogs,
        getReferencedColumn: (t) => t.doseScheduleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseLogsTableFilterComposer(
              $db: $db,
              $table: $db.doseLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DoseSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isTaken => $composableBuilder(
      column: $table.isTaken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSkipped => $composableBuilder(
      column: $table.isSkipped, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
      column: $table.takenAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableOrderingComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DoseSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseSchedulesTable> {
  $$DoseSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => column);

  GeneratedColumn<bool> get isTaken =>
      $composableBuilder(column: $table.isTaken, builder: (column) => column);

  GeneratedColumn<bool> get isSkipped =>
      $composableBuilder(column: $table.isSkipped, builder: (column) => column);

  GeneratedColumn<DateTime> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableAnnotationComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> doseLogsRefs<T extends Object>(
      Expression<T> Function($$DoseLogsTableAnnotationComposer a) f) {
    final $$DoseLogsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.doseLogs,
        getReferencedColumn: (t) => t.doseScheduleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseLogsTableAnnotationComposer(
              $db: $db,
              $table: $db.doseLogs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DoseSchedulesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DoseSchedulesTable,
    DoseSchedule,
    $$DoseSchedulesTableFilterComposer,
    $$DoseSchedulesTableOrderingComposer,
    $$DoseSchedulesTableAnnotationComposer,
    $$DoseSchedulesTableCreateCompanionBuilder,
    $$DoseSchedulesTableUpdateCompanionBuilder,
    (DoseSchedule, $$DoseSchedulesTableReferences),
    DoseSchedule,
    PrefetchHooks Function({bool medicationId, bool doseLogsRefs})> {
  $$DoseSchedulesTableTableManager(_$AppDatabase db, $DoseSchedulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseSchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseSchedulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseSchedulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> medicationId = const Value.absent(),
            Value<DateTime> scheduledTime = const Value.absent(),
            Value<bool> isTaken = const Value.absent(),
            Value<bool> isSkipped = const Value.absent(),
            Value<DateTime?> takenAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DoseSchedulesCompanion(
            id: id,
            medicationId: medicationId,
            scheduledTime: scheduledTime,
            isTaken: isTaken,
            isSkipped: isSkipped,
            takenAt: takenAt,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int medicationId,
            required DateTime scheduledTime,
            Value<bool> isTaken = const Value.absent(),
            Value<bool> isSkipped = const Value.absent(),
            Value<DateTime?> takenAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DoseSchedulesCompanion.insert(
            id: id,
            medicationId: medicationId,
            scheduledTime: scheduledTime,
            isTaken: isTaken,
            isSkipped: isSkipped,
            takenAt: takenAt,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DoseSchedulesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {medicationId = false, doseLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (doseLogsRefs) db.doseLogs],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (medicationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.medicationId,
                    referencedTable:
                        $$DoseSchedulesTableReferences._medicationIdTable(db),
                    referencedColumn: $$DoseSchedulesTableReferences
                        ._medicationIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (doseLogsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DoseSchedulesTableReferences
                            ._doseLogsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DoseSchedulesTableReferences(db, table, p0)
                                .doseLogsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.doseScheduleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DoseSchedulesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DoseSchedulesTable,
    DoseSchedule,
    $$DoseSchedulesTableFilterComposer,
    $$DoseSchedulesTableOrderingComposer,
    $$DoseSchedulesTableAnnotationComposer,
    $$DoseSchedulesTableCreateCompanionBuilder,
    $$DoseSchedulesTableUpdateCompanionBuilder,
    (DoseSchedule, $$DoseSchedulesTableReferences),
    DoseSchedule,
    PrefetchHooks Function({bool medicationId, bool doseLogsRefs})>;
typedef $$DoseLogsTableCreateCompanionBuilder = DoseLogsCompanion Function({
  Value<int> id,
  required int medicationId,
  Value<int?> doseScheduleId,
  required DateTime scheduledTime,
  Value<DateTime?> actualTime,
  Value<bool> wasTaken,
  Value<bool> wasSkipped,
  Value<String?> notes,
  Value<String?> sideEffects,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$DoseLogsTableUpdateCompanionBuilder = DoseLogsCompanion Function({
  Value<int> id,
  Value<int> medicationId,
  Value<int?> doseScheduleId,
  Value<DateTime> scheduledTime,
  Value<DateTime?> actualTime,
  Value<bool> wasTaken,
  Value<bool> wasSkipped,
  Value<String?> notes,
  Value<String?> sideEffects,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$DoseLogsTableReferences
    extends BaseReferences<_$AppDatabase, $DoseLogsTable, DoseLog> {
  $$DoseLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
          $_aliasNameGenerator(db.doseLogs.medicationId, db.medications.id));

  $$MedicationsTableProcessedTableManager get medicationId {
    final manager = $$MedicationsTableTableManager($_db, $_db.medications)
        .filter((f) => f.id($_item.medicationId));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DoseSchedulesTable _doseScheduleIdTable(_$AppDatabase db) =>
      db.doseSchedules.createAlias($_aliasNameGenerator(
          db.doseLogs.doseScheduleId, db.doseSchedules.id));

  $$DoseSchedulesTableProcessedTableManager? get doseScheduleId {
    if ($_item.doseScheduleId == null) return null;
    final manager = $$DoseSchedulesTableTableManager($_db, $_db.doseSchedules)
        .filter((f) => f.id($_item.doseScheduleId!));
    final item = $_typedResult.readTableOrNull(_doseScheduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DoseLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get actualTime => $composableBuilder(
      column: $table.actualTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get wasTaken => $composableBuilder(
      column: $table.wasTaken, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get wasSkipped => $composableBuilder(
      column: $table.wasSkipped, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sideEffects => $composableBuilder(
      column: $table.sideEffects, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableFilterComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DoseSchedulesTableFilterComposer get doseScheduleId {
    final $$DoseSchedulesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.doseScheduleId,
        referencedTable: $db.doseSchedules,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseSchedulesTableFilterComposer(
              $db: $db,
              $table: $db.doseSchedules,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DoseLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get actualTime => $composableBuilder(
      column: $table.actualTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get wasTaken => $composableBuilder(
      column: $table.wasTaken, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get wasSkipped => $composableBuilder(
      column: $table.wasSkipped, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sideEffects => $composableBuilder(
      column: $table.sideEffects, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableOrderingComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DoseSchedulesTableOrderingComposer get doseScheduleId {
    final $$DoseSchedulesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.doseScheduleId,
        referencedTable: $db.doseSchedules,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseSchedulesTableOrderingComposer(
              $db: $db,
              $table: $db.doseSchedules,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DoseLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => column);

  GeneratedColumn<DateTime> get actualTime => $composableBuilder(
      column: $table.actualTime, builder: (column) => column);

  GeneratedColumn<bool> get wasTaken =>
      $composableBuilder(column: $table.wasTaken, builder: (column) => column);

  GeneratedColumn<bool> get wasSkipped => $composableBuilder(
      column: $table.wasSkipped, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get sideEffects => $composableBuilder(
      column: $table.sideEffects, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicationId,
        referencedTable: $db.medications,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MedicationsTableAnnotationComposer(
              $db: $db,
              $table: $db.medications,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DoseSchedulesTableAnnotationComposer get doseScheduleId {
    final $$DoseSchedulesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.doseScheduleId,
        referencedTable: $db.doseSchedules,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DoseSchedulesTableAnnotationComposer(
              $db: $db,
              $table: $db.doseSchedules,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DoseLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DoseLogsTable,
    DoseLog,
    $$DoseLogsTableFilterComposer,
    $$DoseLogsTableOrderingComposer,
    $$DoseLogsTableAnnotationComposer,
    $$DoseLogsTableCreateCompanionBuilder,
    $$DoseLogsTableUpdateCompanionBuilder,
    (DoseLog, $$DoseLogsTableReferences),
    DoseLog,
    PrefetchHooks Function({bool medicationId, bool doseScheduleId})> {
  $$DoseLogsTableTableManager(_$AppDatabase db, $DoseLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> medicationId = const Value.absent(),
            Value<int?> doseScheduleId = const Value.absent(),
            Value<DateTime> scheduledTime = const Value.absent(),
            Value<DateTime?> actualTime = const Value.absent(),
            Value<bool> wasTaken = const Value.absent(),
            Value<bool> wasSkipped = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> sideEffects = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DoseLogsCompanion(
            id: id,
            medicationId: medicationId,
            doseScheduleId: doseScheduleId,
            scheduledTime: scheduledTime,
            actualTime: actualTime,
            wasTaken: wasTaken,
            wasSkipped: wasSkipped,
            notes: notes,
            sideEffects: sideEffects,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int medicationId,
            Value<int?> doseScheduleId = const Value.absent(),
            required DateTime scheduledTime,
            Value<DateTime?> actualTime = const Value.absent(),
            Value<bool> wasTaken = const Value.absent(),
            Value<bool> wasSkipped = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> sideEffects = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DoseLogsCompanion.insert(
            id: id,
            medicationId: medicationId,
            doseScheduleId: doseScheduleId,
            scheduledTime: scheduledTime,
            actualTime: actualTime,
            wasTaken: wasTaken,
            wasSkipped: wasSkipped,
            notes: notes,
            sideEffects: sideEffects,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DoseLogsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {medicationId = false, doseScheduleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (medicationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.medicationId,
                    referencedTable:
                        $$DoseLogsTableReferences._medicationIdTable(db),
                    referencedColumn:
                        $$DoseLogsTableReferences._medicationIdTable(db).id,
                  ) as T;
                }
                if (doseScheduleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.doseScheduleId,
                    referencedTable:
                        $$DoseLogsTableReferences._doseScheduleIdTable(db),
                    referencedColumn:
                        $$DoseLogsTableReferences._doseScheduleIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DoseLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DoseLogsTable,
    DoseLog,
    $$DoseLogsTableFilterComposer,
    $$DoseLogsTableOrderingComposer,
    $$DoseLogsTableAnnotationComposer,
    $$DoseLogsTableCreateCompanionBuilder,
    $$DoseLogsTableUpdateCompanionBuilder,
    (DoseLog, $$DoseLogsTableReferences),
    DoseLog,
    PrefetchHooks Function({bool medicationId, bool doseScheduleId})>;
typedef $$RemindersTableCreateCompanionBuilder = RemindersCompanion Function({
  Value<int> id,
  required int userId,
  Value<int?> petId,
  required String type,
  required String title,
  Value<String?> description,
  required String scheduleRule,
  Value<String?> payload,
  required DateTime nextTriggerAt,
  Value<DateTime?> lastTriggeredAt,
  Value<int> escalationCount,
  Value<int> maxEscalations,
  Value<bool> isEnabled,
  Value<bool> notifyFamily,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$RemindersTableUpdateCompanionBuilder = RemindersCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int?> petId,
  Value<String> type,
  Value<String> title,
  Value<String?> description,
  Value<String> scheduleRule,
  Value<String?> payload,
  Value<DateTime> nextTriggerAt,
  Value<DateTime?> lastTriggeredAt,
  Value<int> escalationCount,
  Value<int> maxEscalations,
  Value<bool> isEnabled,
  Value<bool> notifyFamily,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, Reminder> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.reminders.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PetsTable _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias($_aliasNameGenerator(db.reminders.petId, db.pets.id));

  $$PetsTableProcessedTableManager? get petId {
    if ($_item.petId == null) return null;
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId!));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scheduleRule => $composableBuilder(
      column: $table.scheduleRule, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextTriggerAt => $composableBuilder(
      column: $table.nextTriggerAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastTriggeredAt => $composableBuilder(
      column: $table.lastTriggeredAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get escalationCount => $composableBuilder(
      column: $table.escalationCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxEscalations => $composableBuilder(
      column: $table.maxEscalations,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isEnabled => $composableBuilder(
      column: $table.isEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get notifyFamily => $composableBuilder(
      column: $table.notifyFamily, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scheduleRule => $composableBuilder(
      column: $table.scheduleRule,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextTriggerAt => $composableBuilder(
      column: $table.nextTriggerAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastTriggeredAt => $composableBuilder(
      column: $table.lastTriggeredAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get escalationCount => $composableBuilder(
      column: $table.escalationCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxEscalations => $composableBuilder(
      column: $table.maxEscalations,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
      column: $table.isEnabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get notifyFamily => $composableBuilder(
      column: $table.notifyFamily,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableOrderingComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get scheduleRule => $composableBuilder(
      column: $table.scheduleRule, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get nextTriggerAt => $composableBuilder(
      column: $table.nextTriggerAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastTriggeredAt => $composableBuilder(
      column: $table.lastTriggeredAt, builder: (column) => column);

  GeneratedColumn<int> get escalationCount => $composableBuilder(
      column: $table.escalationCount, builder: (column) => column);

  GeneratedColumn<int> get maxEscalations => $composableBuilder(
      column: $table.maxEscalations, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<bool> get notifyFamily => $composableBuilder(
      column: $table.notifyFamily, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RemindersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RemindersTable,
    Reminder,
    $$RemindersTableFilterComposer,
    $$RemindersTableOrderingComposer,
    $$RemindersTableAnnotationComposer,
    $$RemindersTableCreateCompanionBuilder,
    $$RemindersTableUpdateCompanionBuilder,
    (Reminder, $$RemindersTableReferences),
    Reminder,
    PrefetchHooks Function({bool userId, bool petId})> {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int?> petId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> scheduleRule = const Value.absent(),
            Value<String?> payload = const Value.absent(),
            Value<DateTime> nextTriggerAt = const Value.absent(),
            Value<DateTime?> lastTriggeredAt = const Value.absent(),
            Value<int> escalationCount = const Value.absent(),
            Value<int> maxEscalations = const Value.absent(),
            Value<bool> isEnabled = const Value.absent(),
            Value<bool> notifyFamily = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              RemindersCompanion(
            id: id,
            userId: userId,
            petId: petId,
            type: type,
            title: title,
            description: description,
            scheduleRule: scheduleRule,
            payload: payload,
            nextTriggerAt: nextTriggerAt,
            lastTriggeredAt: lastTriggeredAt,
            escalationCount: escalationCount,
            maxEscalations: maxEscalations,
            isEnabled: isEnabled,
            notifyFamily: notifyFamily,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            Value<int?> petId = const Value.absent(),
            required String type,
            required String title,
            Value<String?> description = const Value.absent(),
            required String scheduleRule,
            Value<String?> payload = const Value.absent(),
            required DateTime nextTriggerAt,
            Value<DateTime?> lastTriggeredAt = const Value.absent(),
            Value<int> escalationCount = const Value.absent(),
            Value<int> maxEscalations = const Value.absent(),
            Value<bool> isEnabled = const Value.absent(),
            Value<bool> notifyFamily = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              RemindersCompanion.insert(
            id: id,
            userId: userId,
            petId: petId,
            type: type,
            title: title,
            description: description,
            scheduleRule: scheduleRule,
            payload: payload,
            nextTriggerAt: nextTriggerAt,
            lastTriggeredAt: lastTriggeredAt,
            escalationCount: escalationCount,
            maxEscalations: maxEscalations,
            isEnabled: isEnabled,
            notifyFamily: notifyFamily,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RemindersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userId = false, petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$RemindersTableReferences._userIdTable(db),
                    referencedColumn:
                        $$RemindersTableReferences._userIdTable(db).id,
                  ) as T;
                }
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable: $$RemindersTableReferences._petIdTable(db),
                    referencedColumn:
                        $$RemindersTableReferences._petIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RemindersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RemindersTable,
    Reminder,
    $$RemindersTableFilterComposer,
    $$RemindersTableOrderingComposer,
    $$RemindersTableAnnotationComposer,
    $$RemindersTableCreateCompanionBuilder,
    $$RemindersTableUpdateCompanionBuilder,
    (Reminder, $$RemindersTableReferences),
    Reminder,
    PrefetchHooks Function({bool userId, bool petId})>;
typedef $$AppointmentsTableCreateCompanionBuilder = AppointmentsCompanion
    Function({
  Value<int> id,
  required int petId,
  required String title,
  Value<String?> clinicName,
  Value<String?> clinicAddress,
  Value<String?> clinicPhone,
  Value<String?> clinicWebsite,
  Value<double?> clinicLatitude,
  Value<double?> clinicLongitude,
  required DateTime appointmentDate,
  Value<int> durationMinutes,
  Value<String?> type,
  Value<String?> notes,
  Value<bool> reminderSet,
  Value<DateTime?> reminderTime,
  Value<bool> isCompleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$AppointmentsTableUpdateCompanionBuilder = AppointmentsCompanion
    Function({
  Value<int> id,
  Value<int> petId,
  Value<String> title,
  Value<String?> clinicName,
  Value<String?> clinicAddress,
  Value<String?> clinicPhone,
  Value<String?> clinicWebsite,
  Value<double?> clinicLatitude,
  Value<double?> clinicLongitude,
  Value<DateTime> appointmentDate,
  Value<int> durationMinutes,
  Value<String?> type,
  Value<String?> notes,
  Value<bool> reminderSet,
  Value<DateTime?> reminderTime,
  Value<bool> isCompleted,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$AppointmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AppointmentsTable, Appointment> {
  $$AppointmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets
      .createAlias($_aliasNameGenerator(db.appointments.petId, db.pets.id));

  $$PetsTableProcessedTableManager get petId {
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AppointmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clinicName => $composableBuilder(
      column: $table.clinicName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clinicAddress => $composableBuilder(
      column: $table.clinicAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clinicPhone => $composableBuilder(
      column: $table.clinicPhone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clinicWebsite => $composableBuilder(
      column: $table.clinicWebsite, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get clinicLatitude => $composableBuilder(
      column: $table.clinicLatitude,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get clinicLongitude => $composableBuilder(
      column: $table.clinicLongitude,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get reminderSet => $composableBuilder(
      column: $table.reminderSet, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get reminderTime => $composableBuilder(
      column: $table.reminderTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AppointmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clinicName => $composableBuilder(
      column: $table.clinicName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clinicAddress => $composableBuilder(
      column: $table.clinicAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clinicPhone => $composableBuilder(
      column: $table.clinicPhone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clinicWebsite => $composableBuilder(
      column: $table.clinicWebsite,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get clinicLatitude => $composableBuilder(
      column: $table.clinicLatitude,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get clinicLongitude => $composableBuilder(
      column: $table.clinicLongitude,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get reminderSet => $composableBuilder(
      column: $table.reminderSet, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get reminderTime => $composableBuilder(
      column: $table.reminderTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableOrderingComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AppointmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get clinicName => $composableBuilder(
      column: $table.clinicName, builder: (column) => column);

  GeneratedColumn<String> get clinicAddress => $composableBuilder(
      column: $table.clinicAddress, builder: (column) => column);

  GeneratedColumn<String> get clinicPhone => $composableBuilder(
      column: $table.clinicPhone, builder: (column) => column);

  GeneratedColumn<String> get clinicWebsite => $composableBuilder(
      column: $table.clinicWebsite, builder: (column) => column);

  GeneratedColumn<double> get clinicLatitude => $composableBuilder(
      column: $table.clinicLatitude, builder: (column) => column);

  GeneratedColumn<double> get clinicLongitude => $composableBuilder(
      column: $table.clinicLongitude, builder: (column) => column);

  GeneratedColumn<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get reminderSet => $composableBuilder(
      column: $table.reminderSet, builder: (column) => column);

  GeneratedColumn<DateTime> get reminderTime => $composableBuilder(
      column: $table.reminderTime, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AppointmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppointmentsTable,
    Appointment,
    $$AppointmentsTableFilterComposer,
    $$AppointmentsTableOrderingComposer,
    $$AppointmentsTableAnnotationComposer,
    $$AppointmentsTableCreateCompanionBuilder,
    $$AppointmentsTableUpdateCompanionBuilder,
    (Appointment, $$AppointmentsTableReferences),
    Appointment,
    PrefetchHooks Function({bool petId})> {
  $$AppointmentsTableTableManager(_$AppDatabase db, $AppointmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppointmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppointmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppointmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> petId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> clinicName = const Value.absent(),
            Value<String?> clinicAddress = const Value.absent(),
            Value<String?> clinicPhone = const Value.absent(),
            Value<String?> clinicWebsite = const Value.absent(),
            Value<double?> clinicLatitude = const Value.absent(),
            Value<double?> clinicLongitude = const Value.absent(),
            Value<DateTime> appointmentDate = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> reminderSet = const Value.absent(),
            Value<DateTime?> reminderTime = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              AppointmentsCompanion(
            id: id,
            petId: petId,
            title: title,
            clinicName: clinicName,
            clinicAddress: clinicAddress,
            clinicPhone: clinicPhone,
            clinicWebsite: clinicWebsite,
            clinicLatitude: clinicLatitude,
            clinicLongitude: clinicLongitude,
            appointmentDate: appointmentDate,
            durationMinutes: durationMinutes,
            type: type,
            notes: notes,
            reminderSet: reminderSet,
            reminderTime: reminderTime,
            isCompleted: isCompleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int petId,
            required String title,
            Value<String?> clinicName = const Value.absent(),
            Value<String?> clinicAddress = const Value.absent(),
            Value<String?> clinicPhone = const Value.absent(),
            Value<String?> clinicWebsite = const Value.absent(),
            Value<double?> clinicLatitude = const Value.absent(),
            Value<double?> clinicLongitude = const Value.absent(),
            required DateTime appointmentDate,
            Value<int> durationMinutes = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> reminderSet = const Value.absent(),
            Value<DateTime?> reminderTime = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              AppointmentsCompanion.insert(
            id: id,
            petId: petId,
            title: title,
            clinicName: clinicName,
            clinicAddress: clinicAddress,
            clinicPhone: clinicPhone,
            clinicWebsite: clinicWebsite,
            clinicLatitude: clinicLatitude,
            clinicLongitude: clinicLongitude,
            appointmentDate: appointmentDate,
            durationMinutes: durationMinutes,
            type: type,
            notes: notes,
            reminderSet: reminderSet,
            reminderTime: reminderTime,
            isCompleted: isCompleted,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AppointmentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable:
                        $$AppointmentsTableReferences._petIdTable(db),
                    referencedColumn:
                        $$AppointmentsTableReferences._petIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AppointmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppointmentsTable,
    Appointment,
    $$AppointmentsTableFilterComposer,
    $$AppointmentsTableOrderingComposer,
    $$AppointmentsTableAnnotationComposer,
    $$AppointmentsTableCreateCompanionBuilder,
    $$AppointmentsTableUpdateCompanionBuilder,
    (Appointment, $$AppointmentsTableReferences),
    Appointment,
    PrefetchHooks Function({bool petId})>;
typedef $$WeightEntriesTableCreateCompanionBuilder = WeightEntriesCompanion
    Function({
  Value<int> id,
  required int petId,
  required double weight,
  Value<String> unit,
  required DateTime date,
  Value<String?> notes,
  Value<String> source,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$WeightEntriesTableUpdateCompanionBuilder = WeightEntriesCompanion
    Function({
  Value<int> id,
  Value<int> petId,
  Value<double> weight,
  Value<String> unit,
  Value<DateTime> date,
  Value<String?> notes,
  Value<String> source,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$WeightEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $WeightEntriesTable, WeightEntry> {
  $$WeightEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets
      .createAlias($_aliasNameGenerator(db.weightEntries.petId, db.pets.id));

  $$PetsTableProcessedTableManager get petId {
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WeightEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $WeightEntriesTable> {
  $$WeightEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WeightEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightEntriesTable> {
  $$WeightEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableOrderingComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WeightEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightEntriesTable> {
  $$WeightEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WeightEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WeightEntriesTable,
    WeightEntry,
    $$WeightEntriesTableFilterComposer,
    $$WeightEntriesTableOrderingComposer,
    $$WeightEntriesTableAnnotationComposer,
    $$WeightEntriesTableCreateCompanionBuilder,
    $$WeightEntriesTableUpdateCompanionBuilder,
    (WeightEntry, $$WeightEntriesTableReferences),
    WeightEntry,
    PrefetchHooks Function({bool petId})> {
  $$WeightEntriesTableTableManager(_$AppDatabase db, $WeightEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> petId = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              WeightEntriesCompanion(
            id: id,
            petId: petId,
            weight: weight,
            unit: unit,
            date: date,
            notes: notes,
            source: source,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int petId,
            required double weight,
            Value<String> unit = const Value.absent(),
            required DateTime date,
            Value<String?> notes = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              WeightEntriesCompanion.insert(
            id: id,
            petId: petId,
            weight: weight,
            unit: unit,
            date: date,
            notes: notes,
            source: source,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WeightEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable:
                        $$WeightEntriesTableReferences._petIdTable(db),
                    referencedColumn:
                        $$WeightEntriesTableReferences._petIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WeightEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WeightEntriesTable,
    WeightEntry,
    $$WeightEntriesTableFilterComposer,
    $$WeightEntriesTableOrderingComposer,
    $$WeightEntriesTableAnnotationComposer,
    $$WeightEntriesTableCreateCompanionBuilder,
    $$WeightEntriesTableUpdateCompanionBuilder,
    (WeightEntry, $$WeightEntriesTableReferences),
    WeightEntry,
    PrefetchHooks Function({bool petId})>;
typedef $$DocumentsTableCreateCompanionBuilder = DocumentsCompanion Function({
  Value<int> id,
  required int petId,
  required String title,
  required String type,
  Value<String?> fileUrl,
  Value<String?> localPath,
  Value<String?> mimeType,
  Value<int?> fileSize,
  Value<DateTime?> documentDate,
  Value<String?> tags,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$DocumentsTableUpdateCompanionBuilder = DocumentsCompanion Function({
  Value<int> id,
  Value<int> petId,
  Value<String> title,
  Value<String> type,
  Value<String?> fileUrl,
  Value<String?> localPath,
  Value<String?> mimeType,
  Value<int?> fileSize,
  Value<DateTime?> documentDate,
  Value<String?> tags,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$DocumentsTableReferences
    extends BaseReferences<_$AppDatabase, $DocumentsTable, Document> {
  $$DocumentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias($_aliasNameGenerator(db.documents.petId, db.pets.id));

  $$PetsTableProcessedTableManager get petId {
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileUrl => $composableBuilder(
      column: $table.fileUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get documentDate => $composableBuilder(
      column: $table.documentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileUrl => $composableBuilder(
      column: $table.fileUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mimeType => $composableBuilder(
      column: $table.mimeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get documentDate => $composableBuilder(
      column: $table.documentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableOrderingComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<DateTime> get documentDate => $composableBuilder(
      column: $table.documentDate, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DocumentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DocumentsTable,
    Document,
    $$DocumentsTableFilterComposer,
    $$DocumentsTableOrderingComposer,
    $$DocumentsTableAnnotationComposer,
    $$DocumentsTableCreateCompanionBuilder,
    $$DocumentsTableUpdateCompanionBuilder,
    (Document, $$DocumentsTableReferences),
    Document,
    PrefetchHooks Function({bool petId})> {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> petId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> fileUrl = const Value.absent(),
            Value<String?> localPath = const Value.absent(),
            Value<String?> mimeType = const Value.absent(),
            Value<int?> fileSize = const Value.absent(),
            Value<DateTime?> documentDate = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DocumentsCompanion(
            id: id,
            petId: petId,
            title: title,
            type: type,
            fileUrl: fileUrl,
            localPath: localPath,
            mimeType: mimeType,
            fileSize: fileSize,
            documentDate: documentDate,
            tags: tags,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int petId,
            required String title,
            required String type,
            Value<String?> fileUrl = const Value.absent(),
            Value<String?> localPath = const Value.absent(),
            Value<String?> mimeType = const Value.absent(),
            Value<int?> fileSize = const Value.absent(),
            Value<DateTime?> documentDate = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DocumentsCompanion.insert(
            id: id,
            petId: petId,
            title: title,
            type: type,
            fileUrl: fileUrl,
            localPath: localPath,
            mimeType: mimeType,
            fileSize: fileSize,
            documentDate: documentDate,
            tags: tags,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DocumentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable: $$DocumentsTableReferences._petIdTable(db),
                    referencedColumn:
                        $$DocumentsTableReferences._petIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DocumentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DocumentsTable,
    Document,
    $$DocumentsTableFilterComposer,
    $$DocumentsTableOrderingComposer,
    $$DocumentsTableAnnotationComposer,
    $$DocumentsTableCreateCompanionBuilder,
    $$DocumentsTableUpdateCompanionBuilder,
    (Document, $$DocumentsTableReferences),
    Document,
    PrefetchHooks Function({bool petId})>;
typedef $$FamilyMembersTableCreateCompanionBuilder = FamilyMembersCompanion
    Function({
  Value<int> id,
  required int petId,
  Value<int?> userId,
  required String email,
  Value<String?> name,
  Value<String> role,
  Value<String> status,
  required String invitedBy,
  Value<DateTime> invitedAt,
  Value<DateTime?> respondedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$FamilyMembersTableUpdateCompanionBuilder = FamilyMembersCompanion
    Function({
  Value<int> id,
  Value<int> petId,
  Value<int?> userId,
  Value<String> email,
  Value<String?> name,
  Value<String> role,
  Value<String> status,
  Value<String> invitedBy,
  Value<DateTime> invitedAt,
  Value<DateTime?> respondedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$FamilyMembersTableReferences
    extends BaseReferences<_$AppDatabase, $FamilyMembersTable, FamilyMember> {
  $$FamilyMembersTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets
      .createAlias($_aliasNameGenerator(db.familyMembers.petId, db.pets.id));

  $$PetsTableProcessedTableManager get petId {
    final manager = $$PetsTableTableManager($_db, $_db.pets)
        .filter((f) => f.id($_item.petId));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.familyMembers.userId, db.users.id));

  $$UsersTableProcessedTableManager? get userId {
    if ($_item.userId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId!));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FamilyMembersTableFilterComposer
    extends Composer<_$AppDatabase, $FamilyMembersTable> {
  $$FamilyMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invitedBy => $composableBuilder(
      column: $table.invitedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get invitedAt => $composableBuilder(
      column: $table.invitedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get respondedAt => $composableBuilder(
      column: $table.respondedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableFilterComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FamilyMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $FamilyMembersTable> {
  $$FamilyMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invitedBy => $composableBuilder(
      column: $table.invitedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get invitedAt => $composableBuilder(
      column: $table.invitedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get respondedAt => $composableBuilder(
      column: $table.respondedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableOrderingComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FamilyMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FamilyMembersTable> {
  $$FamilyMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get invitedBy =>
      $composableBuilder(column: $table.invitedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get invitedAt =>
      $composableBuilder(column: $table.invitedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get respondedAt => $composableBuilder(
      column: $table.respondedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.petId,
        referencedTable: $db.pets,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PetsTableAnnotationComposer(
              $db: $db,
              $table: $db.pets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FamilyMembersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FamilyMembersTable,
    FamilyMember,
    $$FamilyMembersTableFilterComposer,
    $$FamilyMembersTableOrderingComposer,
    $$FamilyMembersTableAnnotationComposer,
    $$FamilyMembersTableCreateCompanionBuilder,
    $$FamilyMembersTableUpdateCompanionBuilder,
    (FamilyMember, $$FamilyMembersTableReferences),
    FamilyMember,
    PrefetchHooks Function({bool petId, bool userId})> {
  $$FamilyMembersTableTableManager(_$AppDatabase db, $FamilyMembersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FamilyMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FamilyMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FamilyMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> petId = const Value.absent(),
            Value<int?> userId = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> invitedBy = const Value.absent(),
            Value<DateTime> invitedAt = const Value.absent(),
            Value<DateTime?> respondedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FamilyMembersCompanion(
            id: id,
            petId: petId,
            userId: userId,
            email: email,
            name: name,
            role: role,
            status: status,
            invitedBy: invitedBy,
            invitedAt: invitedAt,
            respondedAt: respondedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int petId,
            Value<int?> userId = const Value.absent(),
            required String email,
            Value<String?> name = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String> status = const Value.absent(),
            required String invitedBy,
            Value<DateTime> invitedAt = const Value.absent(),
            Value<DateTime?> respondedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              FamilyMembersCompanion.insert(
            id: id,
            petId: petId,
            userId: userId,
            email: email,
            name: name,
            role: role,
            status: status,
            invitedBy: invitedBy,
            invitedAt: invitedAt,
            respondedAt: respondedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FamilyMembersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({petId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (petId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.petId,
                    referencedTable:
                        $$FamilyMembersTableReferences._petIdTable(db),
                    referencedColumn:
                        $$FamilyMembersTableReferences._petIdTable(db).id,
                  ) as T;
                }
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$FamilyMembersTableReferences._userIdTable(db),
                    referencedColumn:
                        $$FamilyMembersTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FamilyMembersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FamilyMembersTable,
    FamilyMember,
    $$FamilyMembersTableFilterComposer,
    $$FamilyMembersTableOrderingComposer,
    $$FamilyMembersTableAnnotationComposer,
    $$FamilyMembersTableCreateCompanionBuilder,
    $$FamilyMembersTableUpdateCompanionBuilder,
    (FamilyMember, $$FamilyMembersTableReferences),
    FamilyMember,
    PrefetchHooks Function({bool petId, bool userId})>;
typedef $$ServiceConfigsTableCreateCompanionBuilder = ServiceConfigsCompanion
    Function({
  Value<int> id,
  required String serviceId,
  required String name,
  Value<String?> description,
  Value<String?> iconName,
  Value<String?> route,
  Value<bool> isEnabled,
  Value<String?> settingsSchema,
  Value<String?> reminderTypes,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ServiceConfigsTableUpdateCompanionBuilder = ServiceConfigsCompanion
    Function({
  Value<int> id,
  Value<String> serviceId,
  Value<String> name,
  Value<String?> description,
  Value<String?> iconName,
  Value<String?> route,
  Value<bool> isEnabled,
  Value<String?> settingsSchema,
  Value<String?> reminderTypes,
  Value<int> sortOrder,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$ServiceConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceConfigsTable> {
  $$ServiceConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serviceId => $composableBuilder(
      column: $table.serviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get route => $composableBuilder(
      column: $table.route, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isEnabled => $composableBuilder(
      column: $table.isEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get settingsSchema => $composableBuilder(
      column: $table.settingsSchema,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reminderTypes => $composableBuilder(
      column: $table.reminderTypes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ServiceConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceConfigsTable> {
  $$ServiceConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serviceId => $composableBuilder(
      column: $table.serviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get route => $composableBuilder(
      column: $table.route, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
      column: $table.isEnabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get settingsSchema => $composableBuilder(
      column: $table.settingsSchema,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reminderTypes => $composableBuilder(
      column: $table.reminderTypes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ServiceConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceConfigsTable> {
  $$ServiceConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<String> get route =>
      $composableBuilder(column: $table.route, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<String> get settingsSchema => $composableBuilder(
      column: $table.settingsSchema, builder: (column) => column);

  GeneratedColumn<String> get reminderTypes => $composableBuilder(
      column: $table.reminderTypes, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ServiceConfigsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ServiceConfigsTable,
    ServiceConfig,
    $$ServiceConfigsTableFilterComposer,
    $$ServiceConfigsTableOrderingComposer,
    $$ServiceConfigsTableAnnotationComposer,
    $$ServiceConfigsTableCreateCompanionBuilder,
    $$ServiceConfigsTableUpdateCompanionBuilder,
    (
      ServiceConfig,
      BaseReferences<_$AppDatabase, $ServiceConfigsTable, ServiceConfig>
    ),
    ServiceConfig,
    PrefetchHooks Function()> {
  $$ServiceConfigsTableTableManager(
      _$AppDatabase db, $ServiceConfigsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceConfigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> serviceId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<String?> route = const Value.absent(),
            Value<bool> isEnabled = const Value.absent(),
            Value<String?> settingsSchema = const Value.absent(),
            Value<String?> reminderTypes = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ServiceConfigsCompanion(
            id: id,
            serviceId: serviceId,
            name: name,
            description: description,
            iconName: iconName,
            route: route,
            isEnabled: isEnabled,
            settingsSchema: settingsSchema,
            reminderTypes: reminderTypes,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String serviceId,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> iconName = const Value.absent(),
            Value<String?> route = const Value.absent(),
            Value<bool> isEnabled = const Value.absent(),
            Value<String?> settingsSchema = const Value.absent(),
            Value<String?> reminderTypes = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ServiceConfigsCompanion.insert(
            id: id,
            serviceId: serviceId,
            name: name,
            description: description,
            iconName: iconName,
            route: route,
            isEnabled: isEnabled,
            settingsSchema: settingsSchema,
            reminderTypes: reminderTypes,
            sortOrder: sortOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ServiceConfigsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ServiceConfigsTable,
    ServiceConfig,
    $$ServiceConfigsTableFilterComposer,
    $$ServiceConfigsTableOrderingComposer,
    $$ServiceConfigsTableAnnotationComposer,
    $$ServiceConfigsTableCreateCompanionBuilder,
    $$ServiceConfigsTableUpdateCompanionBuilder,
    (
      ServiceConfig,
      BaseReferences<_$AppDatabase, $ServiceConfigsTable, ServiceConfig>
    ),
    ServiceConfig,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$PetsTableTableManager get pets => $$PetsTableTableManager(_db, _db.pets);
  $$VaccinesTableTableManager get vaccines =>
      $$VaccinesTableTableManager(_db, _db.vaccines);
  $$VaccinationRecordsTableTableManager get vaccinationRecords =>
      $$VaccinationRecordsTableTableManager(_db, _db.vaccinationRecords);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$DoseSchedulesTableTableManager get doseSchedules =>
      $$DoseSchedulesTableTableManager(_db, _db.doseSchedules);
  $$DoseLogsTableTableManager get doseLogs =>
      $$DoseLogsTableTableManager(_db, _db.doseLogs);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$AppointmentsTableTableManager get appointments =>
      $$AppointmentsTableTableManager(_db, _db.appointments);
  $$WeightEntriesTableTableManager get weightEntries =>
      $$WeightEntriesTableTableManager(_db, _db.weightEntries);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$FamilyMembersTableTableManager get familyMembers =>
      $$FamilyMembersTableTableManager(_db, _db.familyMembers);
  $$ServiceConfigsTableTableManager get serviceConfigs =>
      $$ServiceConfigsTableTableManager(_db, _db.serviceConfigs);
}
