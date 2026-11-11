// ignore_for_file: type=lint
import 'package:cloud_firestore/cloud_firestore.dart';

/// Conflict resolution strategies for sync
class ConflictResolver {
  /// Last-write-wins based on updatedAt timestamp
  static Map<String, dynamic> lastWriteWins(
    Map<String, dynamic> local,
    Map<String, dynamic> remote,
  ) {
    final localUpdated = local['updatedAt'] as Timestamp?;
    final remoteUpdated = remote['updatedAt'] as Timestamp?;

    if (localUpdated == null && remoteUpdated == null) return remote;
    if (localUpdated == null) return remote;
    if (remoteUpdated == null) return local;

    return localUpdated.compareTo(remoteUpdated) >= 0 ? local : remote;
  }

  /// Field-level merge for dose logs (append-only)
  static Map<String, dynamic> mergeDoseLogs(
    Map<String, dynamic> local,
    Map<String, dynamic> remote,
  ) {
    final base = Map<String, dynamic>.from(remote);

    // For dose logs, we keep both local and remote entries
    // since they're append-only audit trails
    final localLogs = local['doseLogs'] as List<dynamic>?;
    final remoteLogs = remote['doseLogs'] as List<dynamic>?;

    if (localLogs != null && remoteLogs != null) {
      // Combine and deduplicate by ID
      final allLogs = <Map<String, dynamic>>[];
      final seenIds = <String>{};

      for (final log in [...remoteLogs, ...localLogs]) {
        final id = log['id']?.toString() ?? '';
        if (id.isNotEmpty && !seenIds.contains(id)) {
          seenIds.add(id);
          allLogs.add(Map<String, dynamic>.from(log));
        }
      }

      base['doseLogs'] = allLogs;
    }

    return base;
  }

  /// Merge for medication remaining doses (take minimum)
  static Map<String, dynamic> mergeMedicationStock(
    Map<String, dynamic> local,
    Map<String, dynamic> remote,
  ) {
    final base = Map<String, dynamic>.from(remote);

    final localRemaining = local['remainingDoses'] as int?;
    final remoteRemaining = remote['remainingDoses'] as int?;

    if (localRemaining != null && remoteRemaining != null) {
      base['remainingDoses'] = localRemaining < remoteRemaining ? localRemaining : remoteRemaining;
    } else if (localRemaining != null) {
      base['remainingDoses'] = localRemaining;
    }

    return base;
  }

  /// Custom merge based on entity type
  static Map<String, dynamic> merge(
    String entityType,
    Map<String, dynamic> local,
    Map<String, dynamic> remote,
  ) {
    switch (entityType) {
      case 'medication':
        return mergeMedicationStock(local, remote);
      case 'doseLog':
        return mergeDoseLogs(local, remote);
      default:
        return lastWriteWins(local, remote);
    }
  }
}