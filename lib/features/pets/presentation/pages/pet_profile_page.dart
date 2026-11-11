// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../providers/pet_providers.dart';
import '../../domain/entities/pet.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Pet profile detail page with real data
class PetProfilePage extends ConsumerWidget {
  final int petId;

  const PetProfilePage({super.key, required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final petAsync = ref.watch(petDetailStreamProvider(petId));

    return Scaffold(
      backgroundColor: colors.background,
      body: petAsync.when(
        data: (pet) {
          if (pet == null) {
            return _buildNotFound(context);
          }
          return _buildProfile(context, ref, pet);
        },
        loading: () => _buildLoading(context),
        error: (error, stack) => _buildError(context, ref, error.toString()),
      ),
    );
  }

  Widget _buildProfile(BuildContext context, WidgetRef ref, Pet pet) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return CustomScrollView(
      slivers: [
        // Hero image header
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.42,
          pinned: true,
          stretch: true,
          backgroundColor: colors.primary,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground, StretchMode.fadeTitle],
            background: Stack(
              fit: StackFit.expand,
              children: [
                // Pet photo
                PawlyPetAvatarLarge(
                  name: pet.name,
                  imageUrl: pet.photoUrl,
                  localPath: pet.localPhotoPath,
                  size: double.infinity,
                  isHero: true,
                  heroTag: 'pet_${pet.id}',
                ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        colors.background.withValues(alpha: 0.8),
                        colors.background,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // Top buttons
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PawlyFrostedIconButton(
                          icon: Icons.arrow_back_rounded,
                          onPressed: () => context.pop(),
                          size: 40,
                        ),
                        PawlyFrostedIconButton(
                          icon: Icons.more_vert_rounded,
                          onPressed: () => _showPetMenu(context, ref, pet),
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Content sheet
        SliverToBoxAdapter(
          child: Transform.translate(
            offset: const Offset(0, -28),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Breed title
                Text(
                  pet.breed?.isNotEmpty == true ? pet.breed! : pet.speciesDisplayName,
                  style: GoogleFonts.baloo2(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: colors.primaryDark,
                  ),
                ),
                if (pet.breed?.isNotEmpty == true) ...[
                  Text(
                    'Mix Breed',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: colors.secondaryTextColor,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                // Stat tiles
                Row(
                  children: [
                    PawlyStatTile(
                      icon: pet.sex == 'male' ? Icons.male_rounded : Icons.female_rounded,
                      label: 'Sex',
                      value: pet.sex?.capitalize() ?? 'Unknown',
                    ),
                    const SizedBox(width: 12),
                    PawlyStatTile(
                      icon: Icons.cake_rounded,
                      label: 'Age',
                      value: pet.formattedAge,
                    ),
                    const SizedBox(width: 12),
                    PawlyStatTile(
                      icon: Icons.monitor_weight_rounded,
                      label: 'Weight',
                      value: pet.formattedWeight,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Health Records section
                PawlySectionHeader(
                  title: 'Health Records',
                  seeAllLabel: 'See all',
                  onSeeAll: () => context.push('/vaccinations'),
                ),
                const SizedBox(height: 8),
                // Health records - would come from vaccination/medication providers
                _buildHealthRecordsPlaceholder(context),
                const SizedBox(height: 24),
                // Floating add button
                Align(
                  alignment: Alignment.bottomRight,
                  child: PawlyFloatingActionButton(
                    onPressed: () => context.push('/vaccinations/add'),
                    icon: Icons.add_rounded,
                  ),
                ),
                const SizedBox(height: 100), // Bottom space
              ],
            ),
          ),
          ),
        ),
      ],
    );
  }

  Widget _buildHealthRecordsPlaceholder(BuildContext context) {
    return Column(
      children: [
        PawlyHealthRecordCard(
          title: 'Rabies Vaccine',
          subtitle: 'Annual booster',
          lastDate: '10 Jan 2026',
          nextDate: '10 Jan 2027',
          status: HealthRecordCardStatus.upcoming,
          onTap: () => context.push('/vaccinations/1'),
        ),
        const SizedBox(height: 12),
        PawlyHealthRecordCard(
          title: 'Vet Visit',
          subtitle: 'General Checkup',
          lastDate: '15 Dec 2025',
          nextDate: '15 Jun 2026',
          status: HealthRecordCardStatus.completed,
          onTap: () => context.push('/vaccinations/2'),
        ),
        const SizedBox(height: 12),
        PawlyHealthRecordCard(
          title: 'DHPP Vaccine',
          subtitle: 'Core vaccine series',
          lastDate: '01 Mar 2025',
          nextDate: '01 Mar 2026',
          status: HealthRecordCardStatus.overdue,
          onTap: () => context.push('/vaccinations/3'),
        ),
      ],
    );
  }

  Widget _buildNotFound(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: PawlyEmptyState(
          title: 'Pet Not Found',
          message: 'This pet profile could not be found',
          actionLabel: 'Go Back',
          onAction: () => context.pop(),
          icon: Icons.pets_rounded,
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: CircularProgressIndicator(color: colors.primary),
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, String error) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: PawlyEmptyState(
          title: 'Error Loading Pet',
          message: error,
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(petDetailStreamProvider(petId)),
          icon: Icons.error_outline_rounded,
        ),
      ),
    );
  }

  void _showPetMenu(BuildContext context, WidgetRef ref, Pet pet) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => PawlyBottomSheet(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pet Options',
              style: GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.edit_rounded, color: Theme.of(context).extension<PawPalColors>()!.primary),
              title: Text('Edit Profile', style: GoogleFonts.nunito(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                context.push('/pets/${pet.id}/edit');
              },
            ),
            ListTile(
              leading: Icon(Icons.vaccines_rounded, color: Theme.of(context).extension<PawPalColors>()!.primary),
              title: Text('Vaccinations', style: GoogleFonts.nunito(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                context.push('/vaccinations');
              },
            ),
            ListTile(
              leading: Icon(Icons.medication_rounded, color: Theme.of(context).extension<PawPalColors>()!.primary),
              title: Text('Medications', style: GoogleFonts.nunito(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                context.push('/medications');
              },
            ),
            ListTile(
              leading: Icon(Icons.monitor_weight_rounded, color: Theme.of(context).extension<PawPalColors>()!.primary),
              title: Text('Weight History', style: GoogleFonts.nunito(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                // Navigate to weight tracker
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.archive_rounded, color: Theme.of(context).extension<PawPalColors>()!.warning),
              title: Text('Archive Pet', style: GoogleFonts.nunito(fontSize: 16)),
              onTap: () async {
                Navigator.pop(context);
                await ref.read(archivePetUseCaseProvider)(pet.id);
                if (context.mounted) context.pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_rounded, color: Theme.of(context).extension<PawPalColors>()!.error),
              title: Text('Delete Pet', style: GoogleFonts.nunito(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(context, ref, pet);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, Pet pet) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Delete ${pet.name}?', style: GoogleFonts.baloo2(fontSize: 20)),
        content: Text(
          'This will permanently delete ${pet.name}\'s profile and all associated data. This cannot be undone.',
          style: GoogleFonts.nunito(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.nunito(fontSize: 14)),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(deletePetUseCaseProvider)(pet.id);
              if (context.mounted) context.pop();
            },
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            child: Text('Delete', style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
