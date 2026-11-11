// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'users.dart';
import 'pets.dart';

@DataClassName('Reminder')
class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id, onDelete: KeyAction.cascade)();
  IntColumn get petId => integer().references(Pets, #id, onDelete: KeyAction.cascade).nullable()();
  TextColumn get type => text()(); // vaccination, medication, appointment, weight, custom
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get scheduleRule => text()(); // cron expression or ISO8601 interval
  TextColumn get payload => text().nullable()(); // JSON for type-specific data
  DateTimeColumn get nextTriggerAt => dateTime()();
  DateTimeColumn get lastTriggeredAt => dateTime().nullable()();
  IntColumn get escalationCount => integer().withDefault(const Constant(0))();
  IntColumn get maxEscalations => integer().withDefault(const Constant(3))();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get notifyFamily => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}