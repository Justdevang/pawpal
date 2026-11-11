// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/database/database.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import 'vet_appointments_service.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Add/Edit vet appointment page
class VetAppointmentEditPage extends ConsumerStatefulWidget {
  final int? appointmentId;

  const VetAppointmentEditPage({super.key, this.appointmentId});

  @override
  ConsumerState<VetAppointmentEditPage> createState() => _VetAppointmentEditPageState();
}

class _VetAppointmentEditPageState extends ConsumerState<VetAppointmentEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _clinicNameController = TextEditingController();
  final _clinicAddressController = TextEditingController();
  final _clinicPhoneController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedType = 'checkup';
  DateTime _appointmentDate = DateTime.now();
  int _durationMinutes = 30;
  bool _reminderSet = true;
  DateTime? _reminderTime;
  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.appointmentId != null;
    if (_isEditing) {
      _loadAppointment();
    } else {
      _reminderTime = _appointmentDate.subtract(const Duration(hours: 2));
    }
  }

  Future<void> _loadAppointment() async {
    final appointment = await ref.read(vetAppointmentsServiceProvider).getAppointment(widget.appointmentId!);
    if (appointment != null) {
      setState(() {
        _titleController.text = appointment.title;
        _clinicNameController.text = appointment.clinicName ?? '';
        _clinicAddressController.text = appointment.clinicAddress ?? '';
        _clinicPhoneController.text = appointment.clinicPhone ?? '';
        _notesController.text = appointment.notes ?? '';
        _selectedType = appointment.type ?? 'checkup';
        _appointmentDate = appointment.appointmentDate;
        _durationMinutes = appointment.durationMinutes;
        _reminderSet = appointment.reminderSet;
        _reminderTime = appointment.reminderTime;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _clinicNameController.dispose();
    _clinicAddressController.dispose();
    _clinicPhoneController.dispose();
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
          _isEditing ? 'Edit Appointment' : 'Add Appointment',
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
                // Title
                PawlyTextField(
                  controller: _titleController,
                  labelText: 'Title *',
                  hintText: 'Annual Checkup',
                  validator: (v) => v?.isEmpty == true ? 'Title is required' : null,
                ),
                const SizedBox(height: 16),
                // Type
                _buildDropdown(
                  label: 'Type *',
                  value: _selectedType,
                  items: ['vaccination', 'checkup', 'surgery', 'grooming', 'other'],
                  onChanged: (v) => setState(() => _selectedType = v!),
                ),
                const SizedBox(height: 16),
                // Clinic name
                PawlyTextField(
                  controller: _clinicNameController,
                  labelText: 'Clinic Name',
                  hintText: 'City Animal Hospital',
                ),
                const SizedBox(height: 16),
                // Clinic address
                PawlyTextField(
                  controller: _clinicAddressController,
                  labelText: 'Clinic Address',
                  hintText: '123 Main St, City',
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                // Clinic phone
                PawlyTextField(
                  controller: _clinicPhoneController,
                  labelText: 'Clinic Phone',
                  hintText: '(555) 123-4567',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                // Appointment date
                _buildDatePicker(
                  label: 'Appointment Date *',
                  value: _appointmentDate,
                  onTap: () => _pickDate(isDate: true),
                ),
                const SizedBox(height: 16),
                // Duration
                PawlyTextField(
                  controller: TextEditingController(text: _durationMinutes.toString()),
                  labelText: 'Duration (minutes)',
                  keyboardType: TextInputType.number,
                  onChanged: (v) => _durationMinutes = int.tryParse(v) ?? 30,
                ),
                const SizedBox(height: 16),
                // Reminder
                Row(
                  children: [
                    Checkbox(
                      value: _reminderSet,
                      onChanged: (v) => setState(() => _reminderSet = v ?? false),
                      activeColor: colors.primary,
                    ),
                    Text('Set reminder', style: GoogleFonts.nunito(fontSize: 14, color: colors.bodyTextColor)),
                  ],
                ),
                if (_reminderSet) ...[
                  const SizedBox(height: 16),
                  _buildDatePicker(
                    label: 'Reminder Time',
                    value: _reminderTime,
                    onTap: () => _pickDate(isDate: false),
                    isOptional: true,
                  ),
                ],
                const SizedBox(height: 16),
                // Notes
                PawlyTextField(
                  controller: _notesController,
                  labelText: 'Notes',
                  hintText: 'Any special instructions...',
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                // Save button
                PawlyButton(
                  label: _isEditing ? 'Save Changes' : 'Add Appointment',
                  onPressed: _isLoading ? null : _saveAppointment,
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
    bool isDate = true,
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
            Icon(isDate ? Icons.calendar_today_rounded : Icons.access_time_rounded, color: colors.secondaryTextColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value != null
                    ? '$label: ${isDate ? value.formatDate() : value.formatTime()}'
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

  Future<void> _pickDate({required bool isDate}) async {
    if (isDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: _appointmentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 3650)),
      );
      if (date != null) setState(() => _appointmentDate = date);
    } else {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_reminderTime ?? _appointmentDate.subtract(const Duration(hours: 2))),
      );
      if (time != null) {
        setState(() {
          _reminderTime = DateTime(
            _appointmentDate.year,
            _appointmentDate.month,
            _appointmentDate.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _saveAppointment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final selectedPetId = ref.read(selectedPetIdProvider);
      if (selectedPetId == null) throw Exception('No pet selected');

      final appointment = Appointment(
        id: widget.appointmentId ?? 0,
        petId: selectedPetId,
        title: _titleController.text.trim(),
        clinicName: _clinicNameController.text.trim().isEmpty ? null : _clinicNameController.text.trim(),
        clinicAddress: _clinicAddressController.text.trim().isEmpty ? null : _clinicAddressController.text.trim(),
        clinicPhone: _clinicPhoneController.text.trim().isEmpty ? null : _clinicPhoneController.text.trim(),
        clinicWebsite: null,
        appointmentDate: _appointmentDate,
        durationMinutes: _durationMinutes,
        type: _selectedType,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        reminderSet: _reminderSet,
        reminderTime: _reminderTime,
        isCompleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (_isEditing) {
        await ref.read(vetAppointmentsServiceProvider).updateAppointment(appointment);
      } else {
        await ref.read(vetAppointmentsServiceProvider).createAppointment(appointment);
      }

      if (mounted) {
        setState(() => _isLoading = false);
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save appointment: $e')));
      }
    }
  }
}
