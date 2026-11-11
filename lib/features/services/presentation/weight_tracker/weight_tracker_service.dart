// ignore_for_file: type=lint
import 'package:drift/drift.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/daos/weight_entry_dao.dart';
import '../../../../core/database/database.dart';
import '../../../../core/di/providers.dart';

/// Weight Tracker Service
class WeightTrackerService {
  static const String serviceId = 'weight_tracker';
  static const String name = 'Weight Tracker';
  static const String description = 'Monitor growth & health';
  static const String iconName = 'monitor_weight';
  static const String route = '/services/weight_tracker';
  static const List<String> reminderTypes = ['weight_check'];
  static const int sortOrder = 2;

  final WeightEntryDao _weightEntryDao;
  // ignore: unused_field
  final AppDatabase _database;

  WeightTrackerService(this._weightEntryDao, this._database);

  /// Get weight entries for a pet
  Future<List<WeightEntry>> getWeightEntries(int petId) async {
    return _weightEntryDao.getWeightEntriesByPetId(petId);
  }

  /// Watch weight entries for a pet
  Stream<List<WeightEntry>> watchWeightEntries(int petId) {
    return _weightEntryDao.watchWeightEntriesByPetId(petId);
  }

  /// Get latest weight entry
  Future<WeightEntry?> getLatestWeight(int petId) async {
    return _weightEntryDao.getLatestWeightEntry(petId);
  }

  /// Create weight entry
  Future<WeightEntry> createWeightEntry(WeightEntry entry) async {
    final id = await _weightEntryDao.insertWeightEntry(entry.toCompanion(true));
    final created = await _weightEntryDao.getWeightEntryById(id);
    if (created == null) throw Exception('Failed to create weight entry');
    return created;
  }

  /// Update weight entry
  Future<void> updateWeightEntry(WeightEntry entry) async {
    await _weightEntryDao.updateWeightEntry(entry.toCompanion(true));
  }

  /// Delete weight entry
  Future<void> deleteWeightEntry(int id) async {
    await _weightEntryDao.softDeleteWeightEntry(id);
  }

  /// Get weight entry by ID
  Future<WeightEntry?> getWeightEntry(int id) async {
    return _weightEntryDao.getWeightEntryById(id);
  }

  /// Get chart data for fl_chart
  List<FlSpot> getChartData(List<WeightEntry> entries) {
    final sorted = List<WeightEntry>.from(entries)
      ..sort((a, b) => a.date.compareTo(b.date));
    return sorted.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.weight);
    }).toList();
  }

  /// Calculate weight trend
  WeightTrend calculateTrend(List<WeightEntry> entries) {
    if (entries.length < 2) return WeightTrend.stable;

    final sorted = List<WeightEntry>.from(entries)
      ..sort((a, b) => a.date.compareTo(b.date));

    final first = sorted.first.weight;
    final last = sorted.last.weight;
    final diff = last - first;
    final percentChange = (diff / first) * 100;

    if (percentChange > 5) return WeightTrend.increasing;
    if (percentChange < -5) return WeightTrend.decreasing;
    return WeightTrend.stable;
  }
}

enum WeightTrend {
  increasing,
  decreasing,
  stable,
}

/// Riverpod provider for WeightTrackerService
final weightTrackerServiceProvider = Provider<WeightTrackerService>((ref) {
  return WeightTrackerService(
    ref.watch(weightEntryDaoProvider),
    ref.watch(databaseProvider),
  );
});

extension WeightEntryCompanionX on WeightEntry {
  WeightEntriesCompanion toCompanion({bool insert = false}) {
    return WeightEntriesCompanion(
      id: insert ? const Value.absent() : Value(id),
      petId: Value(petId),
      weight: Value(weight),
      unit: Value(unit),
      date: Value(date),
      notes: Value(notes),
      source: Value(source),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: Value(deletedAt),
    );
  }
}