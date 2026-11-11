// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'pawly_pet_avatar.dart';
import '../theme/app_theme.dart';

/// Task card per Pawly spec: mint green fill, radius 20, pet avatar 48px, dotted divider, action buttons
class PawlyTaskCard extends StatelessWidget {
  final String petName;
  final String title;
  final String subtitle;
  final String time;
  final String? petImageUrl;
  final String? petLocalPath;
  final TaskCardStatus status;
  final VoidCallback? onComplete;
  final VoidCallback? onSnooze;
  final VoidCallback? onSkip;
  final int index;
  final int total;

  const PawlyTaskCard({
    super.key,
    required this.petName,
    required this.title,
    required this.subtitle,
    required this.time,
    this.petImageUrl,
    this.petLocalPath,
    this.status = TaskCardStatus.pending,
    this.onComplete,
    this.onSnooze,
    this.onSkip,
    this.index = 0,
    this.total = 1,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    final isCompleted = status == TaskCardStatus.completed;
    final isOverdue = status == TaskCardStatus.overdue;

    Color cardColor;
    if (isCompleted) {
      cardColor = colors.success.withValues(alpha: 0.6);
    } else if (isOverdue) {
      cardColor = colors.error.withValues(alpha: 0.15);
    } else {
      cardColor = colors.success;
    }

    return Animate(
      effects: [
        FadeEffect(duration: 300.ms, delay: (60 * index).ms),
        SlideEffect(begin: Offset(0, 0.1), duration: 300.ms, delay: (60 * index).ms, curve: Curves.easeOut),
      ],
      child: Container(
        width: 300,
        margin: EdgeInsets.fromLTRB(
          index == 0 ? 20 : 8,
          8,
          index == total - 1 ? 20 : 8,
          8,
        ),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          border: isOverdue ? Border.all(color: colors.error, width: 2) : null,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PawlyPetAvatarSmall(
                  imageUrl: petImageUrl,
                  localPath: petLocalPath,
                  name: petName,
                  size: 48,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$petName – $title',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: isCompleted ? colors.onSurface.withValues(alpha: 0.7) : Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: isCompleted ? colors.onSurface.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.8),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Dotted divider
            Row(
              children: List.generate(
                20,
                (i) => Expanded(
                  child: Container(
                    height: 1,
                    margin: EdgeInsets.only(right: i == 19 ? 0 : 4),
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: isCompleted ? colors.onSurface.withValues(alpha: 0.7) : Colors.white.withValues(alpha: 0.8),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isCompleted ? colors.onSurface.withValues(alpha: 0.7) : Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
                if (!isCompleted)
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      if (onSnooze != null)
                        _ActionButton(
                          label: 'Snooze',
                          icon: Icons.snooze_rounded,
                          color: Colors.white.withValues(alpha: 0.2),
                          onPressed: onSnooze,
                        ),
                      if (onSkip != null)
                        _ActionButton(
                          label: 'Skip',
                          icon: Icons.skip_next_rounded,
                          color: Colors.white.withValues(alpha: 0.2),
                          onPressed: onSkip,
                        ),
                      if (onComplete != null)
                        _ActionButton(
                          label: 'Complete',
                          icon: Icons.check_rounded,
                          color: Colors.white.withValues(alpha: 0.2),
                          isPrimary: true,
                          onPressed: onComplete,
                        ),
                    ],
                  )
                else
                  const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isPrimary;
  final VoidCallback? onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    this.isPrimary = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPrimary ? Colors.white : color,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 14,
                color: isPrimary ? Colors.green : Colors.white,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isPrimary ? Colors.green : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum TaskCardStatus {
  pending,
  completed,
  overdue,
}