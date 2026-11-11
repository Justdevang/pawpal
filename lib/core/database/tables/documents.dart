// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'pets.dart';

@DataClassName('Document')
class Documents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().references(Pets, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get type => text()(); // vaccination_cert, prescription, lab_report, insurance, other
  TextColumn get fileUrl => text().nullable()();
  TextColumn get localPath => text().nullable()();
  TextColumn get mimeType => text().nullable()();
  IntColumn get fileSize => integer().nullable()();
  DateTimeColumn get documentDate => dateTime().nullable()();
  TextColumn get tags => text().nullable()(); // JSON array
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}