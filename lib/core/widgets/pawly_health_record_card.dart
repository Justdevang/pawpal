// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Health record card per Pawly spec: blush cards (radius 20), maroon title, meta row, overdue/upcoming chips
class PawlyHealthRecordCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? lastDate;
  final String? nextDate;
  final HealthRecordCardStatus status;
  final VoidCallback? onTap;

  const PawlyHealthRecordCard({
    super.key,
    required this.title,
    this.subtitle,
    this.lastDate,
    this.nextDate,
    this.status = HealthRecordCardStatus.upcoming,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    Color? borderColor;
    Widget? statusChip;

    switch (status) {
      case HealthRecordCardStatus.overdue:
        borderColor = colors.error;
        statusChip = _StatusChip(label: 'Overdue', color: colors.error);
        break;
      case HealthRecordCardStatus.upcoming:
        borderColor = colors.accent;
        statusChip = _StatusChip(label: 'Due Soon', color: colors.accent);
        break;
      case HealthRecordCardStatus.completed:
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

enum HealthRecordCardStatus {
  completed,
  upcoming,
  overdue,
}