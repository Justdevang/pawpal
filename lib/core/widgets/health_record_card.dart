// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Stat tile for pet profile
class StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? backgroundColor;
  final Color? iconColor;

  const StatTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? colors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor ?? Colors.white,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Health record card for pet profile
class HealthRecordCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? lastDate;
  final String? nextDate;
  final HealthRecordStatus status;
  final VoidCallback? onTap;

  const HealthRecordCard({
    super.key,
    required this.title,
    this.subtitle,
    this.lastDate,
    this.nextDate,
    this.status = HealthRecordStatus.upcoming,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    Color? borderColor;
    Widget? statusChip;

    switch (status) {
      case HealthRecordStatus.overdue:
        borderColor = colors.error;
        statusChip = _StatusChip(label: 'Overdue', color: colors.error);
        break;
      case HealthRecordStatus.upcoming:
        borderColor = colors.accent;
        statusChip = _StatusChip(label: 'Due Soon', color: colors.accent);
        break;
      case HealthRecordStatus.completed:
        borderColor = null;
        statusChip = null;
        break;
    }

    return Material(
      color: colors.surfaceSoft,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: borderColor != null ? Border.all(color: borderColor, width: 2) : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colors.primaryDark,
                      ),
                    ),
                  ),
                  if (statusChip != null) statusChip,
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    color: colors.secondaryTextColor,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (lastDate != null)
                    _DateColumn(label: 'Last', value: lastDate!, colors: colors),
                  if (nextDate != null)
                    _DateColumn(label: 'Next', value: nextDate!, colors: colors, isBold: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateColumn extends StatelessWidget {
  final String label;
  final String value;
  final PawPalColors colors;
  final bool isBold;

  const _DateColumn({
    required this.label,
    required this.value,
    required this.colors,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 11,
            color: colors.secondaryTextColor,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: colors.bodyTextColor,
          ),
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

enum HealthRecordStatus {
  completed,
  upcoming,
  overdue,
}