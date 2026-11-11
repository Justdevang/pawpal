// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/database/database.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../weight_tracker/weight_tracker_service.dart';

/// Add/Edit weight entry page
class WeightEntryEditPage extends ConsumerStatefulWidget {
  final int? entryId;

  const WeightEntryEditPage({super.key, this.entryId});

  @override
  ConsumerState<WeightEntryEditPage> createState() => _WeightEntryEditPageState();
}

class _WeightEntryEditPageState extends ConsumerState<WeightEntryEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedUnit = 'kg';
  DateTime _date = DateTime.now();
  String _source = 'manual';
  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.entryId != null;
    if (_isEditing) {
      _loadEntry();
    }
  }

  Future<void> _loadEntry() async {
    final entry = await ref.read(weightTrackerServiceProvider).getWeightEntry(widget.entryId!);
    if (entry != null) {
      setState(() {
        _weightController.text = entry.weight.toStringAsFixed(1);
        _selectedUnit = entry.unit;
        _date = entry.date;
        _notesController.text = entry.notes ?? '';
        _source = entry.source;
      });
    }
  }

  @override
  void dispose() {
    _weightController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Edit Weight' : 'Add Weight Entry',
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
                // Weight
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PawlyTextField(
                        controller: _weightController,
                        labelText: 'Weight *',
                        hintText: '12.8',
                        keyboardType: TextInputType.number,
                        validator: (v) => v?.isEmpty == true ? 'Weight is required' : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDropdown(
                        label: 'Unit',
                        value: _selectedUnit,
                        items: ['kg', 'lb'],
                        onChanged: (v) => setState(() => _selectedUnit = v!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Date
                _buildDatePicker(
                  label: 'Date *',
                  value: _date,
                  onTap: () => _pickDate(),
                ),
                const SizedBox(height: 16),
                // Source
                _buildDropdown(
                  label: 'Source',
                  value: _source,
                  items: ['manual', 'smart_scale', 'vet'],
                  onChanged: (v) => setState(() => _source = v!),
                ),
                const SizedBox(height: 16),
                // Notes
                PawlyTextField(
                  controller: _notesController,
                  labelText: 'Notes',
                  hintText: 'Measured after walk, before breakfast...',
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                // Save button
                PawlyButton(
                  label: _isEditing ? 'Save Changes' : 'Add Weight',
                  onPressed: _isLoading ? null : _saveEntry,
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
        child: Text(item.capitalize(), style: GoogleFonts.nunito(fontSize: 16, color: colors.bodyTextColor)),
      )).toList(),
      onChanged: onChanged,
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

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => _date = date);
  }

  Future<void> _saveEntry() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final selectedPetId = ref.watch(selectedPetIdProvider);
      if (selectedPetId == null) throw Exception('No pet selected');

      final entry = WeightEntry(
        id: widget.entryId ?? 0,
        petId: selectedPetId,
        weight: double.parse(_weightController.text),
        unit: _selectedUnit,
        date: _date,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        source: _source,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
      );

      if (_isEditing) {
        await ref.read(weightTrackerServiceProvider).updateWeightEntry(entry);
      } else {
        await ref.read(weightTrackerServiceProvider).createWeightEntry(entry);
      }

      if (mounted) {
        setState(() => _isLoading = false);
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save weight entry: $e')));
      }
    }
  }
}