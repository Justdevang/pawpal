// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';

final isPetLostAlertActiveProvider = StateProvider.autoDispose<bool>((ref) => false);

final petMicrochipProvider = StateProvider.autoDispose<String>((ref) => '985141002948214');
final petEmergencyPhoneProvider = StateProvider.autoDispose<String>((ref) => '+1 (555) 234-5678');
final petEmergencyNotesProvider = StateProvider.autoDispose<String>((ref) => 'Friendly but timid. Needs daily medication.');

class LostPetPage extends ConsumerWidget {
  const LostPetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPet = ref.watch(selectedPetProvider);
    final isLostAlertActive = ref.watch(isPetLostAlertActiveProvider);
    final microchip = ref.watch(petMicrochipProvider);
    final emergencyPhone = ref.watch(petEmergencyPhoneProvider);
    final emergencyNotes = ref.watch(petEmergencyNotesProvider);

    final petName = selectedPet?.name ?? 'Your Pet';
    final petBreed = selectedPet?.breed ?? 'Domestic Pet';

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Lost Pet QR & Tag',
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Emergency Status Banner
              _buildStatusBanner(context, ref, isLostAlertActive, petName, colors),
              const SizedBox(height: 20),

              // Interactive Digital QR Badge Card
              _buildDigitalTagCard(
                context,
                colors,
                petName: petName,
                breed: petBreed,
                microchip: microchip,
                phone: emergencyPhone,
                isAlert: isLostAlertActive,
              ),
              const SizedBox(height: 24),

              // Microchip Information
              Text(
                'Microchip & Identification',
                style: GoogleFonts.baloo2(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colors.bodyTextColor,
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoTile(
                context,
                colors: colors,
                icon: Icons.memory_rounded,
                title: 'Microchip ID',
                subtitle: microchip,
                trailing: TextButton(
                  onPressed: () => _showEditChipModal(context, ref, microchip),
                  child: const Text('Edit'),
                ),
              ),
              const SizedBox(height: 8),
              _buildInfoTile(
                context,
                colors: colors,
                icon: Icons.nfc_rounded,
                title: 'NFC Smart Tag',
                subtitle: 'Paired to PawPal Smart Collar Tag (#PP-8812)',
                trailing: Container(
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
              ),
              const SizedBox(height: 24),

              // Emergency Contact Info
              Text(
                'Emergency Contact Details',
                style: GoogleFonts.baloo2(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colors.bodyTextColor,
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoTile(
                context,
                colors: colors,
                icon: Icons.phone_in_talk_rounded,
                title: 'Primary Emergency Phone',
                subtitle: emergencyPhone,
                trailing: TextButton(
                  onPressed: () => _showEditContactModal(context, ref, emergencyPhone, emergencyNotes),
                  child: const Text('Edit'),
                ),
              ),
              const SizedBox(height: 8),
              _buildInfoTile(
                context,
                colors: colors,
                icon: Icons.medical_services_rounded,
                title: 'Medical Alert Note',
                subtitle: emergencyNotes,
              ),
              const SizedBox(height: 28),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Lost Pet Flyer for $petName generated and saved to Photos!',
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        side: BorderSide(color: colors.primary),
                      ),
                      icon: Icon(Icons.picture_as_pdf_rounded, color: colors.primary, size: 20),
                      label: Text(
                        'Print Flyer',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          color: colors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Public finder link copied to clipboard: https://pawpal.app/tag/${microchip.substring(0, 6)}',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      icon: const Icon(Icons.share_rounded, size: 20),
                      label: Text(
                        'Share Tag',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBanner(
    BuildContext context,
    WidgetRef ref,
    bool isLostAlertActive,
    String petName,
    PawPalColors colors,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLostAlertActive ? Colors.red.shade50 : colors.surfaceSoft,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isLostAlertActive ? Colors.redAccent : colors.success.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isLostAlertActive
                  ? Colors.red.withValues(alpha: 0.15)
                  : colors.success.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isLostAlertActive ? Icons.warning_amber_rounded : Icons.pets_rounded,
              color: isLostAlertActive ? Colors.red : colors.success,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLostAlertActive ? 'LOST PET ALERT ACTIVE!' : '$petName is Safe at Home',
                  style: GoogleFonts.baloo2(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isLostAlertActive ? Colors.red.shade900 : colors.bodyTextColor,
                  ),
                ),
                Text(
                  isLostAlertActive
                      ? 'Finder scans will show emergency alert & GPS prompt'
                      : 'QR & NFC digital collar tags are fully active',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: isLostAlertActive ? Colors.red.shade700 : colors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isLostAlertActive,
            activeColor: Colors.red,
            onChanged: (val) {
              ref.read(isPetLostAlertActiveProvider.notifier).state = val;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: val ? Colors.red.shade700 : colors.success,
                  content: Text(
                    val
                        ? 'Lost Pet Alert activated! Anyone scanning the tag will see high priority emergency info.'
                        : 'Alert deactivated. Status set to safe.',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDigitalTagCard(
    BuildContext context,
    PawPalColors colors, {
    required String petName,
    required String breed,
    required String microchip,
    required String phone,
    required bool isAlert,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isAlert
              ? [const Color(0xFFE53935), const Color(0xFFC62828)]
              : [colors.primary, colors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: (isAlert ? Colors.red : colors.primary).withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.qr_code_scanner_rounded, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'PAWPAL SMART TAG',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w800,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isAlert ? 'STATUS: LOST' : 'SCAN TO REUNITE',
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // QR Code Graphic Simulated
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Stylized QR pattern
                        GridPaper(
                          color: Colors.white.withValues(alpha: 0.4),
                          divisions: 4,
                          subdivisions: 2,
                          child: const SizedBox(width: 140, height: 140),
                        ),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: colors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: const Icon(Icons.pets, color: Colors.white, size: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Scan with any smartphone camera',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            petName,
            style: GoogleFonts.baloo2(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Text(
            '$breed • Chip: $microchip',
            style: GoogleFonts.nunito(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Emergency: $phone',
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required PawPalColors colors,
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surfaceSoft,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.divider.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: colors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: colors.bodyTextColor,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: colors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  void _showEditChipModal(BuildContext context, WidgetRef ref, String currentChip) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final ctrl = TextEditingController(text: currentChip);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.surfaceSoft,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Microchip ID',
              style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '15-digit Microchip Number',
                filled: true,
                fillColor: colors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            PawlyButton(
              label: 'Save Microchip',
              onPressed: () {
                if (ctrl.text.trim().isNotEmpty) {
                  ref.read(petMicrochipProvider.notifier).state = ctrl.text.trim();
                  Navigator.pop(ctx);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditContactModal(
    BuildContext context,
    WidgetRef ref,
    String currentPhone,
    String currentNotes,
  ) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final phoneCtrl = TextEditingController(text: currentPhone);
    final notesCtrl = TextEditingController(text: currentNotes);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.surfaceSoft,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emergency Contact Settings',
              style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Contact Phone Number',
                filled: true,
                fillColor: colors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: notesCtrl,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Medical & Behavior Alert Notes',
                filled: true,
                fillColor: colors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            PawlyButton(
              label: 'Save Contact Info',
              onPressed: () {
                if (phoneCtrl.text.trim().isNotEmpty) {
                  ref.read(petEmergencyPhoneProvider.notifier).state = phoneCtrl.text.trim();
                }
                ref.read(petEmergencyNotesProvider.notifier).state = notesCtrl.text.trim();
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }
}
