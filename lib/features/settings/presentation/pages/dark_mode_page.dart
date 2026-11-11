// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_provider.dart';

/// Dark mode settings page
class DarkModePage extends ConsumerWidget {
  const DarkModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Dark Mode',
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
                'Appearance',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildThemeOption(
                context,
                title: 'Light',
                subtitle: 'Always use light theme',
                icon: Icons.light_mode_rounded,
                isSelected: themeMode == ThemeMode.light,
                onTap: () => _setTheme(context, ref, ThemeMode.light),
              ),
              _buildThemeOption(
                context,
                title: 'Dark',
                subtitle: 'Always use dark theme',
                icon: Icons.dark_mode_rounded,
                isSelected: themeMode == ThemeMode.dark,
                onTap: () => _setTheme(context, ref, ThemeMode.dark),
              ),
              _buildThemeOption(
                context,
                title: 'System',
                subtitle: 'Match device setting',
                icon: Icons.settings_system_daydream_rounded,
                isSelected: themeMode == ThemeMode.system,
                onTap: () => _setTheme(context, ref, ThemeMode.system),
              ),
              const Spacer(),
              Text(
                'Dark mode uses a warm, deep color palette optimized for low-light viewing.',
                style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
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
                  color: isSelected ? colors.primary.withValues(alpha: 0.15) : colors.surfaceSoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? colors.primary : colors.secondaryTextColor,
                  size: 24,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(Icons.check_circle_rounded, color: colors.primary, size: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _setTheme(BuildContext context, WidgetRef ref, ThemeMode mode) {
    ref.read(themeModeProvider.notifier).setMode(mode);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Theme changed to ${mode == ThemeMode.dark ? 'Dark mode' : mode == ThemeMode.light ? 'Light mode' : 'System theme'}')),
    );
  }
}