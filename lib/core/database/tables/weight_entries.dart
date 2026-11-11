// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'pets.dart';

@DataClassName('WeightEntry')
class WeightEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().references(Pets, #id, onDelete: KeyAction.cascade)();
  RealColumn get weight => real()();
  TextColumn get unit => text().withDefault(const Constant('kg'))();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();
  TextColumn get source => text().withDefault(const Constant('manual'))(); // manual, smart_scale, vet
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}