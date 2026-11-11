// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../providers/reminder_providers.dart';
import '../../../pets/presentation/providers/pet_providers.dart';
import '../../domain/entities/reminder.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Reminder detail page with actions
class ReminderDetailPage extends ConsumerWidget {
  final int reminderId;

  const ReminderDetailPage({super.key, required this.reminderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final reminderAsync = ref.watch(reminderDetailProvider(reminderId));

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Reminder Details',
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
        child: reminderAsync.when(
          data: (reminder) {
            if (reminder == null) {
              return _buildNotFound(context);
            }
            return _buildDetail(context, ref, reminder);
          },
          loading: () => _buildLoading(context),
          error: (error, stack) => _buildError(context, ref, error.toString()),
        ),
      ),
    );
  }

  Widget _buildDetail(BuildContext context, WidgetRef ref, Reminder reminder) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    Color typeColor;
    IconData typeIcon;
    switch (reminder.type) {
      case 'medication':
        typeColor = colors.success;
        typeIcon = Icons.medication_rounded;
        break;
      case 'vaccination':
        typeColor = colors.primary;
        typeIcon = Icons.vaccines_rounded;
        break;
      case 'appointment':
        typeColor = colors.accent;
        typeIcon = Icons.calendar_today_rounded;
        break;
      case 'weight':
        typeColor = colors.primaryDark;
        typeIcon = Icons.monitor_weight_rounded;
        break;
      default:
        typeColor = colors.secondaryTextColor;
        typeIcon = Icons.notifications_rounded;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: typeColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(typeIcon, size: 16, color: typeColor),
                const SizedBox(width: 6),
                Text(
                  reminder.type.capitalize(),
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: typeColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Title
          Text(
            reminder.title,
            style: GoogleFonts.baloo2(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: colors.primaryDark,
            ),
          ),
          if (reminder.description != null) ...[
            const SizedBox(height: 8),
            Text(
              reminder.description!,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: colors.secondaryTextColor,
              ),
            ),
          ],
          const SizedBox(height: 24),
          // Details
          _buildDetailRow(context, Icons.access_time_rounded, 'Next Dose', _formatNextTrigger(reminder.nextTriggerAt), colors),
          if (reminder.lastTriggeredAt != null)
            _buildDetailRow(context, Icons.history_rounded, 'Last Triggered', reminder.lastTriggeredAt!.formatDateTime(), colors),
          _buildDetailRow(context, Icons.repeat_rounded, 'Schedule', reminder.scheduleRule, colors),
          if (reminder.petId != null)
            _buildDetailRow(context, Icons.pets_rounded, 'Pet', _buildPetName(ref, reminder.petId!), colors),
          if (reminder.payload != null)
            _buildDetailRow(context, Icons.info_rounded, 'Details', reminder.payload!, colors),
          const SizedBox(height: 24),
          // Actions
          Row(
            children: [
              Expanded(
                child: PawlyButton(
                  label: 'Mark Done',
                  onPressed: () => _markDone(context, ref, reminder),
                  backgroundColor: colors.success,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PawlySecondaryButton(
                  label: 'Snooze 15m',
                  onPressed: () => _snooze(context, ref, reminder),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: PawlyGhostButton(
                  label: 'Skip This Occurrence',
                  onPressed: () => _skip(context, ref, reminder),
                  textColor: colors.warning,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PawlyGhostButton(
                  label: 'Disable Reminder',
                  onPressed: () => _disable(context, ref, reminder),
                  textColor: colors.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // History
          Text(
            'Recent Activity',
            style: GoogleFonts.baloo2(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.bodyTextColor,
            ),
          ),
          const SizedBox(height: 12),
          _buildHistoryPlaceholder(context, colors),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String label, dynamic value, PawPalColors colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colors.secondaryTextColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  color: colors.secondaryTextColor,
                ),
              ),
              if (value is Widget)
                value
              else
                Text(
                  value.toString(),
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colors.bodyTextColor,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatNextTrigger(DateTime dateTime) {
    final now = DateTime.now();
    final diff = dateTime.difference(now);
    if (diff.isNegative) {
      return '${dateTime.formatDateTime()} (${diff.inMinutes.abs()}m overdue)';
    }
    if (diff.inDays > 0) {
      return '${dateTime.formatDateTime()} (in ${diff.inDays}d ${diff.inHours % 24}h)';
    }
    if (diff.inHours > 0) {
      return '${dateTime.formatDateTime()} (in ${diff.inHours}h ${diff.inMinutes % 60}m)';
    }
    return '${dateTime.formatDateTime()} (in ${diff.inMinutes}m)';
  }

  Widget _buildPetName(WidgetRef ref, int petId) {
    final petAsync = ref.watch(petDetailStreamProvider(petId));
    return Text(
      petAsync.value?.name ?? 'Loading...',
      style: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildHistoryPlaceholder(BuildContext context, PawPalColors colors) {
    return Column(
      children: [
        _buildHistoryItem(context, 'Marked as done', '2 hours ago', colors.success, true),
        _buildHistoryItem(context, 'Snoozed 15 min', '1 day ago', colors.warning, false),
        _buildHistoryItem(context, 'Marked as done', '2 days ago', colors.success, true),
        _buildHistoryItem(context, 'Skipped', '3 days ago', colors.error, false),
      ],
    );
  }

  Widget _buildHistoryItem(BuildContext context, String action, String time, Color color, bool isPositive) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  action,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colors.bodyTextColor,
                  ),
                ),
                Text(
                  time,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: colors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isPositive ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: color,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildNotFound(BuildContext context) {
    return Center(
      child: PawlyEmptyState(
        title: 'Reminder Not Found',
        message: 'This reminder could not be found',
        actionLabel: 'Go Back',
        onAction: () => context.pop(),
        icon: Icons.notifications_none_rounded,
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(
      child: CircularProgressIndicator(color: colors.primary),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: PawlyEmptyState(
        title: 'Error Loading Reminder',
        message: error,
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(reminderDetailProvider(reminderId)),
        icon: Icons.error_outline_rounded,
      ),
    );
  }

  void _markDone(BuildContext context, WidgetRef ref, Reminder reminder) {
    // TODO: Log dose/action, calculate next trigger, update reminder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Marked as done! Next reminder scheduled.')),
    );
  }

  void _snooze(BuildContext context, WidgetRef ref, Reminder reminder) {
    // TODO: Reschedule for 15 minutes
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Snoozed for 15 minutes')),
    );
  }

  void _skip(BuildContext context, WidgetRef ref, Reminder reminder) {
    // TODO: Mark current occurrence as skipped, schedule next
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Skipped this occurrence')),
    );
  }

  void _disable(BuildContext context, WidgetRef ref, Reminder reminder) {
    // TODO: Disable reminder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reminder disabled')),
    );
  }
}
