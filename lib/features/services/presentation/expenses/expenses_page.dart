// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';

class PetExpense {
  final String id;
  final String title;
  final String category; // Vet Care, Food, Medication, Grooming, Insurance, Gear
  final double amount;
  final DateTime date;
  final String merchant;
  final bool isClaimed;
  final String? notes;

  PetExpense({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.merchant,
    this.isClaimed = false,
    this.notes,
  });
}

final expensesListProvider = StateProvider.autoDispose<List<PetExpense>>((ref) {
  final now = DateTime.now();
  return [
    PetExpense(
      id: '1',
      title: 'Annual Comprehensive Vet Exam',
      category: 'Vet Care',
      amount: 145.00,
      date: now.subtract(const Duration(days: 4)),
      merchant: 'Paws & Claws Animal Hospital',
      isClaimed: true,
      notes: 'Submitted claim to Healthy Paws insurance.',
    ),
    PetExpense(
      id: '2',
      title: 'Royal Canin Adult Kibble 30lb',
      category: 'Food',
      amount: 84.99,
      date: now.subtract(const Duration(days: 14)),
      merchant: 'Chewy.com',
      isClaimed: false,
    ),
    PetExpense(
      id: '3',
      title: 'NexGard Flea & Tick 6-Month Pack',
      category: 'Medication',
      amount: 128.50,
      date: now.subtract(const Duration(days: 22)),
      merchant: 'Petco Pharmacy',
      isClaimed: true,
      notes: 'Prescription covered under wellness add-on.',
    ),
    PetExpense(
      id: '4',
      title: 'Monthly Pet Insurance Premium',
      category: 'Insurance',
      amount: 48.00,
      date: now.subtract(const Duration(days: 30)),
      merchant: 'Healthy Paws Pet Insurance',
      isClaimed: false,
    ),
    PetExpense(
      id: '5',
      title: 'Bath, Deshedding & Nail Trim',
      category: 'Grooming',
      amount: 65.00,
      date: now.subtract(const Duration(days: 35)),
      merchant: 'Paws & Bubbles Grooming',
      isClaimed: false,
    ),
  ];
});

class ExpensesPage extends ConsumerWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPet = ref.watch(selectedPetProvider);
    final expenses = ref.watch(expensesListProvider);

    final totalSpent = expenses.fold<double>(0.0, (sum, item) => sum + item.amount);
    final vetSpent = expenses
        .where((e) => e.category == 'Vet Care' || e.category == 'Medication')
        .fold<double>(0.0, (sum, item) => sum + item.amount);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Insurance & Expenses',
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
        child: expenses.isEmpty
            ? Center(
                child: PawlyEmptyState(
                  title: 'No Expenses Logged',
                  message: 'Track vet bills, food, medications and insurance claims.',
                  actionLabel: 'Log Expense',
                  onAction: () => _showAddExpenseModal(context, ref),
                  icon: Icons.receipt_long_rounded,
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                itemCount: expenses.length + 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildSpendingSummary(context, colors, totalSpent, vetSpent);
                  }
                  if (index == 1) {
                    return _buildInsurancePolicyCard(context, colors, selectedPet?.name ?? 'Pet');
                  }
                  final expense = expenses[index - 2];
                  return _buildExpenseTile(context, ref, expense, colors);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddExpenseModal(context, ref),
        backgroundColor: colors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: Text(
          'Log Expense',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSpendingSummary(
    BuildContext context,
    PawPalColors colors,
    double totalSpent,
    double vetSpent,
  ) {
    final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 2);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary, colors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.25),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Tracked Spending',
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'All Time',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            currencyFormat.format(totalSpent),
            style: GoogleFonts.baloo2(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryStat('Medical / Vet', currencyFormat.format(vetSpent)),
                Container(width: 1, height: 26, color: Colors.white.withValues(alpha: 0.3)),
                _buildSummaryStat('General Care', currencyFormat.format(totalSpent - vetSpent)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 11,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildInsurancePolicyCard(
    BuildContext context,
    PawPalColors colors,
    String petName,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceSoft,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.accent.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: colors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.health_and_safety_rounded, color: colors.accent, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Healthy Paws Pet Insurance',
                      style: GoogleFonts.baloo2(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    Text(
                      'Policy #HP-892401 • 80% Reimbursement',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Active',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: colors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Annual Deductible: \$250.00 (\$105 remaining)',
                style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
              ),
              Text(
                'Submit Claim',
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: colors.accent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseTile(
    BuildContext context,
    WidgetRef ref,
    PetExpense expense,
    PawPalColors colors,
  ) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 2);

    IconData catIcon;
    Color catColor;
    switch (expense.category) {
      case 'Vet Care':
        catIcon = Icons.local_hospital_rounded;
        catColor = colors.accent;
        break;
      case 'Food':
        catIcon = Icons.restaurant_rounded;
        catColor = colors.success;
        break;
      case 'Medication':
        catIcon = Icons.medication_rounded;
        catColor = colors.warning;
        break;
      case 'Grooming':
        catIcon = Icons.content_cut_rounded;
        catColor = colors.primaryDark;
        break;
      case 'Insurance':
        catIcon = Icons.shield_rounded;
        catColor = colors.primary;
        break;
      default:
        catIcon = Icons.receipt_rounded;
        catColor = colors.secondaryTextColor;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surfaceSoft,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: catColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(catIcon, color: catColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: colors.bodyTextColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${expense.merchant} • ${dateFormat.format(expense.date)}',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    color: colors.secondaryTextColor,
                  ),
                ),
                if (expense.isClaimed) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: colors.success.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Insurance Claimed',
                      style: GoogleFonts.nunito(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: colors.success,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currencyFormat.format(expense.amount),
                style: GoogleFonts.baloo2(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colors.bodyTextColor,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded, size: 18, color: Colors.grey),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  ref.read(expensesListProvider.notifier).update(
                        (list) => list.where((e) => e.id != expense.id).toList(),
                      );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Expense deleted')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddExpenseModal(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final titleCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    final merchantCtrl = TextEditingController();
    String category = 'Vet Care';
    bool isInsuranceClaim = false;
    DateTime selectedDate = DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.surfaceSoft,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colors.divider,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Log Pet Expense',
                      style: GoogleFonts.baloo2(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: titleCtrl,
                      decoration: InputDecoration(
                        labelText: 'Description / Item *',
                        hintText: 'e.g. Wellness Exam, Flea Pills',
                        filled: true,
                        fillColor: colors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: amountCtrl,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: 'Amount (\$) *',
                              hintText: '0.00',
                              prefixText: '\$ ',
                              filled: true,
                              fillColor: colors.background,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: category,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              filled: true,
                              fillColor: colors.background,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            dropdownColor: colors.surfaceSoft,
                            items: const [
                              DropdownMenuItem(value: 'Vet Care', child: Text('Vet Care')),
                              DropdownMenuItem(value: 'Food', child: Text('Food')),
                              DropdownMenuItem(value: 'Medication', child: Text('Medication')),
                              DropdownMenuItem(value: 'Grooming', child: Text('Grooming')),
                              DropdownMenuItem(value: 'Insurance', child: Text('Insurance')),
                              DropdownMenuItem(value: 'Gear', child: Text('Gear & Toys')),
                            ],
                            onChanged: (val) {
                              if (val != null) setModalState(() => category = val);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: merchantCtrl,
                      decoration: InputDecoration(
                        labelText: 'Merchant / Clinic',
                        hintText: 'e.g. City Vet, Chewy, Petco',
                        filled: true,
                        fillColor: colors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Date of Expense', style: GoogleFonts.nunito(fontWeight: FontWeight.w600)),
                      subtitle: Text(DateFormat('MMMM dd, yyyy').format(selectedDate)),
                      trailing: Icon(Icons.calendar_today_rounded, color: colors.primary),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setModalState(() => selectedDate = picked);
                        }
                      },
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'File Insurance Claim',
                        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Mark this expense for insurance tracking'),
                      value: isInsuranceClaim,
                      activeColor: colors.primary,
                      onChanged: (val) {
                        setModalState(() => isInsuranceClaim = val ?? false);
                      },
                    ),
                    const SizedBox(height: 16),
                    PawlyButton(
                      label: 'Save Expense',
                      onPressed: () {
                        final amount = double.tryParse(amountCtrl.text.trim()) ?? 0.0;
                        if (titleCtrl.text.trim().isEmpty || amount <= 0) return;

                        final newExpense = PetExpense(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          title: titleCtrl.text.trim(),
                          category: category,
                          amount: amount,
                          date: selectedDate,
                          merchant: merchantCtrl.text.trim().isEmpty
                              ? 'Pet Store / Vet'
                              : merchantCtrl.text.trim(),
                          isClaimed: isInsuranceClaim,
                        );

                        ref.read(expensesListProvider.notifier).update(
                              (list) => [newExpense, ...list],
                            );
                        Navigator.pop(ctx);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Expense logged successfully!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
