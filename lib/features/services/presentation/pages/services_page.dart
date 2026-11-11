// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';

/// Services hub page with all registered services
class ServicesPage extends ConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Services',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: selectedPetId == null
            ? _buildNoPetSelected(context)
            : _buildServicesList(context, ref, selectedPetId),
      ),
    );
  }

  Widget _buildNoPetSelected(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Select a Pet',
          message: 'Choose a pet from the home screen to access services',
          actionLabel: 'Go to Pets',
          onAction: () => context.push('/pets'),
          icon: Icons.medical_services_rounded,
        ),
      ),
    );
  }

  Widget _buildServicesList(BuildContext context, WidgetRef ref, int petId) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    // All services enabled and available
    final availableServices = [
      _ServiceCardData(
        id: 'vet_appointments',
        name: 'Vet Appointments',
        description: 'Book & manage vet visits',
        icon: Icons.local_hospital_rounded,
        color: colors.accent,
        route: '/services/vet_appointments',
        isEnabled: true,
      ),
      _ServiceCardData(
        id: 'weight_tracker',
        name: 'Weight Tracker',
        description: 'Monitor growth & health',
        icon: Icons.monitor_weight_rounded,
        color: colors.primary,
        route: '/services/weight_tracker',
        isEnabled: true,
      ),
      _ServiceCardData(
        id: 'grooming',
        name: 'Grooming',
        description: 'Bath & groom schedule',
        icon: Icons.content_cut_rounded,
        color: colors.primaryDark,
        route: '/services/grooming',
        isEnabled: true,
      ),
      _ServiceCardData(
        id: 'deworming',
        name: 'Deworming',
        description: 'Flea, tick & worm schedule',
        icon: Icons.bug_report_rounded,
        color: colors.warning,
        route: '/services/deworming',
        isEnabled: true,
      ),
      _ServiceCardData(
        id: 'feeding',
        name: 'Feeding',
        description: 'Food schedule & low-stock alerts',
        icon: Icons.restaurant_rounded,
        color: colors.success,
        route: '/services/feeding',
        isEnabled: true,
      ),
      _ServiceCardData(
        id: 'medical_records',
        name: 'Medical Records',
        description: 'Upload reports & prescriptions',
        icon: Icons.folder_rounded,
        color: colors.primary,
        route: '/services/medical_records',
        isEnabled: true,
      ),
      _ServiceCardData(
        id: 'lost_pet',
        name: 'Lost Pet QR',
        description: 'QR/NFC tag & shareable profile',
        icon: Icons.qr_code_rounded,
        color: colors.accent,
        route: '/services/lost_pet',
        isEnabled: true,
      ),
      _ServiceCardData(
        id: 'insurance',
        name: 'Insurance & Expenses',
        description: 'Track costs & claims',
        icon: Icons.health_and_safety_rounded,
        color: colors.primaryDark,
        route: '/services/insurance',
        isEnabled: true,
      ),
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Services',
            style: GoogleFonts.baloo2(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.bodyTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Manage all your pet care services in one place',
            style: GoogleFonts.nunito(
              fontSize: 13,
              color: colors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.88,
            ),
            itemCount: availableServices.length,
            itemBuilder: (context, index) {
              return _buildServiceCard(context, availableServices[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, _ServiceCardData service) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: service.isEnabled ? colors.surfaceSoft : colors.searchField,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: service.isEnabled && service.route != null
            ? () => context.push(service.route!)
            : null,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: service.isEnabled
                      ? service.color.withValues(alpha: 0.15)
                      : colors.divider.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  service.icon,
                  color: service.isEnabled ? service.color : colors.divider,
                  size: 26,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                service.name,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: service.isEnabled ? colors.bodyTextColor : colors.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                service.description,
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  color: service.isEnabled ? colors.secondaryTextColor : colors.divider,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (!service.isEnabled) ...[
                const SizedBox(height: 6),
                Text(
                  'Coming Soon',
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: colors.accent,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCardData {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final String? route;
  final bool isEnabled;

  _ServiceCardData({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    this.route,
    required this.isEnabled,
  });
}