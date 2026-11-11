// ignore_for_file: type=lint
import 'package:drift/drift.dart';
// ignore: deprecated_member_use
import 'package:drift/web.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    return WebDatabase('pawpal_db', logStatements: true);
  });
}
