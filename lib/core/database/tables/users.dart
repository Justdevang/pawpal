// ignore_for_file: type=lint
import 'package:drift/drift.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firebaseUid => text().unique()();
  TextColumn get email => text()();
  TextColumn get displayName => text().nullable()();
  TextColumn get photoUrl => text().nullable()();
  TextColumn get preferredLanguage => text().withDefault(const Constant('en'))();
  TextColumn get units => text().withDefault(const Constant('metric'))(); // metric/imperial
  BoolColumn get darkMode => boolean().withDefault(const Constant(false))();
  BoolColumn get notificationsEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get quietHoursStart => dateTime().nullable()();
  DateTimeColumn get quietHoursEnd => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}