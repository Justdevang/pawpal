import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
abstract class Service with _$Service {
  const factory Service({
    required final String id,
    required final String name,
    required final String description,
    required final String iconName,
    required final DateTime createdAt, required final DateTime updatedAt, final String? route,
    @Default(true) final bool isEnabled,
    final String? settingsSchema, // JSON schema for service settings
    final List<String>? reminderTypes, // Types of reminders this service provides
    @Default(0) final int sortOrder,
  }) = _Service;

  factory Service.fromJson(final Map<String, dynamic> json) => _$ServiceFromJson(json);
}

/// Service interface that each service must implement
abstract class ServiceInterface {
  String get id;
  String get name;
  String get description;
  String get iconName;
  String? get route;
  bool get isEnabled;
  String? get settingsSchema;
  List<String> get reminderTypes;
  int get sortOrder;

  /// Initialize the service
  Future<void> initialize();

  /// Get service-specific settings UI
  Widget? buildSettingsPage();

  /// Get service-specific home widget
  Widget? buildHomeWidget();

  /// Handle notification actions for this service
  Future<void> handleNotificationAction(final String action, final Map<String, dynamic> payload);

  /// Sync service data with cloud
  Future<void> sync();
}