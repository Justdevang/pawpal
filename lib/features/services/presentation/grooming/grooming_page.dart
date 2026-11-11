// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';

class GroomingItem {
  final String id;
  final String title;
  final String type; // bath, haircut, nails, teeth, ears
  final DateTime date;
  final DateTime? nextDueDate;
  final String? salon;
  final String? notes;

  GroomingItem({
    required this.id,
    required this.title,
    required this.type,
    required this.date,
    this.nextDueDate,
    this.salon,
    this.notes,
  });
}

final groomingListProvider = StateProvider.autoDispose<List<GroomingItem>>((ref) {
  final now = DateTime.now();
  return [
    GroomingItem(
      id: '1',
      title: 'Full Bath & Fur Trim',
      type: 'bath',
      date: now.subtract(const Duration(days: 12)),
      nextDueDate: now.add(const Duration(days: 16)),
      salon: 'Paws & Bubbles Spa',
      notes: 'Used hypoallergenic oatmeal shampoo',
    ),
    GroomingItem(
      id: '2',
      title: 'Nail Clipping & Ear Clean',
      type: 'nails',
      date: now.subtract(const Duration(days: 25)),
      nextDueDate: now.add(const Duration(days: 5)),
      salon: 'Home Care',
      notes: 'Very calm with treats',
    ),
  ];
});

class GroomingPage extends ConsumerWidget {
  const GroomingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);
    final items = ref.watch(groomingListProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Grooming Schedule',
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
        child: items.isEmpty
            ? Center(
                child: PawlyEmptyState(
                  title: 'No Grooming Sessions',
                  message: 'Schedule your pet\'s first bath or haircut!',
                  actionLabel: 'Add Grooming',
                  onAction: () => _showAddGroomingModal(context, ref),
                  icon: Icons.content_cut_rounded,
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildHeaderSummary(context, colors, items);
                  }
                  final item = items[index - 1];
                  return _buildGroomingCard(context, colors, item);
                },
              ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => _showAddGroomingModal(context, ref),
        icon: Icons.add_rounded,
      ),
    );
  }

  Widget _buildHeaderSummary(BuildContext context, PawPalColors colors, List<GroomingItem> items) {
    final nextSession = items.where((i) => i.nextDueDate != null && i.nextDueDate!.isAfter(DateTime.now())).toList()
      ..sort((a, b) => a.nextDueDate!.compareTo(b.nextDueDate!));

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.spa_rounded, color: Colors.white, size: 28),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Next Session',
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  nextSession.isNotEmpty
                      ? '${nextSession.first.title} on ${DateFormat('MMM d').format(nextSession.first.nextDueDate!)}'
                      : 'All groomed & fresh!',
                  style: GoogleFonts.baloo2(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroomingCard(BuildContext context, PawPalColors colors, GroomingItem item) {
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
                  color: colors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(Icons.content_cut_rounded, color: colors.primary, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Done on ${DateFormat('MMM d, yyyy').format(item.date)}',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (item.nextDueDate != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: colors.accent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Due ${DateFormat('MMM d').format(item.nextDueDate!)}',
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: colors.accent,
                    ),
                  ),
                ),
            ],
          ),
          if (item.salon != null || item.notes != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colors.surfaceSoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16, color: colors.secondaryTextColor),
                  const SizedBox(width: 6),
                  Text(
                    item.salon ?? 'Home Care',
                    style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                  ),
                  if (item.notes != null) ...[
                    const Spacer(),
                    Expanded(
                      child: Text(
                        item.notes!,
                        style: GoogleFonts.nunito(fontSize: 12, fontStyle: FontStyle.italic, color: colors.secondaryTextColor),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddGroomingModal(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final titleController = TextEditingController(text: 'Full Bath & Grooming');
    final salonController = TextEditingController();
    final notesController = TextEditingController();
    DateTime date = DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Container(
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
                  decoration: BoxDecoration(
                    color: colors.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Add Grooming Session',
                style: GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.w700, color: colors.bodyTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              PawlyTextField(
                controller: titleController,
                labelText: 'Session Title',
                hintText: 'e.g. Bath, Haircut, Nail Trim',
              ),
              const SizedBox(height: 14),
              PawlyTextField(
                controller: salonController,
                labelText: 'Salon / Place',
                hintText: 'e.g. Paws & Bubbles Spa or Home',
              ),
              const SizedBox(height: 14),
              PawlyTextField(
                controller: notesController,
                labelText: 'Notes',
                hintText: 'Special shampoo, coat conditioner, etc.',
              ),
              const SizedBox(height: 24),
              PawlyButton(
                label: 'Save Session',
                onPressed: () {
                  final newItem = GroomingItem(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: titleController.text.trim().isEmpty ? 'Grooming' : titleController.text.trim(),
                    type: 'bath',
                    date: date,
                    nextDueDate: date.add(const Duration(days: 28)),
                    salon: salonController.text.trim().isEmpty ? null : salonController.text.trim(),
                    notes: notesController.text.trim().isEmpty ? null : notesController.text.trim(),
                  );
                  ref.read(groomingListProvider.notifier).update((state) => [newItem, ...state]);
                  Navigator.pop(ctx);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
