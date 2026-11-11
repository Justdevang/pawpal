// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'pets.dart';

@DataClassName('Medication')
class Medications extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get dosage => text()(); // e.g., "10mg", "5ml"
  TextColumn get form => text()(); // tablet, liquid, injection, topical, etc.
  TextColumn get frequencyType => text()(); // once, daily, times_per_day, every_n_hours, specific_weekdays, custom
  IntColumn get timesPerDay => integer().nullable()();
  IntColumn get everyNHours => integer().nullable()();
  TextColumn get specificWeekdays => text().nullable()(); // JSON array of weekday indices
  TextColumn get customCron => text().nullable()(); // cron expression for custom
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  BoolColumn get withFood => boolean().withDefault(const Constant(false))();
  TextColumn get instructions => text().nullable()();
  IntColumn get remainingDoses => integer().nullable()();
  IntColumn get refillThreshold => integer().nullable()();
  TextColumn get vetClinic => text().nullable()();
  TextColumn get prescribingVet => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}