// ignore_for_file: type=lint
import 'package:drift/drift.dart';

@DataClassName('Vaccine')
class Vaccines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get species => text()(); // dog, cat, etc.
  TextColumn get description => text().nullable()();
  IntColumn get initialDoseWeeks => integer().nullable()(); // weeks after birth
  IntColumn get boosterIntervalWeeks => integer().nullable()(); // weeks between boosters
  IntColumn get boosterCount => integer().nullable()(); // number of boosters
  TextColumn get region => text().withDefault(const Constant('global'))();
  BoolColumn get isCore => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}