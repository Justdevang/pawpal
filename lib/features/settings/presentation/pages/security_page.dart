// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';

/// Security settings page
class SecurityPage extends ConsumerWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final authState = ref.watch(authProvider);
    final user = authState.value;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Security',
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
                'Account Security',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildSecurityItem(
                context,
                title: 'Change Password',
                subtitle: 'Update your password',
                icon: Icons.lock_rounded,
                onTap: () => context.push('/settings/change-password'),
              ),
              const SizedBox(height: 12),
              _buildSecurityItem(
                context,
                title: 'Two-Factor Authentication',
                subtitle: 'Add an extra layer of security',
                icon: Icons.security_rounded,
                trailing: Switch(
                  value: false, // TODO: Get from preferences
                  onChanged: (v) {},
                  activeThumbColor: colors.primary,
                ),
              ),
              const SizedBox(height: 12),
              _buildSecurityItem(
                context,
                title: 'Biometric Lock',
                subtitle: 'Use Face ID / Fingerprint to unlock',
                icon: Icons.fingerprint_rounded,
                trailing: Switch(
                  value: false,
                  onChanged: (v) {},
                  activeThumbColor: colors.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Linked Accounts',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildLinkedAccount(
                context,
                provider: 'Google',
                icon: Icons.g_mobiledata_rounded,
                isLinked: user != null, // TODO: Check actual linked accounts
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildLinkedAccount(
                context,
                provider: 'Apple',
                icon: Icons.apple_rounded,
                isLinked: false,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              Text(
                'Active Sessions',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildSessionItem(
                context,
                device: 'iPhone 15 Pro',
                location: 'San Francisco, CA',
                lastActive: 'Just now',
                isCurrent: true,
              ),
              const SizedBox(height: 12),
              _buildSessionItem(
                context,
                device: 'iPad Pro',
                location: 'San Francisco, CA',
                lastActive: '2 days ago',
                isCurrent: false,
              ),
              const Spacer(),
              PawlyGhostButton(
                label: 'Log Out of All Devices',
                onPressed: _logoutAllDevices,
                textColor: colors.error,
                leadingIcon: Icons.logout_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityItem(
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

  Widget _buildLinkedAccount(
    BuildContext context, {
    required String provider,
    required IconData icon,
    required bool isLinked,
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
                  color: isLinked ? colors.primary.withValues(alpha: 0.15) : colors.surfaceSoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: isLinked ? colors.primary : colors.secondaryTextColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(provider, style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w500, color: colors.bodyTextColor)),
                    Text(
                      isLinked ? 'Linked' : 'Not linked',
                      style: GoogleFonts.nunito(fontSize: 13, color: isLinked ? colors.success : colors.secondaryTextColor),
                    ),
                  ],
                ),
              ),
              if (isLinked)
                Icon(Icons.check_circle_rounded, color: colors.success, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSessionItem(
    BuildContext context, {
    required String device,
    required String location,
    required String lastActive,
    required bool isCurrent,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: colors.surface,
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
              child: Icon(Icons.phone_android_rounded, color: colors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(device, style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: colors.bodyTextColor)),
                      if (isCurrent) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: colors.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text('Current', style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.w600, color: colors.primary)),
                        ),
                      ],
                    ],
                  ),
                  Text(location, style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor)),
                  Text('Last active: $lastActive', style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor)),
                ],
              ),
            ),
            if (!isCurrent)
              PawlyGhostButton(
                label: 'Remove',
                onPressed: () {},
                textColor: colors.error,
              ),
          ],
        ),
      ),
    );
  }

  void _logoutAllDevices() {
    // TODO: Invalidate all sessions
  }
}