// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'users.dart';

@DataClassName('Pet')
class Pets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get species => text()(); // dog, cat, rabbit, hamster, bird, other
  TextColumn get breed => text().nullable()();
  TextColumn get sex => text().nullable()(); // male, female, unknown
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get approximateAge => text().nullable()(); // e.g., "2 years", "6 months"
  RealColumn get weight => real().nullable()();
  TextColumn get weightUnit => text().withDefault(const Constant('kg'))();
  TextColumn get microchipNumber => text().nullable()();
  TextColumn get photoUrl => text().nullable()();
  TextColumn get localPhotoPath => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}