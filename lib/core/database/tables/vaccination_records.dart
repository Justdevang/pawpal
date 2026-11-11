// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'pets.dart';
import 'vaccines.dart';

@DataClassName('VaccinationRecord')
class VaccinationRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().references(Pets, #id, onDelete: KeyAction.cascade)();
  IntColumn get vaccineId => integer().references(Vaccines, #id, onDelete: KeyAction.restrict)();
  TextColumn get vaccineName => text()(); // denormalized for offline display
  DateTimeColumn get dateGiven => dateTime()();
  DateTimeColumn get nextDueDate => dateTime().nullable()();
  TextColumn get vetClinic => text().nullable()();
  TextColumn get batchNumber => text().nullable()();
  TextColumn get certificatePhotoUrl => text().nullable()();
  TextColumn get certificateLocalPath => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}