// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/family_member.dart';
import '../providers/family_providers.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import 'invite_family_sheet.dart';
import 'package:pawpal/core/extensions/extensions.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Family sharing page with real data
class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);

    if (selectedPetId == null) {
      return _buildNoPetSelected(context);
    }

    final membersAsync = ref.watch(familyMembersStreamProvider(selectedPetId));
    final pendingInvitesAsync = ref.watch(pendingInvitesProvider(ref.read(authProvider).value?.email ?? ''));

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Family Sharing',
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Explanation card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colors.surfaceSoft,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: colors.accent.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Icons.family_restroom_rounded, color: colors.accent, size: 24),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Share Pet Care',
                                style: GoogleFonts.baloo2(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: colors.bodyTextColor,
                                ),
                              ),
                              Text(
                                'Invite family members to help manage your pets\' health',
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                  color: colors.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '• Invite via email\n• Choose permissions: Owner, Editor, Viewer\n• Shared reminders & notifications\n• All data syncs in real-time',
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        color: colors.secondaryTextColor,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Invite button
              PawlyButton(
                label: 'Invite Family Member',
                onPressed: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (context) => InviteFamilyMemberSheet(petId: selectedPetId),
                ),
                width: double.infinity,
              ),
              const SizedBox(height: 24),
              // Pending invites (for current user)
              _buildPendingInvites(context, ref, pendingInvitesAsync),
              // Family members list
              Text(
                'Family Members',
                style: GoogleFonts.baloo2(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colors.bodyTextColor,
                ),
              ),
              const SizedBox(height: 12),
              membersAsync.when(
                data: (members) {
                  if (members.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: PawlyEmptyState(
                          title: 'No Family Members Yet',
                          message: 'Invite family members to help manage your pet\'s care',
                          actionLabel: 'Invite Someone',
                          onAction: () => showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (context) => InviteFamilyMemberSheet(petId: selectedPetId),
                          ),
                          icon: Icons.family_restroom_rounded,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final member = members[index];
                      return _buildMemberCard(context, ref, member, index)
                          .animate()
                          .fadeIn(duration: 300.ms, delay: (60 * index).ms)
                          .slideX(begin: 0.1, end: 0);
                    },
                  );
                },
                loading: () => _buildLoadingState(context),
                error: (error, stack) => _buildErrorState(context, ref, error.toString()),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPendingInvites(BuildContext context, WidgetRef ref, AsyncValue<List<FamilyMember>> invitesAsync) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return invitesAsync.when(
      data: (invites) {
        if (invites.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pending Invitations',
              style: GoogleFonts.baloo2(fontSize: 16, fontWeight: FontWeight.w600, color: colors.warning),
            ),
            const SizedBox(height: 12),
            ...invites.map((invite) => _buildPendingInviteCard(context, ref, invite)),
            const SizedBox(height: 24),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildPendingInviteCard(BuildContext context, WidgetRef ref, FamilyMember invite) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.warning.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.warning.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.mail_rounded, color: colors.warning, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invitation to join',
                  style: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
                ),
                Text(
                  'Pet ID: ${invite.petId} • Role: ${invite.role}',
                  style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
                ),
              ],
            ),
          ),
          Row(
            children: [
              PawlyGhostButton(
                label: 'Decline',
                onPressed: () async {
                  await ref.read(declineInviteUseCaseProvider)(invite.id);
                },
                textColor: colors.error,
              ),
              const SizedBox(width: 8),
              PawlyButton(
                label: 'Accept',
                onPressed: () async {
                  await ref.read(acceptInviteUseCaseProvider)(invite.id);
                },
                backgroundColor: colors.success,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(BuildContext context, WidgetRef ref, FamilyMember member, int index) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    Color statusColor;
    switch (member.status) {
      case 'accepted':
        statusColor = colors.success;
        break;
      case 'pending':
        statusColor = colors.warning;
        break;
      default:
        statusColor = colors.error;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.surfaceSoft,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                (member.name ?? member.email)[0].toUpperCase(),
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primary),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name ?? member.email,
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colors.bodyTextColor,
                  ),
                ),
                Text(
                  member.email,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: colors.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        member.role.capitalize(),
                        style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.w600, color: colors.primary),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        member.status.capitalize(),
                        style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.w600, color: statusColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'change_role') {
                _showChangeRoleDialog(context, ref, member);
              } else if (value == 'remove') {
                _showRemoveConfirmation(context, ref, member);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'change_role',
                child: Row(
                  children: [
                    Icon(Icons.edit_rounded, size: 20, color: colors.bodyTextColor),
                    const SizedBox(width: 12),
                    Text('Change Role', style: GoogleFonts.nunito(fontSize: 14)),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'remove',
                child: Row(
                  children: [
                    Icon(Icons.person_remove_rounded, size: 20, color: colors.error),
                    const SizedBox(width: 12),
                    Text('Remove', style: GoogleFonts.nunito(fontSize: 14, color: colors.error)),
                  ],
                ),
              ),
            ],
            child: Icon(Icons.more_vert_rounded, color: colors.secondaryTextColor),
          ),
        ],
      ),
    );
  }

  void _showChangeRoleDialog(BuildContext context, WidgetRef ref, FamilyMember member) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    String selectedRole = member.role;
    final roles = ['owner', 'editor', 'viewer'];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Change Role', style: GoogleFonts.baloo2(fontSize: 20)),
          content: RadioGroup<String>(
            groupValue: selectedRole,
            onChanged: (value) => setDialogState(() => selectedRole = value!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: roles.map((role) => RadioListTile<String>(
                title: Text(role.capitalize(), style: GoogleFonts.nunito(fontSize: 14)),
                value: role,
                activeColor: colors.primary,
              )).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: GoogleFonts.nunito(fontSize: 14)),
            ),
            FilledButton(
              onPressed: () async {
                Navigator.pop(context);
                await ref.read(updateFamilyMemberUseCaseProvider)(member.copyWith(role: selectedRole));
              },
              child: Text('Save', style: GoogleFonts.nunito(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  void _showRemoveConfirmation(BuildContext context, WidgetRef ref, FamilyMember member) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Remove ${member.name ?? member.email}?', style: GoogleFonts.baloo2(fontSize: 20)),
        content: Text(
          'This will remove their access to this pet\'s data. They will no longer receive reminders or be able to view records.',
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
              await ref.read(removeFamilyMemberUseCaseProvider)(member.id);
            },
            style: FilledButton.styleFrom(backgroundColor: colors.error),
            child: Text('Remove', style: GoogleFonts.nunito(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildNoPetSelected(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Select a Pet',
          message: 'Choose a pet from the home screen to manage family sharing',
          actionLabel: 'Go to Pets',
          onAction: () => context.push('/pets'),
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
          Text('Loading family members...', style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor)),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: PawlyEmptyState(
        title: 'Error Loading Family',
        message: error,
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(familyRepositoryProvider),
        icon: Icons.error_outline_rounded,
      ),
    );
  }
}
