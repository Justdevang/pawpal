// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';

/// Design catalog page - shows all components
class DesignCatalogPage extends ConsumerWidget {
  const DesignCatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Design Catalog',
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
          padding: const EdgeInsets.all(20),
          children: [
            // Colors
            _buildSection(context, 'Colors', [
              _buildColorRow(colors, 'Background (Cream)', colors.background),
              _buildColorRow(colors, 'Surface Soft (Blush)', colors.surfaceSoft),
              _buildColorRow(colors, 'Primary (Deep Maroon)', colors.primary),
              _buildColorRow(colors, 'Primary Dark', colors.primaryDark),
              _buildColorRow(colors, 'Accent (Orange)', colors.accent),
              _buildColorRow(colors, 'Success (Mint Green)', colors.success),
              _buildColorRow(colors, 'Health Card Start', colors.healthCardGradientStart),
              _buildColorRow(colors, 'Health Card End', colors.healthCardGradientEnd),
              _buildColorRow(colors, 'Search Field', colors.searchField),
              _buildColorRow(colors, 'Body Text', colors.bodyTextColor),
              _buildColorRow(colors, 'Secondary Text', colors.secondaryTextColor),
            ]),
            const SizedBox(height: 32),
            // Typography
            _buildSection(context, 'Typography', [
              _buildTextStyle(colors, 'Display Large', PawPalTextStyles.displayLarge(context)),
              _buildTextStyle(colors, 'Display Medium', PawPalTextStyles.displayMedium(context)),
              _buildTextStyle(colors, 'Headline 1', PawPalTextStyles.headline1(context)),
              _buildTextStyle(colors, 'Headline 2', PawPalTextStyles.headline2(context)),
              _buildTextStyle(colors, 'Body Large', PawPalTextStyles.bodyLarge(context)),
              _buildTextStyle(colors, 'Body Medium', PawPalTextStyles.bodyMedium(context)),
              _buildTextStyle(colors, 'Body Small', PawPalTextStyles.bodySmall(context)),
              _buildTextStyle(colors, 'Button', PawPalTextStyles.button(context)),
            ]),
            const SizedBox(height: 32),
            // Buttons
            _buildSection(context, 'Buttons', [
              PawlyButton(label: 'Primary Button', onPressed: () {}),
              const SizedBox(height: 12),
              PawlySecondaryButton(label: 'Secondary Button', onPressed: () {}),
              const SizedBox(height: 12),
              PawlyGhostButton(label: 'Ghost Button', onPressed: () {}),
              const SizedBox(height: 12),
              PawlyIconButton(icon: Icons.add_rounded, onPressed: () {}),
            ]),
            const SizedBox(height: 32),
            // Avatars
            _buildSection(context, 'Pet Avatars', [
              Row(
                children: [
                  PawlyPetAvatar(name: 'Bella', size: 78, isSelected: true),
                  const SizedBox(width: 12),
                  PawlyPetAvatar(name: 'Max', size: 78),
                  const SizedBox(width: 12),
                  PawlyPetAvatar(isAddButton: true, size: 78),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  PawlyPetAvatarSmall(name: 'Bella', size: 48),
                  const SizedBox(width: 12),
                  PawlyPetAvatarSmall(name: 'Max', size: 40),
                  const SizedBox(width: 12),
                  PawlyPetAvatarLarge(name: 'Bella', size: 100),
                ],
              ),
            ]),
            const SizedBox(height: 32),
            // Task Card
            _buildSection(context, 'Task Card', [
              PawlyTaskCard(
                petName: 'Bella',
                title: 'Feeding',
                subtitle: 'Morning meal',
                time: '08:00 AM',
                index: 0,
                total: 1,
                onComplete: () {},
                onSnooze: () {},
                onSkip: () {},
              ),
              const SizedBox(height: 12),
              PawlyTaskCard(
                petName: 'Max',
                title: 'Medication',
                subtitle: 'Heart medicine',
                time: '12:00 PM',
                status: TaskCardStatus.completed,
                index: 0,
                total: 1,
                onComplete: () {},
                onSnooze: () {},
                onSkip: () {},
              ),
            ]),
            const SizedBox(height: 32),
            // Stat Tiles
            _buildSection(context, 'Stat Tiles', [
              Row(
                children: [
                  PawlyStatTile(icon: Icons.male_rounded, label: 'Sex', value: 'Male'),
                  const SizedBox(width: 12),
                  PawlyStatTile(icon: Icons.cake_rounded, label: 'Age', value: '10 months'),
                  const SizedBox(width: 12),
                  PawlyStatTile(icon: Icons.monitor_weight_rounded, label: 'Weight', value: '12.8 kg'),
                ],
              ),
            ]),
            const SizedBox(height: 32),
            // Health Records
            _buildSection(context, 'Health Records', [
              PawlyHealthRecordCard(
                title: 'Rabies Vaccine',
                subtitle: 'Annual booster',
                lastDate: '10 Jan 2026',
                nextDate: '10 Jan 2027',
                status: HealthRecordCardStatus.upcoming,
              ),
              const SizedBox(height: 12),
              PawlyHealthRecordCard(
                title: 'Vet Visit',
                subtitle: 'General Checkup',
                lastDate: '15 Dec 2025',
                status: HealthRecordCardStatus.completed,
              ),
              const SizedBox(height: 12),
              PawlyHealthRecordCard(
                title: 'DHPP Vaccine',
                lastDate: '01 Mar 2025',
                nextDate: '01 Mar 2026',
                status: HealthRecordCardStatus.overdue,
              ),
            ]),
            const SizedBox(height: 32),
            // Health Summary
            _buildSection(context, 'Health Summary', [
              PawlyHealthSummaryCard(
                petName: 'Bella',
                weight: '12.8 kg',
                healthStatus: 'Healthy',
                lastVetVisit: '15 Jan 2026',
              ),
            ]),
            const SizedBox(height: 32),
            // Inputs
            _buildSection(context, 'Inputs', [
              PawlySearchField(hintText: 'Search...'),
              const SizedBox(height: 12),
              PawlyTextField(labelText: 'Email', hintText: 'you@example.com'),
              const SizedBox(height: 12),
              PawlyTextField(labelText: 'Password', hintText: '••••••••', obscureText: true),
            ]),
            const SizedBox(height: 32),
            // Chips
            _buildSection(context, 'Status Chips', [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  PawlyStatusChip(label: 'Overdue', color: colors.error),
                  PawlyStatusChip(label: 'Due Soon', color: colors.accent),
                  PawlyStatusChip(label: 'Completed', color: colors.success),
                ],
              ),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.baloo2(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildColorRow(PawPalColors colors, String name, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.divider),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.nunito(fontSize: 14, color: colors.bodyTextColor),
            ),
          ),
          Text(
            '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
            style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildTextStyle(PawPalColors colors, String name, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: GoogleFonts.nunito(fontSize: 14, color: colors.bodyTextColor),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Sample text for preview',
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              '${style.fontSize?.toInt()}px • ${style.fontWeight?.value ?? 400}',
              style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
            ),
          ),
        ],
      ),
    );
  }
}