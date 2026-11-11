// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/reminder.dart';
import '../providers/reminder_providers.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Reminder list page
class ReminderListPage extends ConsumerWidget {
  const ReminderListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final remindersAsync = ref.watch(userRemindersStreamProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Reminders',
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
        child: remindersAsync.when(
          data: (reminders) {
            if (reminders.isEmpty) {
              return Center(
                child: PawlyEmptyState(
                  title: 'No Reminders Yet',
                  message: 'You have no scheduled reminders.',
                  icon: Icons.notifications_none_rounded,
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: reminders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                return _buildReminderCard(context, reminder, colors);
              },
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(color: colors.primary),
          ),
          error: (error, _) => Center(
            child: PawlyEmptyState(
              title: 'Error Loading Reminders',
              message: error.toString(),
              icon: Icons.error_outline_rounded,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReminderCard(BuildContext context, Reminder reminder, PawPalColors colors) {
    final isOverdue = reminder.nextTriggerAt.isBefore(DateTime.now());

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isOverdue ? colors.warning.withValues(alpha: 0.5) : colors.divider,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => context.push('/reminders/${reminder.id}'),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isOverdue
                        ? colors.warning.withValues(alpha: 0.12)
                        : colors.primary.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_active_rounded,
                    color: isOverdue ? colors.warning : colors.primary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reminder #${reminder.id}',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: colors.bodyTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Schedule: ${reminder.scheduleRule}',
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: colors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Next: ${reminder.nextTriggerAt.formatDateTime()}',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isOverdue ? colors.warning : colors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: colors.secondaryTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}