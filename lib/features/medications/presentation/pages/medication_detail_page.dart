// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/medication.dart';
import '../../domain/entities/dose_log.dart';
import '../providers/medication_providers.dart';
import '../providers/medication_state_providers.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Medication detail page with dose history
class MedicationDetailPage extends ConsumerWidget {
  final int medicationId;

  const MedicationDetailPage({super.key, required this.medicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final medicationAsync = ref.watch(getMedicationUseCaseProvider(medicationId));

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Medication Details',
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
        actions: [
          IconButton(
            icon: Icon(Icons.edit_rounded, color: colors.bodyTextColor),
            onPressed: () => context.push('/medications/$medicationId/edit'),
          ),
        ],
      ),
      body: SafeArea(
        child: medicationAsync.when(
          data: (medication) {
            if (medication == null) {
              return _buildNotFound(context);
            }
            return _buildDetail(context, ref, medication);
          },
          loading: () => _buildLoading(context),
          error: (error, stack) => _buildError(context, ref, error.toString()),
        ),
      ),
    );
  }

  Widget _buildDetail(BuildContext context, WidgetRef ref, Medication medication) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: medication.isActive ? colors.success.withValues(alpha: 0.15) : colors.secondaryTextColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              medication.isActive ? 'Active' : 'Paused',
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: medication.isActive ? colors.success : colors.secondaryTextColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Name
          Text(
            medication.name,
            style: GoogleFonts.baloo2(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: colors.primaryDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${medication.dosage} ${medication.form}',
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: colors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 24),
          // Details
          _buildDetailRow(context, Icons.repeat_rounded, 'Frequency', _formatFrequency(medication), colors),
          _buildDetailRow(context, Icons.calendar_today_rounded, 'Start Date', medication.startDate.formatDate(), colors),
          if (medication.endDate != null)
            _buildDetailRow(context, Icons.event_rounded, 'End Date', medication.endDate!.formatDate(), colors),
          _buildDetailRow(context, Icons.restaurant_rounded, 'With Food', medication.withFood ? 'Yes' : 'No', colors),
          if (medication.vetClinic != null)
            _buildDetailRow(context, Icons.local_hospital_rounded, 'Vet/Clinic', medication.vetClinic!, colors),
          if (medication.prescribingVet != null)
            _buildDetailRow(context, Icons.person_rounded, 'Prescribing Vet', medication.prescribingVet!, colors),
          if (medication.remainingDoses != null)
            _buildDetailRow(context, Icons.inventory_rounded, 'Remaining Doses', medication.remainingDoses.toString(), colors),
          if (medication.refillThreshold != null)
            _buildDetailRow(context, Icons.warning_rounded, 'Refill Alert At', medication.refillThreshold.toString(), colors),
          if (medication.instructions != null && medication.instructions!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Instructions',
              style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surfaceSoft,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(medication.instructions!, style: GoogleFonts.nunito(fontSize: 14, color: colors.bodyTextColor)),
            ),
          ],
          const SizedBox(height: 24),
          // Refill alert
          if (medication.remainingDoses != null && medication.refillThreshold != null &&
              medication.remainingDoses! <= medication.refillThreshold!) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colors.warning.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: colors.warning, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Refill Needed',
                          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600, color: colors.warning),
                        ),
                        Text(
                          '${medication.remainingDoses} doses left (alert at ${medication.refillThreshold})',
                          style: GoogleFonts.nunito(fontSize: 12, color: colors.warning),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
          // Adherence streak
          FutureBuilder(
            future: ref.read(getAdherenceStreakUseCaseProvider)(medication.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final dynamic data = snapshot.data;
                final streak = data.fold((l) => 0, (r) => r);
                return _buildStreakCard(context, streak);
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 24),
          // Dose History
          Text(
            'Dose History',
            style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
          ),
          const SizedBox(height: 12),
          _buildDoseHistory(context, ref, medication.id),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String label, String value, PawPalColors colors) {
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
              Text(label, style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor)),
              Text(value, style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500, color: colors.bodyTextColor)),
            ],
          ),
        ],
      ),
    );
  }

  String _formatFrequency(Medication medication) {
    switch (medication.frequencyType) {
      case 'once':
        return 'Once';
      case 'daily':
        return 'Daily';
      case 'times_per_day':
        return '${medication.timesPerDay} times/day';
      case 'every_n_hours':
        return 'Every ${medication.everyNHours} hours';
      case 'specific_weekdays':
        final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return medication.specificWeekdays?.map((d) => days[d]).join(', ') ?? 'N/A';
      case 'custom':
        return 'Custom schedule';
      default:
        return medication.frequencyType;
    }
  }

  Widget _buildStreakCard(BuildContext context, int streak) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.success, colors.success.withValues(alpha: 0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.local_fire_department_rounded, color: Colors.white, size: 32),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$streak Day Streak!',
                style: GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              Text(
                'Keep up the great work!',
                style: GoogleFonts.nunito(fontSize: 14, color: Colors.white.withValues(alpha: 0.9)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoseHistory(BuildContext context, WidgetRef ref, int medicationId) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return FutureBuilder(
      future: ref.read(getDoseLogsUseCaseProvider)(medicationId, from: DateTime.now().subtract(const Duration(days: 30))),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final dynamic data = snapshot.data;
        final logs = data.fold((l) => <DoseLog>[], (r) => (r as List).cast<DoseLog>());
        if (logs.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text('No dose history yet', style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor)),
            ),
          );
        }

        return Column(
          children: logs.map((log) => _buildDoseLogItem(context, log)).toList(),
        );
      },
    );
  }

  Widget _buildDoseLogItem(BuildContext context, DoseLog log) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: log.wasTaken ? colors.success : (log.wasSkipped ? colors.warning : colors.error),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.wasTaken ? 'Taken' : (log.wasSkipped ? 'Skipped' : 'Missed'),
                  style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500, color: colors.bodyTextColor),
                ),
                Text(
                  'Scheduled: ${log.scheduledTime.formatDateTime()}',
                  style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                ),
                if (log.actualTime != null)
                  Text(
                    'Actual: ${log.actualTime!.formatDateTime()}',
                    style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                  ),
              ],
            ),
          ),
          if (log.sideEffects != null && log.sideEffects!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '⚠ ${log.sideEffects}',
                style: GoogleFonts.nunito(fontSize: 12, color: colors.error),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotFound(BuildContext context) {
    return Center(
      child: PawlyEmptyState(
        title: 'Medication Not Found',
        message: 'This medication could not be found',
        actionLabel: 'Go Back',
        onAction: () => context.pop(),
        icon: Icons.medication_rounded,
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(child: CircularProgressIndicator(color: colors.primary));
  }

  Widget _buildError(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: PawlyEmptyState(
        title: 'Error Loading Medication',
        message: error,
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(getMedicationUseCaseProvider(medicationId)),
        icon: Icons.error_outline_rounded,
      ),
    );
  }
}
