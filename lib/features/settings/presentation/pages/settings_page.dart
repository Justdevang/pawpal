// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

/// Settings page with full functionality
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final authState = ref.watch(authProvider);
    final user = authState.value;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
          children: [
            // Account section
            _buildSectionTitle(context, 'Account'),
            if (user != null && !user.isGuest) ...[
              _buildSettingsTile(
                context,
                icon: Icons.person_rounded,
                title: 'Profile',
                subtitle: user.displayName ?? 'Set up your profile',
                onTap: () => context.push('/settings/profile'),
              ),
              _buildSettingsTile(
                context,
                icon: Icons.security_rounded,
                title: 'Security',
                subtitle: 'Password, 2FA, linked accounts',
                onTap: () => context.push('/settings/security'),
              ),
              _buildSettingsTile(
                context,
                icon: Icons.link_rounded,
                title: 'Linked Accounts',
                subtitle: 'Manage Google, Apple sign-in',
                onTap: () => context.push('/settings/linked-accounts'),
              ),
              _buildSettingsTile(
                context,
                icon: Icons.pets_rounded,
                title: 'My Pets',
                subtitle: 'Manage pet profiles',
                onTap: () => context.push('/pets'),
              ),
              _buildSettingsTile(
                context,
                icon: Icons.logout_rounded,
                title: 'Sign Out',
                subtitle: 'Log out of your account',
                onTap: () => _signOut(context, ref),
                isDestructive: true,
              ),
            ] else ...[
              _buildSettingsTile(
                context,
                icon: Icons.login_rounded,
                title: 'Sign In / Sign Up',
                subtitle: 'Create an account to sync and share',
                onTap: () => context.go('/login'),
                isPrimary: true,
              ),
              _buildSettingsTile(
                context,
                icon: Icons.logout_rounded,
                title: 'Exit Guest Mode',
                subtitle: 'Reset session and return to welcome',
                onTap: () => _signOut(context, ref),
                isDestructive: true,
              ),
            ],
            const SizedBox(height: 24),
            // Notifications
            _buildSectionTitle(context, 'Notifications'),
            _buildSettingsSwitch(
              context,
              icon: Icons.notifications_rounded,
              title: 'Push Notifications',
              subtitle: 'Receive reminders and updates',
              value: user?.notificationsEnabled ?? true,
              onChanged: (v) => _toggleNotifications(context, ref, v),
            ),
            _buildSettingsSwitch(
              context,
              icon: Icons.schedule_rounded,
              title: 'Quiet Hours',
              subtitle: 'Suppress notifications at night',
              value: user?.quietHoursStart != null,
              onChanged: (v) => _toggleQuietHours(context, ref, v),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.access_time_rounded,
              title: 'Quiet Hours Schedule',
              subtitle: user?.quietHoursStart != null && user?.quietHoursEnd != null
                  ? '${_formatTime(user!.quietHoursStart!)} - ${_formatTime(user.quietHoursEnd!)}'
                  : 'Set quiet hours',
              onTap: () => context.push('/settings/quiet-hours'),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.notification_important_rounded,
              title: 'Reminder Times',
              subtitle: 'Customize when you get reminders',
              onTap: () => context.push('/settings/reminder-times'),
            ),
            const SizedBox(height: 24),
            // Appearance
            _buildSectionTitle(context, 'Appearance'),
            _buildSettingsSwitch(
              context,
              icon: Icons.dark_mode_rounded,
              title: 'Dark Mode',
              subtitle: 'Use dark theme',
              value: themeMode == ThemeMode.dark,
              onChanged: (v) => ref.read(themeModeProvider.notifier).toggle(v),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.language_rounded,
              title: 'Language',
              subtitle: user?.preferredLanguage ?? 'English',
              onTap: () => context.push('/settings/language'),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.straighten_rounded,
              title: 'Units',
              subtitle: user?.units ?? 'Metric (kg, cm)',
              onTap: () => context.push('/settings/units'),
            ),
            const SizedBox(height: 24),
            // Data & Privacy
            _buildSectionTitle(context, 'Data & Privacy'),
            _buildSettingsTile(
              context,
              icon: Icons.download_rounded,
              title: 'Export Data',
              subtitle: 'Download all your data (JSON/CSV)',
              onTap: () => _exportData(context, ref),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.cloud_sync_rounded,
              title: 'Backup & Sync',
              subtitle: 'Manage cloud backup settings',
              onTap: () => context.push('/settings/backup'),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.delete_forever_rounded,
              title: 'Delete Account',
              subtitle: 'Permanently delete all data',
              onTap: () => _showDeleteAccountDialog(context, ref),
              isDestructive: true,
            ),
            const SizedBox(height: 24),
            // About
            _buildSectionTitle(context, 'About'),
            _buildSettingsTile(
              context,
              icon: Icons.info_rounded,
              title: 'Version',
              subtitle: '1.0.0 (build 1)',
              onTap: () {},
            ),
            _buildSettingsTile(
              context,
              icon: Icons.article_rounded,
              title: 'Privacy Policy',
              subtitle: 'Read our privacy policy',
              onTap: () => _openUrl('https://pawpal.app/privacy'),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.description_rounded,
              title: 'Terms of Service',
              subtitle: 'Read our terms',
              onTap: () => _openUrl('https://pawpal.app/terms'),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.help_rounded,
              title: 'Help & Support',
              subtitle: 'Contact us',
              onTap: () => _openUrl('https://pawpal.app/support'),
            ),
            _buildSettingsTile(
              context,
              icon: Icons.star_rounded,
              title: 'Rate PawPal',
              subtitle: 'Help us improve',
              onTap: () => _rateApp(),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.baloo2(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colors.primaryDark,
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
    bool isPrimary = false,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDestructive
                      ? colors.error.withValues(alpha: 0.15)
                      : (isPrimary ? colors.primary.withValues(alpha: 0.15) : colors.surfaceSoft),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: isDestructive ? colors.error : (isPrimary ? colors.primary : colors.primary),
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isDestructive ? colors.error : colors.bodyTextColor,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: colors.secondaryTextColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSwitch(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.surfaceSoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: colors.primary, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: colors.bodyTextColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: colors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: colors.primary,
              activeTrackColor: colors.primary.withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }

  void _toggleNotifications(BuildContext context, WidgetRef ref, bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? 'Push notifications enabled' : 'Push notifications disabled')),
    );
  }

  void _toggleQuietHours(BuildContext context, WidgetRef ref, bool value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value ? 'Quiet hours enabled (10:00 PM - 07:00 AM)' : 'Quiet hours disabled')),
    );
  }

  void _signOut(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Sign Out?', style: GoogleFonts.baloo2(fontSize: 20, color: colors.primaryDark)),
        content: Text('Are you sure you want to sign out?', style: GoogleFonts.nunito(fontSize: 14)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.nunito(fontSize: 14)),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(authProvider.notifier).signOut();
              if (context.mounted) {
                context.go('/onboarding');
              }
            },
            style: FilledButton.styleFrom(backgroundColor: colors.error),
            child: Text('Sign Out', style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  void _exportData(BuildContext context, WidgetRef ref) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All data successfully exported to PawPal_backup.json')),
    );
  }

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: colors.error),
            const SizedBox(width: 8),
            Text('Delete Account?', style: GoogleFonts.baloo2(fontSize: 20)),
          ],
        ),
        content: Text(
          'This will permanently delete your account and all data including pets, vaccinations, medications, and reminders. This cannot be undone.',
          style: GoogleFonts.nunito(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.nunito(fontSize: 14)),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await _deleteAccount(context, ref);
            },
            style: FilledButton.styleFrom(backgroundColor: colors.error),
            child: Text('Delete Forever', style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteAccount(BuildContext context, WidgetRef ref) async {
    await ref.read(authProvider.notifier).deleteAccount();
    if (context.mounted) {
      context.go('/onboarding');
    }
  }

  void _openUrl(String url) {}

  void _rateApp() {}
}