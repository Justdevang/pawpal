// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';

class DewormingEntry {
  final String id;
  final String medicationName;
  final String target; // Flea & Tick, Heartworm, All-in-One
  final DateTime dateGiven;
  final DateTime nextDueDate;
  final double? weight;
  final String? notes;

  DewormingEntry({
    required this.id,
    required this.medicationName,
    required this.target,
    required this.dateGiven,
    required this.nextDueDate,
    this.weight,
    this.notes,
  });
}

final dewormingListProvider = StateProvider.autoDispose<List<DewormingEntry>>((ref) {
  final now = DateTime.now();
  return [
    DewormingEntry(
      id: '1',
      medicationName: 'NexGard Spectra',
      target: 'Fleas, Ticks & Heartworm',
      dateGiven: now.subtract(const Duration(days: 15)),
      nextDueDate: now.add(const Duration(days: 15)),
      weight: 4.2,
      notes: 'Chewable tablet taken with meal',
    ),
    DewormingEntry(
      id: '2',
      medicationName: 'Drontal Plus',
      target: 'Intestinal Worms',
      dateGiven: now.subtract(const Duration(days: 75)),
      nextDueDate: now.add(const Duration(days: 15)),
      weight: 4.0,
      notes: 'Quarterly tapeworm & roundworm treatment',
    ),
  ];
});

class DewormingPage extends ConsumerWidget {
  const DewormingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);
    final entries = ref.watch(dewormingListProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Deworming & Parasites',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: colors.bodyTextColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: entries.isEmpty
            ? Center(
                child: PawlyEmptyState(
                  title: 'No Parasite Treatments',
                  message: 'Log your pet\'s flea, tick or worm prevention treatments.',
                  actionLabel: 'Log Treatment',
                  onAction: () => _showAddTreatmentModal(context, ref),
                  icon: Icons.bug_report_rounded,
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                itemCount: entries.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildProtectionBanner(context, colors);
                  }
                  final item = entries[index - 1];
                  return _buildEntryCard(context, colors, item);
                },
              ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => _showAddTreatmentModal(context, ref),
        icon: Icons.add_rounded,
      ),
    );
  }

  Widget _buildProtectionBanner(BuildContext context, PawPalColors colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.warning.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.warning.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.warning,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.shield_rounded, color: Colors.white, size: 26),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Parasite Protection Active',
                  style: GoogleFonts.baloo2(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: colors.bodyTextColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Next monthly dose due in 15 days',
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    color: colors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEntryCard(BuildContext context, PawPalColors colors, DewormingEntry item) {
    final isUpcoming = item.nextDueDate.isAfter(DateTime.now());

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.divider.withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.warning.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(Icons.medication_liquid_rounded, color: colors.warning, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.medicationName,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.target,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: colors.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Next: ${DateFormat('MMM d').format(item.nextDueDate)}',
                  style: GoogleFonts.nunito(fontSize: 11, fontWeight: FontWeight.w700, color: colors.accent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.surfaceSoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_rounded, size: 14, color: colors.secondaryTextColor),
                const SizedBox(width: 6),
                Text(
                  'Given: ${DateFormat('MMM d, yyyy').format(item.dateGiven)}',
                  style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                ),
                if (item.weight != null) ...[
                  const SizedBox(width: 14),
                  Icon(Icons.monitor_weight_outlined, size: 14, color: colors.secondaryTextColor),
                  const SizedBox(width: 6),
                  Text('${item.weight} kg', style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor)),
                ],
              ],
            ),
          ),
          if (item.notes != null) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                item.notes!,
                style: GoogleFonts.nunito(fontSize: 12, fontStyle: FontStyle.italic, color: colors.secondaryTextColor),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddTreatmentModal(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final medController = TextEditingController(text: 'NexGard Spectra');
    final targetController = TextEditingController(text: 'Fleas & Ticks');
    final weightController = TextEditingController(text: '4.2');
    final notesController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 24),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(color: colors.divider, borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Log Parasite Treatment',
              style: GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.w700, color: colors.bodyTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            PawlyTextField(
              controller: medController,
              labelText: 'Medication / Brand',
              hintText: 'NexGard, Bravecto, Revolution, etc.',
            ),
            const SizedBox(height: 14),
            PawlyTextField(
              controller: targetController,
              labelText: 'Prevention Target',
              hintText: 'Fleas, Ticks, Heartworm, Worms',
            ),
            const SizedBox(height: 14),
            PawlyTextField(
              controller: weightController,
              labelText: 'Pet Weight at Dose (kg)',
              hintText: 'e.g. 4.2',
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 14),
            PawlyTextField(
              controller: notesController,
              labelText: 'Notes',
              hintText: 'Chewable, topical, reaction...',
            ),
            const SizedBox(height: 24),
            PawlyButton(
              label: 'Save Treatment',
              onPressed: () {
                final newEntry = DewormingEntry(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  medicationName: medController.text.trim().isEmpty ? 'Parasite Prevention' : medController.text.trim(),
                  target: targetController.text.trim().isEmpty ? 'General Deworming' : targetController.text.trim(),
                  dateGiven: DateTime.now(),
                  nextDueDate: DateTime.now().add(const Duration(days: 30)),
                  weight: double.tryParse(weightController.text.trim()),
                  notes: notesController.text.trim().isEmpty ? null : notesController.text.trim(),
                );
                ref.read(dewormingListProvider.notifier).update((state) => [newEntry, ...state]);
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }
}
