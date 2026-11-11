// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/service_configs.dart';

part 'service_config_dao.g.dart';

@DriftAccessor(tables: [ServiceConfigs])
class ServiceConfigDao extends DatabaseAccessor<AppDatabase> with _$ServiceConfigDaoMixin {
  ServiceConfigDao(super.db);

  Future<List<ServiceConfig>> getAllEnabledServices() {
    return (select(serviceConfigs)
          ..where((s) => s.isEnabled.equals(true))
          ..orderBy([(s) => OrderingTerm.asc(s.sortOrder)]))
        .get();
  }

  Stream<List<ServiceConfig>> watchAllEnabledServices() {
    return (select(serviceConfigs)
          ..where((s) => s.isEnabled.equals(true))
          ..orderBy([(s) => OrderingTerm.asc(s.sortOrder)]))
        .watch();
  }

  Future<ServiceConfig?> getServiceById(String serviceId) {
    return (select(serviceConfigs)..where((s) => s.serviceId.equals(serviceId))).getSingleOrNull();
  }

  Future<int> insertServiceConfig(ServiceConfigsCompanion config) {
    return into(serviceConfigs).insert(config);
  }

  Future<bool> updateServiceConfig(ServiceConfigsCompanion config) {
    return update(serviceConfigs).replace(config);
  }

  Future<int> deleteServiceConfig(String serviceId) {
    return (delete(serviceConfigs)..where((s) => s.serviceId.equals(serviceId))).go();
  }
}