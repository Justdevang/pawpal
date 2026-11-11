// ignore_for_file: type=lint
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// App update checker and manager
class AppUpdater {
  static const String _playStoreUrl = 'https://play.google.com/store/apps/details?id=com.pawpal.app';
  static const String _appStoreUrl = 'https://apps.apple.com/app/id6450000000'; // Replace with actual App Store ID
  static const String _updateCheckUrl = 'https://api.pawpal.app/v1/app/update/check';

  /// Check for app updates
  static Future<UpdateInfo?> checkForUpdates() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      debugPrint('Checking updates for ${packageInfo.version}+${packageInfo.buildNumber} from $_updateCheckUrl');

      return null;
    } catch (e) {
      debugPrint('Update check failed: $e');
      return null;
    }
  }

  /// Open store page for update
  static Future<void> openStorePage() async {
    final url = defaultTargetPlatform == TargetPlatform.android
        ? _playStoreUrl
        : _appStoreUrl;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// Show update dialog
  static void showUpdateDialog(BuildContext context, UpdateInfo info) {
    showDialog(
      context: context,
      barrierDismissible: !info.isRequired,
      builder: (context) => AlertDialog(
        title: Text(info.isRequired ? 'Update Required' : 'Update Available'),
        content: Text(info.releaseNotes),
        actions: [
          if (!info.isRequired)
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Later'),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              openStorePage();
            },
            child: const Text('Update Now'),
          ),
        ],
      ),
    );
  }
}

/// Update information
class UpdateInfo {
  final String version;
  final int buildNumber;
  final String releaseNotes;
  final bool isRequired;
  final String minSupportedVersion;
  final String downloadUrl;

  UpdateInfo({
    required this.version,
    required this.buildNumber,
    required this.releaseNotes,
    required this.isRequired,
    required this.minSupportedVersion,
    required this.downloadUrl,
  });

  factory UpdateInfo.fromJson(Map<String, dynamic> json) {
    return UpdateInfo(
      version: json['version'] as String,
      buildNumber: json['build_number'] as int,
      releaseNotes: json['release_notes'] as String,
      isRequired: json['is_required'] as bool? ?? false,
      minSupportedVersion: json['min_supported_version'] as String? ?? '1.0.0',
      downloadUrl: json['download_url'] as String? ?? '',
    );
  }
}

/// Riverpod provider for AppUpdater
final appUpdaterProvider = Provider<AppUpdater>((ref) {
  return AppUpdater();
});

/// Auto-update check provider
final autoUpdateCheckProvider = FutureProvider<UpdateInfo?>((ref) async {
  return await AppUpdater.checkForUpdates();
});