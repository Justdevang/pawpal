// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/pet.dart';
import '../providers/pet_providers.dart';
import '../providers/pet_state_providers.dart';

/// Pet list page with real data from database
class PetListPage extends ConsumerWidget {
  const PetListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final petsAsync = ref.watch(petsListProvider);
    final selectedPetId = ref.watch(selectedPetIdProvider);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'My Pets',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add_rounded, color: colors.bodyTextColor),
            onPressed: () => context.push('/pets/add'),
          ),
        ],
      ),
      body: SafeArea(
        child: petsAsync.when(
          data: (pets) {
            if (pets.isEmpty) {
              return _buildEmptyState(context);
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 96),
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                final isSelected = pet.id == selectedPetId;
                return _buildPetCard(context, ref, pet, isSelected, index)
                    .animate()
                    .fadeIn(duration: 300.ms, delay: (60 * index).ms)
                    .slideY(begin: 0.1, end: 0);
              },
            );
          },
          loading: () => _buildLoadingState(context),
          error: (error, stack) => _buildErrorState(context, ref, error.toString()),
        ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => context.push('/pets/add'),
        icon: Icons.add_rounded,
      ),
    );
  }

  Widget _buildPetCard(
    BuildContext context,
    WidgetRef ref,
    Pet pet,
    bool isSelected,
    int index,
  ) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ref.read(selectedPetIdProvider.notifier).select(pet.id);
          context.push('/pets/${pet.id}');
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: isSelected ? Border.all(color: colors.primary, width: 2) : null,
            boxShadow: [
              BoxShadow(
                color: colors.overlay.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              PawlyPetAvatar(
                name: pet.name,
                imageUrl: pet.photoUrl,
                localPath: pet.localPhotoPath,
                size: 64,
                isSelected: isSelected,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
                      style: GoogleFonts.baloo2(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    Text(
                      '${pet.speciesDisplayName}${pet.breed != null ? ' • ${pet.breed}' : ''}',
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.cake_rounded, size: 14, color: colors.secondaryTextColor),
                        const SizedBox(width: 4),
                        Text(
                          pet.formattedAge,
                          style: GoogleFonts.nunito(
                            fontSize: 13,
                            color: colors.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(Icons.monitor_weight_rounded, size: 14, color: colors.secondaryTextColor),
                        const SizedBox(width: 4),
                        Text(
                          pet.formattedWeight,
                          style: GoogleFonts.nunito(
                            fontSize: 13,
                            color: colors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) async {
                  if (value == 'edit') {
                    context.push('/pets/${pet.id}/edit');
                  } else if (value == 'archive') {
                    await ref.read(archivePetUseCaseProvider)(pet.id);
                    ref.invalidate(petsListProvider);
                  } else if (value == 'delete') {
                    _showDeleteConfirmation(context, ref, pet);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit_rounded, size: 20, color: colors.bodyTextColor),
                        const SizedBox(width: 12),
                        Text('Edit', style: GoogleFonts.nunito(fontSize: 14)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'archive',
                    child: Row(
                      children: [
                        Icon(Icons.archive_rounded, size: 20, color: colors.warning),
                        const SizedBox(width: 12),
                        Text('Archive', style: GoogleFonts.nunito(fontSize: 14)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_rounded, size: 20, color: colors.error),
                        const SizedBox(width: 12),
                        Text('Delete', style: GoogleFonts.nunito(fontSize: 14, color: colors.error)),
                      ],
                    ),
                  ),
                ],
                child: PawlyIconButton(
                  icon: Icons.more_vert_rounded,
                  size: 40,
                  backgroundColor: colors.surfaceSoft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'No Pets Yet',
          message: 'Add your first pet to start tracking their health and care',
          actionLabel: 'Add Pet',
          onAction: () => context.push('/pets/add'),
          icon: Icons.pets_rounded,
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: colors.primary),
          const SizedBox(height: 16),
          Text(
            'Loading pets...',
            style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Error Loading Pets',
          message: error,
          actionLabel: 'Retry',
          onAction: () => ref.invalidate(petsListProvider),
          icon: Icons.error_outline_rounded,
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
              ref.invalidate(petsListProvider);
            },
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            child: Text('Delete', style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}