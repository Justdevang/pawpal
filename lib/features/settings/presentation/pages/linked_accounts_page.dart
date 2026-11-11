// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';

/// Linked accounts settings page
class LinkedAccountsPage extends ConsumerWidget {
  const LinkedAccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final authState = ref.watch(authProvider);
    final user = authState.value;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Linked Accounts',
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
                'Sign-in Methods',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildAccountCard(
                context,
                title: 'Email & Password',
                subtitle: user?.email ?? 'Not set',
                icon: Icons.email_rounded,
                isPrimary: true,
                onTap: () => context.push('/settings/change-password'),
              ),
              const SizedBox(height: 16),
              _buildAccountCard(
                context,
                title: 'Google',
                subtitle: 'Sign in with Google account',
                icon: Icons.g_mobiledata_rounded,
                isLinked: user != null, // TODO: Check actual
                onLink: () => _linkGoogle(ref),
                onUnlink: () => _unlinkGoogle(ref),
              ),
              const SizedBox(height: 16),
              _buildAccountCard(
                context,
                title: 'Apple',
                subtitle: 'Sign in with Apple ID',
                icon: Icons.apple_rounded,
                isLinked: false, // TODO: Check actual
                onLink: () => _linkApple(ref),
                onUnlink: () => _unlinkApple(ref),
              ),
              const Spacer(),
              Text(
                'Linking accounts lets you sign in with multiple methods and adds security.',
                style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    bool isPrimary = false,
    bool isLinked = false,
    VoidCallback? onLink,
    VoidCallback? onUnlink,
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
                  Row(
                    children: [
                      Text(title, style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: colors.bodyTextColor)),
                      if (isPrimary) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: colors.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text('Primary', style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.w600, color: colors.primary)),
                        ),
                      ],
                    ],
                  ),
                  Text(subtitle, style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor)),
                ],
              ),
            ),
            if (!isPrimary)
              isLinked
                    ? PawlyGhostButton(
                        label: 'Unlink',
                        onPressed: onUnlink,
                        textColor: colors.error,
                      )
                    : PawlyGhostButton(
                        label: 'Link',
                        onPressed: onLink,
                        textColor: colors.primary,
                      ),
            ],
          ),
        ),
      ),
    );
  }

  void _linkGoogle(WidgetRef ref) {
    // TODO: Link Google account
  }

  void _unlinkGoogle(WidgetRef ref) {
    // TODO: Unlink Google account
  }

  void _linkApple(WidgetRef ref) {
    // TODO: Link Apple account
  }

  void _unlinkApple(WidgetRef ref) {
    // TODO: Unlink Apple account
  }
}