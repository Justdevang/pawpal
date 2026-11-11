// ignore_for_file: type=lint
import 'package:drift/drift.dart';

@DataClassName('ServiceConfig')
class ServiceConfigs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serviceId => text().unique()(); // unique identifier for the service
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get iconName => text().nullable()();
  TextColumn get route => text().nullable()();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  TextColumn get settingsSchema => text().nullable()(); // JSON schema for service settings
  TextColumn get reminderTypes => text().nullable()(); // JSON array of reminder types this service provides
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}