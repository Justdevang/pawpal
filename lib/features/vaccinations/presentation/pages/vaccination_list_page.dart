// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/vaccination_record.dart';
import '../providers/vaccination_state_providers.dart';
import 'vaccination_pdf_export.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../pets/presentation/providers/pet_providers.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../../../pets/domain/entities/pet.dart';
import 'package:pawpal/core/extensions/extensions.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Vaccination list page with PDF export
class VaccinationListPage extends ConsumerWidget {
  const VaccinationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final authState = ref.watch(authProvider);
    final user = authState.value;
    final selectedPetId = ref.watch(selectedPetIdProvider);

    if (user == null) {
      return _buildNotLoggedIn(context);
    }

    if (selectedPetId == null) {
      return _buildNoPetSelected(context);
    }

    final recordsAsync = ref.watch(vaccinationRecordsListProvider(selectedPetId));
    final petAsync = ref.watch(petDetailStreamProvider(selectedPetId));
    final pet = petAsync.value;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Vaccinations',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
        actions: [
          // PDF Export
          recordsAsync.when(
            data: (records) {
              if (records.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: Icon(Icons.picture_as_pdf_rounded, color: colors.bodyTextColor),
                onPressed: () => _exportPDF(context, ref, pet, records),
                tooltip: 'Export PDF',
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'pet_selector') {
                context.push('/pets');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'pet_selector',
                child: Row(
                  children: [
                    Icon(Icons.pets_rounded, size: 20, color: colors.bodyTextColor),
                    const SizedBox(width: 12),
                    Text('Switch Pet', style: GoogleFonts.nunito(fontSize: 14)),
                  ],
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.arrow_drop_down_rounded, color: colors.bodyTextColor),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: recordsAsync.when(
          data: (records) {
            if (records.isEmpty) {
              return _buildEmptyState(context);
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return _buildRecordCard(context, record, index)
                    .animate()
                    .fadeIn(duration: 300.ms, delay: (60 * index).ms)
                    .slideX(begin: 0.1, end: 0);
              },
            );
          },
          loading: () => _buildLoadingState(context),
          error: (error, stack) => _buildErrorState(context, ref, selectedPetId, error.toString()),
        ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => context.push('/vaccinations/add'),
        icon: Icons.add_rounded,
      ),
    );
  }

  Future<void> _exportPDF(BuildContext context, WidgetRef ref, Pet? pet, List<VaccinationRecord> records) async {
    if (pet == null) return;

    try {
      await VaccinationPDFExport.sharePDF(
        pet: pet,
        records: records,
        vetClinic: records.firstWhere(
          (r) => r.vetClinic != null,
          orElse: () => records.first,
        ).vetClinic,
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to export PDF: $e')),
        );
      }
    }
  }

  Widget _buildRecordCard(BuildContext context, VaccinationRecord record, int index) {
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

    return PawlyHealthRecordCard(
      title: record.vaccineName,
      subtitle: record.vetClinic,
      lastDate: record.dateGiven.formatDate(),
      nextDate: record.nextDueDate?.formatDate(),
      status: status,
      onTap: () => context.push('/vaccinations/${record.id}'),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'No Vaccinations Yet',
          message: 'Add your pet\'s vaccination records to track due dates',
          actionLabel: 'Add Vaccination',
          onAction: () => context.push('/vaccinations/add'),
          icon: Icons.vaccines_rounded,
        ),
      ),
    );
  }

  Widget _buildNoPetSelected(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Select a Pet',
          message: 'Choose a pet from the home screen to view their vaccinations',
          actionLabel: 'Go to Pets',
          onAction: () => context.push('/pets'),
          icon: Icons.pets_rounded,
        ),
      ),
    );
  }

  Widget _buildNotLoggedIn(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Please Sign In',
          message: 'Sign in to view and manage vaccination records',
          actionLabel: 'Sign In',
          onAction: () => context.go('/login'),
          icon: Icons.login_rounded,
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: colors.primary),
          const SizedBox(height: 16),
          Text(
            'Loading vaccinations...',
            style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, int petId, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Error Loading Vaccinations',
          message: error,
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(vaccinationRecordsListProvider(petId)),
          icon: Icons.error_outline_rounded,
        ),
      ),
    );
  }
}
