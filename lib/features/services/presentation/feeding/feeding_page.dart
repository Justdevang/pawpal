// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';

class MealSchedule {
  final String id;
  final String name; // Breakfast, Lunch, Dinner
  final String time;
  final String portion;
  final String foodBrand;
  bool isCompletedToday;

  MealSchedule({
    required this.id,
    required this.name,
    required this.time,
    required this.portion,
    required this.foodBrand,
    this.isCompletedToday = false,
  });
}

final feedingScheduleProvider = StateProvider.autoDispose<List<MealSchedule>>((ref) {
  return [
    MealSchedule(
      id: '1',
      name: 'Breakfast',
      time: '08:00 AM',
      portion: '1.5 cups (150g)',
      foodBrand: 'Royal Canin Adult Formula',
      isCompletedToday: true,
    ),
    MealSchedule(
      id: '2',
      name: 'Dinner',
      time: '07:30 PM',
      portion: '1.5 cups (150g) + Salmon Oil',
      foodBrand: 'Royal Canin Adult Formula',
      isCompletedToday: false,
    ),
  ];
});

final foodStockDaysProvider = StateProvider.autoDispose<int>((ref) => 8);

class FeedingPage extends ConsumerWidget {
  const FeedingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);
    final meals = ref.watch(feedingScheduleProvider);
    final stockDays = ref.watch(foodStockDaysProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Feeding & Diet',
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
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          children: [
            // Inventory Alert
            _buildStockBanner(context, colors, ref, stockDays),
            const SizedBox(height: 20),
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Meals",
                  style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w700, color: colors.bodyTextColor),
                ),
                Text(
                  '${meals.where((m) => m.isCompletedToday).length}/${meals.length} Fed',
                  style: GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w700, color: colors.accent),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...meals.map((meal) => _buildMealCard(context, colors, ref, meal)),
          ],
        ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => _showAddMealModal(context, ref),
        icon: Icons.add_rounded,
      ),
    );
  }

  Widget _buildStockBanner(BuildContext context, PawPalColors colors, WidgetRef ref, int days) {
    final isLow = days <= 10;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isLow ? colors.warning.withValues(alpha: 0.15) : colors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isLow ? colors.warning.withValues(alpha: 0.6) : colors.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isLow ? colors.warning : colors.success,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.inventory_2_rounded, color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLow ? 'Food Stock Low!' : 'Food Supply Sufficient',
                  style: GoogleFonts.baloo2(fontSize: 16, fontWeight: FontWeight.w700, color: colors.bodyTextColor),
                ),
                Text(
                  'Approx. $days days of food remaining',
                  style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                ),
              ],
            ),
          ),
          FilledButton.tonal(
            onPressed: () {
              ref.read(foodStockDaysProvider.notifier).state = 30;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Food bag restocked! Reset to 30 days.')),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: isLow ? colors.warning : colors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Restock', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(BuildContext context, PawPalColors colors, WidgetRef ref, MealSchedule meal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: meal.isCompletedToday ? colors.success.withValues(alpha: 0.6) : colors.divider.withValues(alpha: 0.6),
          width: meal.isCompletedToday ? 1.5 : 1.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: meal.isCompletedToday ? colors.success.withValues(alpha: 0.15) : colors.surfaceSoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.restaurant_rounded,
              color: meal.isCompletedToday ? colors.success : colors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      meal.name,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '• ${meal.time}',
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: colors.accent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '${meal.portion} (${meal.foodBrand})',
                  style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              meal.isCompletedToday ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: meal.isCompletedToday ? colors.success : colors.secondaryTextColor,
              size: 28,
            ),
            onPressed: () {
              ref.read(feedingScheduleProvider.notifier).update((state) {
                return state.map((m) {
                  if (m.id == meal.id) {
                    return MealSchedule(
                      id: m.id,
                      name: m.name,
                      time: m.time,
                      portion: m.portion,
                      foodBrand: m.foodBrand,
                      isCompletedToday: !m.isCompletedToday,
                    );
                  }
                  return m;
                }).toList();
              });
            },
          ),
        ],
      ),
    );
  }

  void _showAddMealModal(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final nameController = TextEditingController(text: 'Afternoon Snack');
    final timeController = TextEditingController(text: '02:00 PM');
    final portionController = TextEditingController(text: '1 Treat or 50g');
    final brandController = TextEditingController(text: 'Healthy Chew / Kibble');

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
              'Add Meal Schedule',
              style: GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.w700, color: colors.bodyTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            PawlyTextField(
              controller: nameController,
              labelText: 'Meal Name',
              hintText: 'e.g. Breakfast, Dinner, Snack',
            ),
            const SizedBox(height: 14),
            PawlyTextField(
              controller: timeController,
              labelText: 'Time',
              hintText: 'e.g. 08:00 AM',
            ),
            const SizedBox(height: 14),
            PawlyTextField(
              controller: portionController,
              labelText: 'Portion Size',
              hintText: 'e.g. 1.5 cups, 150g',
            ),
            const SizedBox(height: 14),
            PawlyTextField(
              controller: brandController,
              labelText: 'Food Brand / Type',
              hintText: 'e.g. Royal Canin / Raw Diet',
            ),
            const SizedBox(height: 24),
            PawlyButton(
              label: 'Save Meal',
              onPressed: () {
                final newMeal = MealSchedule(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: nameController.text.trim().isEmpty ? 'Meal' : nameController.text.trim(),
                  time: timeController.text.trim().isEmpty ? '12:00 PM' : timeController.text.trim(),
                  portion: portionController.text.trim().isEmpty ? '1 cup' : portionController.text.trim(),
                  foodBrand: brandController.text.trim().isEmpty ? 'Standard' : brandController.text.trim(),
                );
                ref.read(feedingScheduleProvider.notifier).update((state) => [...state, newMeal]);
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }
}
