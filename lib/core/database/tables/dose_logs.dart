// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'medications.dart';
import 'dose_schedules.dart';

@DataClassName('DoseLog')
class DoseLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicationId => integer().references(Medications, #id, onDelete: KeyAction.cascade)();
  IntColumn get doseScheduleId => integer().references(DoseSchedules, #id, onDelete: KeyAction.setNull).nullable()();
  DateTimeColumn get scheduledTime => dateTime()();
  DateTimeColumn get actualTime => dateTime().nullable()();
  BoolColumn get wasTaken => boolean().withDefault(const Constant(false))();
  BoolColumn get wasSkipped => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  TextColumn get sideEffects => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}