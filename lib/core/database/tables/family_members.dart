// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'pets.dart';
import 'users.dart';

@DataClassName('FamilyMember')
class FamilyMembers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get petId => integer().references(Pets, #id, onDelete: KeyAction.cascade)();
  IntColumn get userId => integer().references(Users, #id, onDelete: KeyAction.cascade).nullable()();
  TextColumn get email => text()();
  TextColumn get name => text().nullable()();
  TextColumn get role => text().withDefault(const Constant('viewer'))(); // owner, editor, viewer
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending, accepted, declined
  TextColumn get invitedBy => text()();
  DateTimeColumn get invitedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get respondedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}