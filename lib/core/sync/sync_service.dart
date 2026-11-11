// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import '../database/database.dart';
import '../di/providers.dart';
import '../di/firebase_providers.dart';

/// Sync service for offline-first data synchronization
class SyncService {
  // ignore: unused_field
  final AppDatabase _localDb;
  // ignore: unused_field
  final FirebaseFirestore _firestore;
  final Connectivity _connectivity;
  bool _isSyncing = false;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  SyncService(this._localDb, this._firestore, this._connectivity);

  /// Initialize sync service
  Future<void> initialize() async {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((results) {
      if (results.any((r) => r != ConnectivityResult.none)) {
        _syncPendingChanges();
      }
    });

    // Initial sync
    await _syncPendingChanges();
  }

  /// Sync all pending local changes to Firestore
  Future<void> _syncPendingChanges() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      await _syncPets();
      await _syncVaccinations();
      await _syncMedications();
      await _syncReminders();
      await _syncFamilyMembers();
      await _syncWeightEntries();
    } catch (e) {
      debugPrint('Sync error: $e');
    } finally {
      _isSyncing = false;
    }
  }

  /// Sync pets
  Future<void> _syncPets() async {
    // Implementation would:
    // 1. Get local pets with unsynced changes (updatedAt > lastSyncAt)
    // 2. For each: upsert to Firestore
    // 3. Handle conflicts (last-write-wins with field-level merge for dose logs)
    // 4. Update local lastSyncAt
  }

  /// Sync vaccination records
  Future<void> _syncVaccinations() async {
    // Similar pattern to pets
  }

  /// Sync medications
  Future<void> _syncMedications() async {
    // Includes dose schedules and dose logs
    // Dose logs use field-level merge (append-only)
  }

  /// Sync reminders
  Future<void> _syncReminders() async {
    // Reminders are user-scoped
  }

  /// Sync family members
  Future<void> _syncFamilyMembers() async {
    // Invites and role changes
  }

  /// Sync weight entries
  Future<void> _syncWeightEntries() async {
    // Weight history
  }

  /// Pull remote changes to local DB
  Future<void> pullRemoteChanges() async {
    // For each collection:
    // 1. Query Firestore for documents updated after lastSyncAt
    // 2. Merge with local (last-write-wins, field-level for dose logs)
    // 3. Update local DB
  }

  /// Full bidirectional sync
  Future<void> fullSync() async {
    await _syncPendingChanges();
    await pullRemoteChanges();
  }

  /// Dispose
  void dispose() {
    _connectivitySubscription?.cancel();
  }
}

/// Riverpod provider for sync service
final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(
    ref.watch(databaseProvider),
    ref.watch(firestoreProvider),
    Connectivity(),
  );
});

/// Provider to trigger sync
final syncTriggerProvider = StateProvider<int>((ref) => 0);

/// Auto-sync on connectivity change and manual trigger
final autoSyncProvider = Provider<Stream<void>>((ref) {
  final connectivity = Connectivity();
  ref.watch(syncTriggerProvider);

  return connectivity.onConnectivityChanged
      .where((results) => results.any((r) => r != ConnectivityResult.none))
      .map((_) => ref.read(syncServiceProvider)._syncPendingChanges());
});