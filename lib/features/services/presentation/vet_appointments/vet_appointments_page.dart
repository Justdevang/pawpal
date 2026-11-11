// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/database/database.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import 'vet_appointments_service.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Vet appointments list page
class VetAppointmentsPage extends ConsumerWidget {
  const VetAppointmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);

    if (selectedPetId == null) {
      return _buildNoPetSelected(context);
    }

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Vet Appointments',
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
        child: StreamBuilder<List<Appointment>>(
          stream: ref.watch(vetAppointmentsServiceProvider).watchAppointments(selectedPetId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingState(context);
            }
            if (snapshot.hasError) {
              return _buildErrorState(context, ref, snapshot.error.toString());
            }
            final appointments = snapshot.data ?? [];
            if (appointments.isEmpty) {
              return _buildEmptyState(context);
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return _buildAppointmentCard(context, ref, appointment, index)
                    .animate()
                    .fadeIn(duration: 300.ms, delay: (60 * index).ms)
                    .slideX(begin: 0.1, end: 0);
              },
            );
          },
        ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => context.push('/services/vet_appointments/add'),
        icon: Icons.add_rounded,
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, WidgetRef ref, Appointment appointment, int index) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    final isUpcoming = appointment.appointmentDate.isAfter(DateTime.now());

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => context.push('/services/vet_appointments/${appointment.id}'),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: isUpcoming ? Border.all(color: colors.accent.withValues(alpha: 0.5)) : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: colors.accent.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.local_hospital_rounded,
                      color: colors.accent,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.title,
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: colors.bodyTextColor,
                          ),
                        ),
                        if (appointment.clinicName != null)
                          Text(
                            appointment.clinicName!,
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
                      color: isUpcoming
                          ? colors.accent.withValues(alpha: 0.15)
                          : colors.secondaryTextColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      isUpcoming ? 'Upcoming' : 'Past',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isUpcoming ? colors.accent : colors.secondaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today_rounded, size: 16, color: colors.secondaryTextColor),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('EEE, MMM d, yyyy').format(appointment.appointmentDate),
                    style: GoogleFonts.nunito(fontSize: 13, color: colors.bodyTextColor),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time_rounded, size: 16, color: colors.secondaryTextColor),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('h:mm a').format(appointment.appointmentDate),
                    style: GoogleFonts.nunito(fontSize: 13, color: colors.bodyTextColor),
                  ),
                ],
              ),
              if (appointment.clinicAddress != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded, size: 16, color: colors.secondaryTextColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        appointment.clinicAddress!,
                        style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
              if (appointment.notes != null && appointment.notes!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colors.surfaceSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    appointment.notes!,
                    style: GoogleFonts.nunito(fontSize: 12, color: colors.bodyTextColor),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'No Appointments Yet',
          message: 'Book your first vet appointment to get started',
          actionLabel: 'Add Appointment',
          onAction: () => context.push('/services/vet_appointments/add'),
          icon: Icons.local_hospital_rounded,
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
          message: 'Choose a pet from the home screen to view their appointments',
          actionLabel: 'Go to Pets',
          onAction: () => context.push('/pets'),
          icon: Icons.local_hospital_rounded,
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
          Text('Loading appointments...', style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor)),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: PawlyEmptyState(
        title: 'Error Loading Appointments',
        message: error,
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(vetAppointmentsServiceProvider),
        icon: Icons.error_outline_rounded,
      ),
    );
  }
}
