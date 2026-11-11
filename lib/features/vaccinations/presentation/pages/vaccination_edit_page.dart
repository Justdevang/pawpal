// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/vaccination_record.dart';
import '../providers/vaccination_providers.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Edit vaccination page
class VaccinationEditPage extends ConsumerStatefulWidget {
  final int recordId;

  const VaccinationEditPage({super.key, required this.recordId});

  @override
  ConsumerState<VaccinationEditPage> createState() => _VaccinationEditPageState();
}

class _VaccinationEditPageState extends ConsumerState<VaccinationEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _vetClinicController = TextEditingController();
  final _batchNumberController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedVaccine = 'Rabies';
  DateTime _dateGiven = DateTime.now();
  DateTime? _nextDueDate;
  String? _certificatePhotoUrl;
  String? _certificateLocalPath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadRecord();
  }

  Future<void> _loadRecord() async {
    final record = await ref.read(getVaccinationRecordUseCaseProvider)(widget.recordId);
    record.fold(
      (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()))),
      (record) {
        if (record != null) {
          setState(() {
            _selectedVaccine = record.vaccineName;
            _dateGiven = record.dateGiven;
            _nextDueDate = record.nextDueDate;
            _vetClinicController.text = record.vetClinic ?? '';
            _batchNumberController.text = record.batchNumber ?? '';
            _notesController.text = record.notes ?? '';
            _certificatePhotoUrl = record.certificatePhotoUrl;
            _certificateLocalPath = record.certificateLocalPath;
          });
        }
      },
    );
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

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Edit Vaccination',
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
                // Vaccine selector
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
                // Certificate upload
                _buildCertificateUpload(),
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
                  label: 'Save Changes',
                  onPressed: _isLoading ? null : _saveRecord,
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

  Widget _buildVaccineSelector() {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return FutureBuilder(
      future: ref.read(getVaccineTemplatesUseCaseProvider)(),
      builder: (context, snapshot) {
        List<String> vaccines = ['Rabies', 'DHPP', 'Bordetella', 'Leptospirosis', 'Lyme', 'FVRCP', 'FeLV'];

        if (snapshot.hasData) {
          final dynamic templateResult = snapshot.data;
          vaccines = templateResult.fold(
            (l) => vaccines,
            (r) => (r as List).map((v) => v.name as String).toList(),
          );
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
            _calculateNextDueDate();
          }),
        );
      },
    );
  }

  void _calculateNextDueDate() {
    // TODO: Look up template and calculate based on schedule
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

  Widget _buildCertificateUpload() {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certificate Photo',
          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500, color: colors.bodyTextColor),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickCertificate,
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: colors.surfaceSoft,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colors.divider, width: 1.5),
            ),
            child: _buildCertificatePreview(),
          ),
        ),
      ],
    );
  }

  Widget _buildCertificatePreview() {
    if (_certificateLocalPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(_certificateLocalPath!, width: double.infinity, height: 150, fit: BoxFit.cover),
      );
    }

    if (_certificatePhotoUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(
          _certificatePhotoUrl!,
          width: double.infinity,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _placeholder(),
        ),
      );
    }

    return _placeholder();
  }

  Widget _placeholder() {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_upload_rounded, size: 32, color: colors.secondaryTextColor),
          const SizedBox(height: 8),
          Text(
            'Tap to upload certificate',
            style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor),
          ),
        ],
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
          _calculateNextDueDate();
        } else {
          _nextDueDate = date;
        }
      });
    }
  }

  Future<void> _pickCertificate() async {
    // TODO: Implement image picker for certificate
    // Would use image_picker and upload to Firebase Storage
  }

  Future<void> _saveRecord() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final record = VaccinationRecord(
        id: widget.recordId,
        petId: 0, // Would be passed or looked up
        vaccineId: 0,
        vaccineName: _selectedVaccine,
        dateGiven: _dateGiven,
        nextDueDate: _nextDueDate,
        vetClinic: _vetClinicController.text.trim().isEmpty ? null : _vetClinicController.text.trim(),
        batchNumber: _batchNumberController.text.trim().isEmpty ? null : _batchNumberController.text.trim(),
        certificatePhotoUrl: _certificatePhotoUrl,
        certificateLocalPath: _certificateLocalPath,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        isCompleted: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await ref.read(updateVaccinationRecordUseCaseProvider)(record);

      if (mounted) {
        setState(() => _isLoading = false);
        context.pop(true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save record: $e')),
        );
      }
    }
  }
}
