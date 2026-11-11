// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../providers/auth_provider.dart';

/// Guest mode page - allows using app without account
class GuestModePage extends ConsumerWidget {
  const GuestModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  PawlyIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    size: 40,
                    borderRadius: 14,
                    backgroundColor: colors.surface,
                    iconColor: colors.primaryDark,
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/login');
                      }
                    },
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shield_outlined, size: 14, color: colors.primary),
                        const SizedBox(width: 6),
                        Text(
                          'Local Device Only',
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),

                    // Illustration / Badge
                    Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              colors.accent.withValues(alpha: 0.25),
                              colors.primary.withValues(alpha: 0.15),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: colors.accent.withValues(alpha: 0.12),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors.surface,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.pets_rounded,
                                size: 36,
                                color: colors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Title
                    Text(
                      'Try as Guest',
                      style: GoogleFonts.baloo2(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: colors.primaryDark,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Explore PawPal without an account.\nAll data is stored securely on this phone.',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        height: 1.35,
                        color: colors.secondaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    // Features Container
                    Container(
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colors.divider.withValues(alpha: 0.6),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Column(
                        children: [
                          _buildFeature(
                            context,
                            icon: Icons.pets_rounded,
                            title: 'Add Pets',
                            description: 'Create profiles for all your beloved pets',
                            colors: colors,
                          ),
                          Divider(color: colors.divider.withValues(alpha: 0.5), height: 1),
                          _buildFeature(
                            context,
                            icon: Icons.vaccines_rounded,
                            title: 'Track Vaccinations',
                            description: 'Never miss an upcoming booster date',
                            colors: colors,
                          ),
                          Divider(color: colors.divider.withValues(alpha: 0.5), height: 1),
                          _buildFeature(
                            context,
                            icon: Icons.medication_rounded,
                            title: 'Medicine Reminders',
                            description: 'Get notified in time for every treatment',
                            colors: colors,
                          ),
                          Divider(color: colors.divider.withValues(alpha: 0.5), height: 1),
                          _buildFeature(
                            context,
                            icon: Icons.cloud_sync_rounded,
                            title: 'Sync Anytime Later',
                            description: 'Sign up whenever you want to backup or share',
                            colors: colors,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Fixed Bottom CTA Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PawlyButton(
                    label: 'Continue as Guest',
                    showChevron: true,
                    onPressed: () async {
                      await ref.read(authProvider.notifier).signInAsGuest();
                      if (context.mounted) {
                        context.go('/pets/add');
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: colors.secondaryTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: colors.primary,
                          ),
                        ),
                      ),
                      Text(
                        ' or ',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: colors.secondaryTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/register'),
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required PawPalColors colors,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: colors.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: colors.bodyTextColor,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: colors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.check_circle_rounded,
            size: 18,
            color: colors.accent,
          ),
        ],
      ),
    );
  }
}