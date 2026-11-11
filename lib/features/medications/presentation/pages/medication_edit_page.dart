// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/medication.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../providers/medication_providers.dart';
import '../providers/medication_state_providers.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Edit medication page
class MedicationEditPage extends ConsumerStatefulWidget {
  final int medicationId;

  const MedicationEditPage({super.key, required this.medicationId});

  @override
  ConsumerState<MedicationEditPage> createState() => _MedicationEditPageState();
}

class _MedicationEditPageState extends ConsumerState<MedicationEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _remainingDosesController = TextEditingController();
  final _refillThresholdController = TextEditingController();
  final _vetClinicController = TextEditingController();
  final _prescribingVetController = TextEditingController();

  String _selectedForm = 'tablet';
  String _selectedFrequency = 'daily';
  int _timesPerDay = 1;
  int _everyNHours = 8;
  List<int> _selectedWeekdays = [];
  DateTime _startDate = DateTime.now();
  DateTime? _endDate;
  bool _withFood = false;
  bool _isActive = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMedication();
  }

  Future<void> _loadMedication() async {
    try {
      final medication = await ref.read(getMedicationUseCaseProvider(widget.medicationId).future);
      if (medication != null) {
        setState(() {
          _nameController.text = medication.name;
          _dosageController.text = medication.dosage;
          _selectedForm = medication.form;
          _selectedFrequency = medication.frequencyType;
          _timesPerDay = medication.timesPerDay ?? 1;
          _everyNHours = medication.everyNHours ?? 8;
          _selectedWeekdays = medication.specificWeekdays ?? [];
          _startDate = medication.startDate;
          _endDate = medication.endDate;
          _withFood = medication.withFood;
          _instructionsController.text = medication.instructions ?? '';
          _remainingDosesController.text = medication.remainingDoses?.toString() ?? '';
          _refillThresholdController.text = medication.refillThreshold?.toString() ?? '';
          _vetClinicController.text = medication.vetClinic ?? '';
          _prescribingVetController.text = medication.prescribingVet ?? '';
          _isActive = medication.isActive;
        });
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _instructionsController.dispose();
    _remainingDosesController.dispose();
    _refillThresholdController.dispose();
    _vetClinicController.dispose();
    _prescribingVetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Edit Medication',
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Name
                PawlyTextField(
                  controller: _nameController,
                  labelText: 'Medication Name *',
                  hintText: 'Heartgard Plus',
                  validator: (v) => v?.isEmpty == true ? 'Name is required' : null,
                ),
                const SizedBox(height: 16),
                // Dosage + Form
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: PawlyTextField(
                        controller: _dosageController,
                        labelText: 'Dosage *',
                        hintText: '1 chewable',
                        validator: (v) => v?.isEmpty == true ? 'Dosage is required' : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDropdown(
                        label: 'Form',
                        value: _selectedForm,
                        items: ['tablet', 'liquid', 'injection', 'topical', 'chewable', 'capsule'],
                        onChanged: (v) => setState(() => _selectedForm = v!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Frequency
                _buildDropdown(
                  label: 'Frequency *',
                  value: _selectedFrequency,
                  items: ['once', 'daily', 'times_per_day', 'every_n_hours', 'specific_weekdays', 'custom'],
                  onChanged: (v) => setState(() {
                    _selectedFrequency = v!;
                    if (v == 'times_per_day') _timesPerDay = 2;
                    if (v == 'every_n_hours') _everyNHours = 8;
                  }),
                ),
                const SizedBox(height: 16),
                // Frequency details
                _buildFrequencyDetails(),
                const SizedBox(height: 16),
                // Start/End date
                Row(
                  children: [
                    Expanded(
                      child: _buildDatePicker(
                        label: 'Start Date *',
                        value: _startDate,
                        onTap: () => _pickDate(isStart: true),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDatePicker(
                        label: 'End Date',
                        value: _endDate,
                        onTap: () => _pickDate(isStart: false),
                        isOptional: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // With food
                Row(
                  children: [
                    Checkbox(
                      value: _withFood,
                      onChanged: (v) => setState(() => _withFood = v ?? false),
                      activeColor: colors.primary,
                    ),
                    Text(
                      'Give with food',
                      style: GoogleFonts.nunito(fontSize: 14, color: colors.bodyTextColor),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Active toggle
                Row(
                  children: [
                    Checkbox(
                      value: _isActive,
                      onChanged: (v) => setState(() => _isActive = v ?? true),
                      activeColor: colors.primary,
                    ),
                    Text(
                      'Active',
                      style: GoogleFonts.nunito(fontSize: 14, color: colors.bodyTextColor),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Refill tracking
                Row(
                  children: [
                    Expanded(
                      child: PawlyTextField(
                        controller: _remainingDosesController,
                        labelText: 'Remaining Doses',
                        hintText: '30',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PawlyTextField(
                        controller: _refillThresholdController,
                        labelText: 'Refill Alert At',
                        hintText: '5',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Vet info
                PawlyTextField(
                  controller: _vetClinicController,
                  labelText: 'Vet Clinic',
                  hintText: 'City Animal Hospital',
                ),
                const SizedBox(height: 16),
                PawlyTextField(
                  controller: _prescribingVetController,
                  labelText: 'Prescribing Vet',
                  hintText: 'Dr. Smith',
                ),
                const SizedBox(height: 16),
                // Instructions
                PawlyTextField(
                  controller: _instructionsController,
                  labelText: 'Instructions',
                  hintText: 'Give with morning meal, monitor for vomiting',
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                // Save button
                PawlyButton(
                  label: 'Save Changes',
                  onPressed: _isLoading ? null : _saveMedication,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: colors.searchField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      style: GoogleFonts.nunito(fontSize: 16, color: colors.bodyTextColor),
      dropdownColor: colors.surface,
      items: items.map((item) => DropdownMenuItem(
        value: item,
        child: Text(item.replaceAll('_', ' ').capitalize(), style: GoogleFonts.nunito(fontSize: 16, color: colors.bodyTextColor)),
      )).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildFrequencyDetails() {
    switch (_selectedFrequency) {
      case 'times_per_day':
        return PawlyTextField(
          controller: TextEditingController(text: _timesPerDay.toString()),
          labelText: 'Times per day',
          keyboardType: TextInputType.number,
          onChanged: (v) => _timesPerDay = int.tryParse(v) ?? 1,
        );
      case 'every_n_hours':
        return PawlyTextField(
          controller: TextEditingController(text: _everyNHours.toString()),
          labelText: 'Every N hours',
          keyboardType: TextInputType.number,
          onChanged: (v) => _everyNHours = int.tryParse(v) ?? 8,
        );
      case 'specific_weekdays':
        return _buildWeekdayChips();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildWeekdayChips() {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(7, (index) {
        final isSelected = _selectedWeekdays.contains(index);
        return FilterChip(
          label: Text(weekdays[index], style: GoogleFonts.nunito(fontSize: 12)),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedWeekdays.add(index);
              } else {
                _selectedWeekdays.remove(index);
              }
            });
          },
          selectedColor: colors.primary.withValues(alpha: 0.15),
          checkmarkColor: colors.primary,
          backgroundColor: colors.searchField,
          side: BorderSide.none,
        );
      }),
    );
  }

  Widget _buildDatePicker({
    required String label,
    required DateTime? value,
    required VoidCallback onTap,
    bool isOptional = false,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: colors.searchField,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today_rounded, color: colors.secondaryTextColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value != null
                    ? '$label: ${value.formatDate()}'
                    : '$label${isOptional ? ' (optional)' : ' *'}',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: value != null ? colors.bodyTextColor : colors.secondaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate({required bool isStart}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : (_endDate ?? _startDate.add(const Duration(days: 30))),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (date != null) {
      setState(() {
        if (isStart) {
          _startDate = date;
        } else {
          _endDate = date;
        }
      });
    }
  }

  Future<void> _saveMedication() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authState = ref.read(authProvider);
      final user = authState.value;
      final selectedPetId = ref.read(selectedPetIdProvider);

      if (user == null || selectedPetId == null) {
        throw Exception('User or pet not selected');
      }

      final medication = Medication(
        id: widget.medicationId,
        petId: selectedPetId,
        name: _nameController.text.trim(),
        dosage: _dosageController.text.trim(),
        form: _selectedForm,
        frequencyType: _selectedFrequency,
        timesPerDay: _selectedFrequency == 'times_per_day' ? _timesPerDay : null,
        everyNHours: _selectedFrequency == 'every_n_hours' ? _everyNHours : null,
        specificWeekdays: _selectedFrequency == 'specific_weekdays' && _selectedWeekdays.isNotEmpty ? _selectedWeekdays : null,
        customCron: _selectedFrequency == 'custom' ? null : null,
        startDate: _startDate,
        endDate: _endDate,
        withFood: _withFood,
        instructions: _instructionsController.text.trim().isEmpty ? null : _instructionsController.text.trim(),
        remainingDoses: int.tryParse(_remainingDosesController.text),
        refillThreshold: int.tryParse(_refillThresholdController.text),
        vetClinic: _vetClinicController.text.trim().isEmpty ? null : _vetClinicController.text.trim(),
        prescribingVet: _prescribingVetController.text.trim().isEmpty ? null : _prescribingVetController.text.trim(),
        isActive: _isActive,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await ref.read(updateMedicationUseCaseProvider)(medication);

      if (mounted) {
        setState(() => _isLoading = false);
        ref.invalidate(medicationsListProvider(selectedPetId));
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save medication: $e')),
        );
      }
    }
  }
}
