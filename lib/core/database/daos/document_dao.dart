// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/documents.dart';

part 'document_dao.g.dart';

@DriftAccessor(tables: [Documents])
class DocumentDao extends DatabaseAccessor<AppDatabase> with _$DocumentDaoMixin {
  DocumentDao(super.db);

  Future<List<Document>> getDocumentsByPetId(int petId) {
    return (select(documents)
          ..where((d) => d.petId.equals(petId) & d.deletedAt.isNull())
          ..orderBy([(d) => OrderingTerm.desc(d.documentDate)]))
        .get();
  }

  Stream<List<Document>> watchDocumentsByPetId(int petId) {
    return (select(documents)
          ..where((d) => d.petId.equals(petId) & d.deletedAt.isNull())
          ..orderBy([(d) => OrderingTerm.desc(d.documentDate)]))
        .watch();
  }

  Future<Document?> getDocumentById(int id) {
    return (select(documents)..where((d) => d.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertDocument(DocumentsCompanion document) {
    return into(documents).insert(document);
  }

  Future<bool> updateDocument(DocumentsCompanion document) {
    return update(documents).replace(document);
  }

  Future<int> softDeleteDocument(int id) {
    return (update(documents)..where((d) => d.id.equals(id)))
        .write(DocumentsCompanion(deletedAt: Value(DateTime.now())));
  }
}