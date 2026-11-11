// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';

/// Units settings page
class UnitsPage extends ConsumerWidget {
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final authState = ref.watch(authProvider);
    final user = authState.value;
    final currentUnits = user?.units ?? 'metric';

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Units',
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
                'Measurement Units',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              _buildUnitOption(
                context,
                title: 'Metric',
                subtitle: 'Kilograms (kg), Centimeters (cm), Celsius (°C)',
                icon: Icons.straighten_rounded,
                isSelected: currentUnits == 'metric',
                onTap: () => _setUnits(context, ref, 'metric'),
              ),
              _buildUnitOption(
                context,
                title: 'Imperial',
                subtitle: 'Pounds (lb), Inches (in), Fahrenheit (°F)',
                icon: Icons.straighten_rounded,
                isSelected: currentUnits == 'imperial',
                onTap: () => _setUnits(context, ref, 'imperial'),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.surfaceSoft,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note',
                      style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Changing units will convert all existing weight entries and medication dosages. Temperature units affect weather-based reminders.',
                      style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUnitOption(
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
                child: Icon(icon, color: isSelected ? colors.primary : colors.secondaryTextColor, size: 24),
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

  void _setUnits(BuildContext context, WidgetRef ref, String units) {
    // TODO: Update user preference and convert existing data
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Units changed to ${units == 'metric' ? 'Metric' : 'Imperial'}')),
    );
  }
}