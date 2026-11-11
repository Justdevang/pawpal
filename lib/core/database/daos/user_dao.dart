// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/users.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<User?> getUserByFirebaseUid(String firebaseUid) {
    return (select(users)..where((u) => u.firebaseUid.equals(firebaseUid))).getSingleOrNull();
  }

  Future<User?> getCurrentUser() {
    return select(users).getSingleOrNull();
  }

  Future<int> insertUser(UsersCompanion user) {
    return into(users).insert(user);
  }

  Future<bool> updateUser(UsersCompanion user) {
    return update(users).replace(user);
  }

  Future<int> deleteUser(int id) {
    return (delete(users)..where((u) => u.id.equals(id))).go();
  }

  Stream<User?> watchCurrentUser() {
    return select(users).watchSingleOrNull();
  }
}