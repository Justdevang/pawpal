// ignore_for_file: type=lint
import 'package:riverpod/riverpod.dart';

import 'entities/service.dart';

/// Central registry for all app services
/// Adding a new service only requires:
/// 1. Creating the service class implementing ServiceInterface
/// 2. Registering it here in _serviceFactories
class ServicesRegistry {
  static final Map<String, ServiceInterface Function()> _serviceFactories = {};

  /// Register a service factory
  static void registerService(String id, ServiceInterface Function() factory) {
    _serviceFactories[id] = factory;
  }

  /// Get all registered services
  static Map<String, ServiceInterface> getAllServices() {
    final services = <String, ServiceInterface>{};
    _serviceFactories.forEach((id, factory) {
      services[id] = factory();
    });
    return services;
  }

  /// Get enabled services sorted by sortOrder
  static List<ServiceInterface> getEnabledServices() {
    final services = getAllServices().values.toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return services.where((s) => s.isEnabled).toList();
  }

  /// Get service by ID
  static ServiceInterface? getService(String id) {
    return _serviceFactories[id]?.call();
  }

  /// Initialize all services
  static Future<void> initializeAll() async {
    for (final service in getAllServices().values) {
      await service.initialize();
    }
  }
}

/// Riverpod provider for services registry
final servicesRegistryProvider = Provider<ServicesRegistry>((ref) {
  return ServicesRegistry();
});

/// Provider for enabled services list
final enabledServicesProvider = FutureProvider<List<ServiceInterface>>((ref) async {
  await ServicesRegistry.initializeAll();
  return ServicesRegistry.getEnabledServices();
});