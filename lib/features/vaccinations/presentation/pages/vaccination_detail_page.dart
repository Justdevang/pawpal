// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/vaccination_record.dart';
import '../providers/vaccination_providers.dart';
import '../providers/vaccination_state_providers.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Vaccination detail page
class VaccinationDetailPage extends ConsumerWidget {
  final int recordId;

  const VaccinationDetailPage({super.key, required this.recordId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final recordAsync = ref.watch(vaccinationRecordDetailProvider(recordId));

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Vaccination Details',
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
            onPressed: () => context.push('/vaccinations/$recordId/edit'),
          ),
        ],
      ),
      body: SafeArea(
        child: recordAsync.when(
          data: (record) {
            if (record == null) {
              return _buildNotFound(context);
            }
            return _buildDetail(context, ref, record);
          },
          loading: () => _buildLoading(context),
          error: (error, stack) => _buildError(context, ref, error.toString()),
        ),
      ),
    );
  }

  Widget _buildDetail(BuildContext context, WidgetRef ref, VaccinationRecord record) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    // Determine status
    HealthRecordCardStatus status;
    if (record.nextDueDate != null) {
      final now = DateTime.now();
      if (record.nextDueDate!.isBefore(now)) {
        status = HealthRecordCardStatus.overdue;
      } else if (record.nextDueDate!.difference(now).inDays <= 7) {
        status = HealthRecordCardStatus.upcoming;
      } else {
        status = HealthRecordCardStatus.completed;
      }
    } else {
      status = HealthRecordCardStatus.completed;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status badge
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Vaccination',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colors.primary,
                  ),
                ),
              ),
              if (status != HealthRecordCardStatus.completed) ...[
                const SizedBox(width: 8),
                PawlyStatusChip(
                  label: status == HealthRecordCardStatus.overdue ? 'Overdue' : 'Due Soon',
                  color: status == HealthRecordCardStatus.overdue ? colors.error : colors.accent,
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          // Vaccine name
          Text(
            record.vaccineName,
            style: GoogleFonts.baloo2(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: colors.primaryDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            record.vetClinic ?? 'Unknown Clinic',
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: colors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 24),
          // Details grid
          _buildDetailRow(context, Icons.calendar_today_rounded, 'Date Given', record.dateGiven.formatDate(), colors),
          if (record.nextDueDate != null)
            _buildDetailRow(context, Icons.event_rounded, 'Next Due', record.nextDueDate!.formatDate(), colors),
          if (record.batchNumber != null)
            _buildDetailRow(context, Icons.confirmation_number_rounded, 'Batch Number', record.batchNumber!, colors),
          if (record.vetClinic != null)
            _buildDetailRow(context, Icons.local_hospital_rounded, 'Vet/Clinic', record.vetClinic!, colors),
          const SizedBox(height: 24),
          // Certificate
          if (record.certificatePhotoUrl != null || record.certificateLocalPath != null) ...[
            Text(
              'Certificate',
              style: GoogleFonts.baloo2(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colors.bodyTextColor,
              ),
            ),
            const SizedBox(height: 12),
            _buildCertificateImage(context, record),
            const SizedBox(height: 24),
          ],
          // Notes
          if (record.notes != null && record.notes!.isNotEmpty) ...[
            Text(
              'Notes',
              style: GoogleFonts.baloo2(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colors.bodyTextColor,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surfaceSoft,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                record.notes!,
                style: GoogleFonts.nunito(fontSize: 14, color: colors.bodyTextColor),
              ),
            ),
            const SizedBox(height: 24),
          ],
          // Actions
          Row(
            children: [
              Expanded(
                child: PawlyButton(
                  label: 'Mark Complete',
                  onPressed: () => _markComplete(context, ref, record),
                  backgroundColor: colors.success,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PawlySecondaryButton(
                  label: 'Edit',
                  onPressed: () => context.push('/vaccinations/$recordId/edit'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          PawlyGhostButton(
            label: 'Delete Record',
            onPressed: () => _showDeleteDialog(context, ref, record),
            textColor: colors.error,
          ),
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
              Text(
                label,
                style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
              ),
              Text(
                value,
                style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500, color: colors.bodyTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateImage(BuildContext context, VaccinationRecord record) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    if (record.certificateLocalPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          record.certificateLocalPath!,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }

    if (record.certificatePhotoUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          record.certificatePhotoUrl!,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _placeholderCertificate(colors),
        ),
      );
    }

    return _placeholderCertificate(colors);
  }

  Widget _placeholderCertificate(PawPalColors colors) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: colors.surfaceSoft,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.divider),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.picture_as_pdf_rounded, size: 48, color: colors.secondaryTextColor),
            const SizedBox(height: 8),
            Text(
              'No certificate uploaded',
              style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotFound(BuildContext context) {
    return Center(
      child: PawlyEmptyState(
        title: 'Record Not Found',
        message: 'This vaccination record could not be found',
        actionLabel: 'Go Back',
        onAction: () => context.pop(),
        icon: Icons.vaccines_rounded,
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
        title: 'Error Loading Record',
        message: error,
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(vaccinationRecordDetailProvider(recordId)),
        icon: Icons.error_outline_rounded,
      ),
    );
  }

  void _markComplete(BuildContext context, WidgetRef ref, VaccinationRecord record) {
    // TODO: Update record, calculate next due date
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Marked as complete!')),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, VaccinationRecord record) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Delete ${record.vaccineName}?', style: GoogleFonts.baloo2(fontSize: 20)),
        content: Text(
          'This will permanently delete this vaccination record. This cannot be undone.',
          style: GoogleFonts.nunito(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.nunito(fontSize: 14)),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(deleteVaccinationRecordUseCaseProvider)(record.id);
              if (context.mounted) context.pop();
            },
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            child: Text('Delete', style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
