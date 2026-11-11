// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';

class MedicalRecordItem {
  final String id;
  final String title;
  final String category; // Lab Results, Prescription, Radiology, Certificate, Surgery, Invoice
  final DateTime date;
  final String clinicName;
  final String fileName;
  final String fileSize;
  final String? notes;

  MedicalRecordItem({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.clinicName,
    required this.fileName,
    required this.fileSize,
    this.notes,
  });
}

final medicalRecordsProvider = StateProvider.autoDispose<List<MedicalRecordItem>>((ref) {
  final now = DateTime.now();
  return [
    MedicalRecordItem(
      id: '1',
      title: 'Comprehensive Blood Panel & CBC',
      category: 'Lab Results',
      date: now.subtract(const Duration(days: 18)),
      clinicName: 'Paws & Claws Veterinary Hospital',
      fileName: 'blood_test_cbc_panel.pdf',
      fileSize: '1.4 MB',
      notes: 'All kidney and liver markers within optimal ranges.',
    ),
    MedicalRecordItem(
      id: '2',
      title: 'Hip & Pelvic Radiograph (X-Ray)',
      category: 'Radiology',
      date: now.subtract(const Duration(days: 45)),
      clinicName: 'Metropolitan Pet Specialty Care',
      fileName: 'hip_xray_scan_lateral.pdf',
      fileSize: '3.8 MB',
      notes: 'No signs of subluxation or osteoarthritis.',
    ),
    MedicalRecordItem(
      id: '3',
      title: 'Otitis Externa Ear Drops Prescription',
      category: 'Prescription',
      date: now.subtract(const Duration(days: 70)),
      clinicName: 'Dr. Sarah Jenkins Vet Clinic',
      fileName: 'prescription_posatex_rx.pdf',
      fileSize: '420 KB',
      notes: 'Apply 4 drops daily for 7 days. Completed.',
    ),
    MedicalRecordItem(
      id: '4',
      title: 'Official Rabies Vaccination Certificate',
      category: 'Certificate',
      date: now.subtract(const Duration(days: 120)),
      clinicName: 'City Pet Wellness Center',
      fileName: 'rabies_certificate_tag492.pdf',
      fileSize: '850 KB',
      notes: '3-year rabies duration certificate.',
    ),
  ];
});

final selectedCategoryFilterProvider = StateProvider.autoDispose<String>((ref) => 'All');

class MedicalRecordsPage extends ConsumerWidget {
  const MedicalRecordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPet = ref.watch(selectedPetProvider);
    final allRecords = ref.watch(medicalRecordsProvider);
    final filter = ref.watch(selectedCategoryFilterProvider);

    final filteredRecords = filter == 'All'
        ? allRecords
        : allRecords.where((r) => r.category == filter).toList();

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Medical Records',
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
        child: allRecords.isEmpty
            ? Center(
                child: PawlyEmptyState(
                  title: 'No Medical Records',
                  message: 'Upload lab results, X-rays, prescriptions, and health certificates.',
                  actionLabel: 'Upload Document',
                  onAction: () => _showAddRecordModal(context, ref),
                  icon: Icons.folder_shared_rounded,
                ),
              )
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                      child: _buildHeaderCard(context, colors, allRecords, selectedPet?.name ?? 'Pet'),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 48,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        children: [
                          _buildFilterChip(context, ref, 'All', filter == 'All', colors),
                          _buildFilterChip(context, ref, 'Lab Results', filter == 'Lab Results', colors),
                          _buildFilterChip(context, ref, 'Prescription', filter == 'Prescription', colors),
                          _buildFilterChip(context, ref, 'Radiology', filter == 'Radiology', colors),
                          _buildFilterChip(context, ref, 'Certificate', filter == 'Certificate', colors),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  filteredRecords.isEmpty
                      ? SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Center(
                              child: Text(
                                'No records found for "$filter"',
                                style: GoogleFonts.nunito(
                                  color: colors.secondaryTextColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SliverPadding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final record = filteredRecords[index];
                                return _buildRecordCard(context, ref, record, colors);
                              },
                              childCount: filteredRecords.length,
                            ),
                          ),
                        ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddRecordModal(context, ref),
        backgroundColor: colors.primary,
        icon: const Icon(Icons.upload_file_rounded, color: Colors.white),
        label: Text(
          'Upload Record',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    WidgetRef ref,
    String label,
    bool isSelected,
    PawPalColors colors,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.white : colors.bodyTextColor,
          ),
        ),
        selected: isSelected,
        selectedColor: colors.primary,
        backgroundColor: colors.surfaceSoft,
        checkmarkColor: Colors.white,
        showCheckmark: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: BorderSide(
          color: isSelected ? colors.primary : colors.divider.withValues(alpha: 0.3),
        ),
        onSelected: (_) {
          ref.read(selectedCategoryFilterProvider.notifier).state = label;
        },
      ),
    );
  }

  Widget _buildHeaderCard(
    BuildContext context,
    PawPalColors colors,
    List<MedicalRecordItem> records,
    String petName,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surfaceSoft,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.primary.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.folder_copy_rounded, color: colors.primary, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$petName\'s Health Vault',
                  style: GoogleFonts.baloo2(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colors.bodyTextColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${records.length} digital reports & prescriptions safely stored',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
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

  Widget _buildRecordCard(
    BuildContext context,
    WidgetRef ref,
    MedicalRecordItem record,
    PawPalColors colors,
  ) {
    final dateFormat = DateFormat('MMM dd, yyyy');

    IconData catIcon;
    Color catColor;
    switch (record.category) {
      case 'Lab Results':
        catIcon = Icons.biotech_rounded;
        catColor = colors.accent;
        break;
      case 'Prescription':
        catIcon = Icons.medication_rounded;
        catColor = colors.warning;
        break;
      case 'Radiology':
        catIcon = Icons.medical_information_rounded;
        catColor = colors.primaryDark;
        break;
      case 'Certificate':
        catIcon = Icons.verified_rounded;
        catColor = colors.success;
        break;
      default:
        catIcon = Icons.description_rounded;
        catColor = colors.primary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceSoft,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      record.title,
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${record.clinicName} • ${dateFormat.format(record.date)}',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert_rounded, color: colors.secondaryTextColor, size: 20),
                onSelected: (val) {
                  if (val == 'delete') {
                    ref.read(medicalRecordsProvider.notifier).update(
                          (list) => list.where((item) => item.id != record.id).toList(),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Record deleted')),
                    );
                  } else if (val == 'view') {
                    _showDocumentViewer(context, record, colors);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'view',
                    child: Row(
                      children: [
                        Icon(Icons.visibility_rounded, size: 18),
                        SizedBox(width: 8),
                        Text('View / Download'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline_rounded, color: Colors.red, size: 18),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (record.notes != null && record.notes!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                record.notes!,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: colors.secondaryTextColor,
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          // File row
          InkWell(
            onTap: () => _showDocumentViewer(context, record, colors),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colors.divider.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf_rounded, color: Colors.redAccent, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      record.fileName,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: colors.bodyTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    record.fileSize,
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      color: colors.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.download_rounded, color: colors.primary, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDocumentViewer(BuildContext context, MedicalRecordItem record, PawPalColors colors) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.surfaceSoft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.picture_as_pdf_rounded, color: Colors.redAccent, size: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                record.title,
                style: GoogleFonts.baloo2(fontSize: 16, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('File: ${record.fileName}', style: GoogleFonts.nunito(fontSize: 13)),
            const SizedBox(height: 4),
            Text('Size: ${record.fileSize}', style: GoogleFonts.nunito(fontSize: 13)),
            const SizedBox(height: 4),
            Text('Clinic: ${record.clinicName}', style: GoogleFonts.nunito(fontSize: 13)),
            const SizedBox(height: 4),
            Text(
              'Date: ${DateFormat('MMMM dd, yyyy').format(record.date)}',
              style: GoogleFonts.nunito(fontSize: 13),
            ),
            const SizedBox(height: 16),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.divider.withValues(alpha: 0.4)),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_user_rounded, color: colors.success, size: 36),
                    const SizedBox(height: 6),
                    Text(
                      'Verified Medical Document',
                      style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Close', style: GoogleFonts.nunito(color: colors.secondaryTextColor)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Downloading ${record.fileName}...')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.download_rounded, size: 18),
            label: const Text('Download PDF'),
          ),
        ],
      ),
    );
  }

  void _showAddRecordModal(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final titleCtrl = TextEditingController();
    final clinicCtrl = TextEditingController();
    final notesCtrl = TextEditingController();
    String category = 'Lab Results';
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
                      'Upload Medical Document',
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
                        labelText: 'Document Title *',
                        hintText: 'e.g. Annual Blood Test, Dental X-Ray',
                        filled: true,
                        fillColor: colors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
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
                        DropdownMenuItem(value: 'Lab Results', child: Text('Lab Results & Bloodwork')),
                        DropdownMenuItem(value: 'Prescription', child: Text('Prescription & Medication')),
                        DropdownMenuItem(value: 'Radiology', child: Text('Radiology / X-Ray / Ultrasound')),
                        DropdownMenuItem(value: 'Certificate', child: Text('Vaccine & Health Certificate')),
                        DropdownMenuItem(value: 'Surgery', child: Text('Surgical / Procedure Report')),
                        DropdownMenuItem(value: 'Invoice', child: Text('Vet Invoice & Receipt')),
                      ],
                      onChanged: (val) {
                        if (val != null) setModalState(() => category = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: clinicCtrl,
                      decoration: InputDecoration(
                        labelText: 'Veterinary Clinic / Doctor',
                        hintText: 'e.g. City Central Animal Clinic',
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
                      title: Text(
                        'Document Date',
                        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(DateFormat('MMMM dd, yyyy').format(selectedDate)),
                      trailing: Icon(Icons.calendar_today_rounded, color: colors.primary),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2015),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setModalState(() => selectedDate = picked);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: colors.primary.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.attach_file_rounded, color: colors.primary),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'attachment_${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}.pdf',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'Ready to upload (1.2 MB)',
                                  style: GoogleFonts.nunito(
                                    fontSize: 11,
                                    color: colors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Change'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: notesCtrl,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: 'Doctor\'s Notes & Summary',
                        filled: true,
                        fillColor: colors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PawlyButton(
                      label: 'Save Medical Record',
                      onPressed: () {
                        if (titleCtrl.text.trim().isEmpty) return;
                        final newRecord = MedicalRecordItem(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          title: titleCtrl.text.trim(),
                          category: category,
                          date: selectedDate,
                          clinicName: clinicCtrl.text.trim().isEmpty
                              ? 'Pet Health Clinic'
                              : clinicCtrl.text.trim(),
                          fileName:
                              '${titleCtrl.text.trim().toLowerCase().replaceAll(' ', '_')}.pdf',
                          fileSize: '1.2 MB',
                          notes: notesCtrl.text.trim().isEmpty ? null : notesCtrl.text.trim(),
                        );
                        ref.read(medicalRecordsProvider.notifier).update(
                              (list) => [newRecord, ...list],
                            );
                        Navigator.pop(ctx);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Medical record uploaded successfully!')),
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
