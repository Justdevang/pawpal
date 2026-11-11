// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'pets.dart';

@DataClassName('Appointment')
class Appointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get clinicName => text().nullable()();
  TextColumn get clinicAddress => text().nullable()();
  TextColumn get clinicPhone => text().nullable()();
  TextColumn get clinicWebsite => text().nullable()();
  RealColumn get clinicLatitude => real().nullable()();
  RealColumn get clinicLongitude => real().nullable()();
  DateTimeColumn get appointmentDate => dateTime()();
  IntColumn get durationMinutes => integer().withDefault(const Constant(30))();
  TextColumn get type => text().nullable()(); // vaccination, checkup, surgery, grooming, other
  TextColumn get notes => text().nullable()();
  BoolColumn get reminderSet => boolean().withDefault(const Constant(false))();
  DateTimeColumn get reminderTime => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}