// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/family_member.dart';
import '../providers/family_providers.dart';

/// Invite family member page (alternative to bottom sheet)
class InviteFamilyMemberPage extends ConsumerStatefulWidget {
  final int petId;

  const InviteFamilyMemberPage({super.key, required this.petId});

  @override
  ConsumerState<InviteFamilyMemberPage> createState() => _InviteFamilyMemberPageState();
}

class _InviteFamilyMemberPageState extends ConsumerState<InviteFamilyMemberPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  String _selectedRole = 'editor';
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Invite Family Member',
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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invite Family Member',
                  style: GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
                ),
                const SizedBox(height: 8),
                Text(
                  'They\'ll get an email to join and help manage this pet\'s care',
                  style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
                ),
                const SizedBox(height: 24),
                // Email
                PawlyTextField(
                  controller: _emailController,
                  labelText: 'Email *',
                  hintText: 'family@email.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v?.isEmpty == true) return 'Email is required';
                    if (!v!.isValidEmail) return 'Enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Name (optional)
                PawlyTextField(
                  controller: _nameController,
                  labelText: 'Name (optional)',
                  hintText: 'Mom, Dad, etc.',
                ),
                const SizedBox(height: 16),
                // Role
                _buildRoleSelector(),
                const SizedBox(height: 24),
                // Invite button
                PawlyButton(
                  label: 'Send Invite',
                  onPressed: _isLoading ? null : _sendInvite,
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

  Widget _buildRoleSelector() {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final roles = [
      _RoleOption(value: 'owner', label: 'Owner', description: 'Full access + can manage members', icon: Icons.admin_panel_settings_rounded),
      _RoleOption(value: 'editor', label: 'Editor', description: 'Can edit pets, add records, get reminders', icon: Icons.edit_rounded),
      _RoleOption(value: 'viewer', label: 'Viewer', description: 'Read-only access to pet info', icon: Icons.visibility_rounded),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Permission Level',
          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500, color: colors.bodyTextColor),
        ),
        const SizedBox(height: 12),
        ...roles.map((role) => _buildRoleOption(role)),
      ],
    );
  }

  Widget _buildRoleOption(_RoleOption role) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final isSelected = _selectedRole == role.value;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: isSelected ? colors.primary.withValues(alpha: 0.1) : colors.surface,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => setState(() => _selectedRole = role.value),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected ? colors.primary.withValues(alpha: 0.15) : colors.surfaceSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(role.icon, color: isSelected ? colors.primary : colors.secondaryTextColor, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(role.label, style: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w600, color: colors.bodyTextColor)),
                      Text(role.description, style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor)),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle_rounded, color: colors.primary, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendInvite() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authState = ref.read(authProvider);
      final user = authState.value;
      if (user == null) throw Exception('Not authenticated');

      final member = FamilyMember(
        id: 0,
        petId: widget.petId,
        userId: null,
        email: _emailController.text.trim(),
        name: _nameController.text.trim().isEmpty ? null : _nameController.text.trim(),
        role: _selectedRole,
        status: 'pending',
        invitedBy: user.email,
        invitedAt: DateTime.now(),
        respondedAt: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final result = await ref.read(inviteFamilyMemberUseCaseProvider)(member);
      result.fold(
        (failure) => throw Exception(failure.message),
        (_) => null,
      );

      if (mounted) {
        setState(() => _isLoading = false);
        context.pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invitation sent!')),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send invite: $e')),
        );
      }
    }
  }
}

class _RoleOption {
  final String value;
  final String label;
  final String description;
  final IconData icon;

  _RoleOption({required this.value, required this.label, required this.description, required this.icon});
}