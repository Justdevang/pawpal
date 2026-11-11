// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'medications.dart';

@DataClassName('DoseSchedule')
class DoseSchedules extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicationId => integer().references(Medications, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get scheduledTime => dateTime()();
  BoolColumn get isTaken => boolean().withDefault(const Constant(false))();
  BoolColumn get isSkipped => boolean().withDefault(const Constant(false))();
  DateTimeColumn get takenAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}