// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

/// Backup & Sync settings page
class BackupPage extends ConsumerWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Backup & Sync',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, color: colors.bodyTextColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cloud Backup',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildSettingCard(
                context,
                title: 'Auto Backup',
                subtitle: 'Automatically backup to cloud daily',
                icon: Icons.cloud_upload_rounded,
                trailing: Switch(
                  value: true, // TODO: Get from preferences
                  onChanged: (v) {},
                  activeThumbColor: colors.primary,
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                context,
                title: 'Backup Frequency',
                subtitle: 'Daily',
                icon: Icons.schedule_rounded,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                context,
                title: 'Backup on WiFi Only',
                subtitle: 'Save mobile data',
                icon: Icons.wifi_rounded,
                trailing: Switch(
                  value: true,
                  onChanged: (v) {},
                  activeThumbColor: colors.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Manual Actions',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildActionCard(
                context,
                title: 'Backup Now',
                subtitle: 'Create immediate backup',
                icon: Icons.backup_rounded,
                onTap: _backupNow,
              ),
              const SizedBox(height: 12),
              _buildActionCard(
                context,
                title: 'Restore from Backup',
                subtitle: 'Restore data from cloud',
                icon: Icons.restore_rounded,
                onTap: _restoreBackup,
              ),
              const SizedBox(height: 24),
              Text(
                'Sync Status',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildSyncStatusCard(context),
              const Spacer(),
              Text(
                'Your data is encrypted end-to-end. Only you can access it.',
                style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.surfaceSoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colors.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w500, color: colors.bodyTextColor)),
                    Text(subtitle, style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor)),
                  ],
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colors.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w500, color: colors.bodyTextColor)),
                    Text(subtitle, style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colors.secondaryTextColor, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSyncStatusCard(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Synced',
                  style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600, color: colors.success),
                ),
                const Spacer(),
                Text(
                  'Last sync: 2 hours ago',
                  style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: 1.0,
              backgroundColor: colors.divider,
              valueColor: AlwaysStoppedAnimation<Color>(colors.success),
              minHeight: 4,
              borderRadius: BorderRadius.circular(2),
            ),
            const SizedBox(height: 8),
            Text(
              'All data up to date',
              style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }

  void _backupNow() {
    // TODO: Trigger manual backup
  }

  void _restoreBackup() {
    // TODO: Show restore options
  }
}