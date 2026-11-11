// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/medication.dart';
import '../providers/medication_providers.dart';
import '../providers/medication_state_providers.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Medication list page with real data
class MedicationListPage extends ConsumerWidget {
  const MedicationListPage({super.key});

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

    final medicationsAsync = ref.watch(medicationsListProvider(selectedPetId));
    final refillAsync = ref.watch(getMedicationsNeedingRefillUseCaseProvider)(selectedPetId);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Medications',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
        actions: [
          // Refill alerts badge
          FutureBuilder(
            future: refillAsync,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              final refillMeds = snapshot.data!.fold((l) => <Medication>[], (r) => r);
              if (refillMeds.isEmpty) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.inventory_rounded, color: colors.bodyTextColor),
                      onPressed: () => _showRefillDialog(context, refillMeds),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: colors.error,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                        child: Text(
                          '${refillMeds.length}',
                          style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
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
        child: medicationsAsync.when(
          data: (medications) {
            if (medications.isEmpty) {
              return _buildEmptyState(context);
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                return _buildMedicationCard(context, medication, index)
                    .animate()
                    .fadeIn(duration: 300.ms, delay: (60 * index).ms)
                    .slideY(begin: 0.1, end: 0);
              },
            );
          },
          loading: () => _buildLoadingState(context),
          error: (error, stack) => _buildErrorState(context, ref, selectedPetId, error.toString()),
        ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => context.push('/medications/add'),
        icon: Icons.add_rounded,
      ),
    );
  }

  Widget _buildMedicationCard(BuildContext context, Medication medication, int index) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colors.overlay.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medication.name,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    Text(
                      '${medication.dosage} ${medication.form} • ${_formatFrequency(medication)}',
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: medication.isActive ? colors.success.withValues(alpha: 0.15) : colors.secondaryTextColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      medication.isActive ? Icons.check_circle_rounded : Icons.pause_circle_rounded,
                      size: 12,
                      color: medication.isActive ? colors.success : colors.secondaryTextColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      medication.isActive ? 'Active' : 'Paused',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: medication.isActive ? colors.success : colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.access_time_rounded, size: 16, color: colors.secondaryTextColor),
              const SizedBox(width: 6),
              Text(
                'Next dose: Today 08:00 AM', // TODO: Calculate from schedule
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: colors.bodyTextColor,
                ),
              ),
              const Spacer(),
              // Refill alert on card
              if (medication.remainingDoses != null && medication.refillThreshold != null &&
                  medication.remainingDoses! <= medication.refillThreshold!)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colors.warning.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.warning_amber_rounded, size: 12, color: colors.warning),
                      const SizedBox(width: 4),
                      Text(
                        'Refill: ${medication.remainingDoses} left',
                        style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.w600, color: colors.warning),
                      ),
                    ],
                  ),
                ),
              const SizedBox(width: 8),
              PawlyGhostButton(
                label: 'Log Dose',
                onPressed: () => context.push('/medications/${medication.id}'),
                leadingIcon: Icons.add_rounded,
              ),
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
        return '${medication.timesPerDay}x/day';
      case 'every_n_hours':
        return 'Every ${medication.everyNHours}h';
      case 'specific_weekdays':
        final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return medication.specificWeekdays?.map((d) => days[d]).join(', ') ?? 'Custom';
      case 'custom':
        return 'Custom';
      default:
        return medication.frequencyType;
    }
  }

  void _showRefillDialog(BuildContext context, List<Medication> medications) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: colors.warning),
            const SizedBox(width: 8),
            Text('Refill Needed', style: GoogleFonts.baloo2(fontSize: 20)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: medications.map((med) => ListTile(
            leading: Icon(Icons.medication_rounded, color: colors.warning),
            title: Text(med.name, style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text('${med.remainingDoses} doses left (alert at ${med.refillThreshold})', style: GoogleFonts.nunito(fontSize: 13)),
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'No Medications Yet',
          message: 'Add medications to track doses and get reminders',
          actionLabel: 'Add Medication',
          onAction: () => context.push('/medications/add'),
          icon: Icons.medication_rounded,
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
          message: 'Choose a pet from the home screen to view their medications',
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
          message: 'Sign in to view and manage medications',
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
            'Loading medications...',
            style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, int selectedPetId, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Error Loading Medications',
          message: error,
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(medicationsListProvider(selectedPetId)),
          icon: Icons.error_outline_rounded,
        ),
      ),
    );
  }
}
