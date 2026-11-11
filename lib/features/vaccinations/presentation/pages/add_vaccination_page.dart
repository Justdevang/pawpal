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
import '../../../pets/presentation/providers/pet_providers.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Add vaccination page with real database integration
class AddVaccinationPage extends ConsumerStatefulWidget {
  final int? recordId;
  const AddVaccinationPage({super.key, this.recordId});

  @override
  ConsumerState<AddVaccinationPage> createState() => _AddVaccinationPageState();
}

class _AddVaccinationPageState extends ConsumerState<AddVaccinationPage> {
  final _formKey = GlobalKey<FormState>();
  final _vetClinicController = TextEditingController();
  final _batchNumberController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedVaccine = 'Rabies';
  DateTime _dateGiven = DateTime.now();
  DateTime? _nextDueDate;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.recordId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadRecord());
    }
  }

  Future<void> _loadRecord() async {
    final record = await ref.read(vaccinationRecordDetailProvider(widget.recordId!).future);
    if (record != null && mounted) {
      setState(() {
        _selectedVaccine = record.vaccineName;
        _dateGiven = record.dateGiven;
        _nextDueDate = record.nextDueDate;
        _vetClinicController.text = record.vetClinic ?? '';
        _batchNumberController.text = record.batchNumber ?? '';
        _notesController.text = record.notes ?? '';
      });
    }
  }

  @override
  void dispose() {
    _vetClinicController.dispose();
    _batchNumberController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          widget.recordId != null ? 'Edit Vaccination' : 'Add Vaccination',
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
                // Pet indicator
                if (selectedPetId != null)
                  _buildPetIndicator(context, selectedPetId),
                const SizedBox(height: 16),
                // Vaccine selector from templates
                _buildVaccineSelector(),
                const SizedBox(height: 16),
                // Date given
                _buildDatePicker(
                  label: 'Date Given *',
                  value: _dateGiven,
                  onTap: () => _pickDate(isGiven: true),
                ),
                const SizedBox(height: 16),
                // Next due date
                _buildDatePicker(
                  label: 'Next Due Date',
                  value: _nextDueDate,
                  onTap: () => _pickDate(isGiven: false),
                  isOptional: true,
                ),
                const SizedBox(height: 16),
                // Vet clinic
                PawlyTextField(
                  controller: _vetClinicController,
                  labelText: 'Vet/Clinic',
                  hintText: 'City Animal Hospital',
                ),
                const SizedBox(height: 16),
                // Batch number
                PawlyTextField(
                  controller: _batchNumberController,
                  labelText: 'Batch Number',
                  hintText: 'BATCH-12345',
                ),
                const SizedBox(height: 16),
                // Notes
                PawlyTextField(
                  controller: _notesController,
                  labelText: 'Notes',
                  hintText: 'Any reactions, next steps, etc.',
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                // Save button
                PawlyButton(
                  label: 'Save Vaccination',
                  onPressed: _isLoading ? null : _saveVaccination,
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

  Widget _buildPetIndicator(BuildContext context, int petId) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return FutureBuilder(
      future: ref.read(getPetUseCaseProvider)(petId),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) return const SizedBox.shrink();
        final pet = snapshot.data!.fold((l) => null, (r) => r);
        if (pet == null) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.surfaceSoft,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              PawlyPetAvatarSmall(name: pet.name, size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Adding vaccination for ${pet.name}',
                  style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500, color: colors.bodyTextColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVaccineSelector() {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return FutureBuilder(
      future: ref.read(getVaccineTemplatesUseCaseProvider)(),
      builder: (context, snapshot) {
        List<String> vaccines = ['Rabies', 'DHPP', 'Bordetella', 'Leptospirosis', 'Lyme', 'FVRCP', 'FeLV'];

        if (snapshot.hasData) {
          final templateResult = snapshot.data!;
          final fetched = templateResult.fold(
            (l) => <String>[],
            (r) => r.map((v) => v.name).toList(),
          );
          if (fetched.isNotEmpty) {
            vaccines = fetched;
          }
        }
        if (!vaccines.contains(_selectedVaccine)) {
          vaccines.insert(0, _selectedVaccine);
        }

        return DropdownButtonFormField<String>(
          initialValue: _selectedVaccine,
          decoration: InputDecoration(
            labelText: 'Vaccine *',
            filled: true,
            fillColor: colors.searchField,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          style: GoogleFonts.nunito(fontSize: 16, color: colors.bodyTextColor),
          dropdownColor: colors.surface,
          items: vaccines.map((v) => DropdownMenuItem(
            value: v,
            child: Text(v, style: GoogleFonts.nunito(fontSize: 16, color: colors.bodyTextColor)),
          )).toList(),
          onChanged: (v) => setState(() {
            _selectedVaccine = v!;
            // Auto-calculate next due date based on template
            _calculateNextDueDate();
          }),
        );
      },
    );
  }

  void _calculateNextDueDate() {
    // TODO: Look up template and calculate based on schedule
    // For now, default to 1 year
    setState(() {
      _nextDueDate = _dateGiven.add(const Duration(days: 365));
    });
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

  Future<void> _pickDate({required bool isGiven}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: isGiven ? _dateGiven : (_nextDueDate ?? _dateGiven.add(const Duration(days: 365))),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (date != null) {
      setState(() {
        if (isGiven) {
          _dateGiven = date;
          // Recalculate next due date
          _calculateNextDueDate();
        } else {
          _nextDueDate = date;
        }
      });
    }
  }

  Future<void> _saveVaccination() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authState = ref.read(authProvider);
      final user = authState.value;
      final selectedPetId = ref.watch(selectedPetIdProvider);

      if (user == null || selectedPetId == null) {
        throw Exception('User or pet not selected');
      }

      final record = VaccinationRecord(
        id: widget.recordId ?? 0,
        petId: selectedPetId,
        vaccineId: 0, // Handled automatically by repository
        vaccineName: _selectedVaccine,
        dateGiven: _dateGiven,
        nextDueDate: _nextDueDate,
        vetClinic: _vetClinicController.text.trim().isEmpty ? null : _vetClinicController.text.trim(),
        batchNumber: _batchNumberController.text.trim().isEmpty ? null : _batchNumberController.text.trim(),
        certificatePhotoUrl: null,
        certificateLocalPath: null,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        isCompleted: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.recordId != null) {
        await ref.read(updateVaccinationRecordUseCaseProvider)(record);
      } else {
        await ref.read(createVaccinationRecordUseCaseProvider)(record);
      }

      if (mounted) {
        setState(() => _isLoading = false);
        ref.invalidate(vaccinationRecordsListProvider(selectedPetId));
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save vaccination: $e')),
        );
      }
    }
  }
}
