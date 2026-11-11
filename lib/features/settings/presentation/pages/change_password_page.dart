// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';

/// Change password page
class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Change Password',
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Current password
                PawlyTextField(
                  controller: _currentPasswordController,
                  labelText: 'Current Password',
                  hintText: '••••••••',
                  obscureText: _obscureCurrent,
                  suffixIcon: IconButton(
                    icon: Icon(_obscureCurrent ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: colors.secondaryTextColor),
                    onPressed: () => setState(() => _obscureCurrent = !_obscureCurrent),
                  ),
                  validator: (v) => v?.isEmpty == true ? 'Current password is required' : null,
                ),
                const SizedBox(height: 16),
                // New password
                PawlyTextField(
                  controller: _newPasswordController,
                  labelText: 'New Password',
                  hintText: '••••••••',
                  obscureText: _obscureNew,
                  suffixIcon: IconButton(
                    icon: Icon(_obscureNew ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: colors.secondaryTextColor),
                    onPressed: () => setState(() => _obscureNew = !_obscureNew),
                  ),
                  validator: (v) {
                    if (v?.isEmpty == true) return 'New password is required';
                    if (v!.length < 8) return 'Password must be at least 8 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Confirm new password
                PawlyTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm New Password',
                  hintText: '••••••••',
                  obscureText: _obscureConfirm,
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirm ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: colors.secondaryTextColor),
                    onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                  validator: (v) {
                    if (v?.isEmpty == true) return 'Please confirm your password';
                    if (v != _newPasswordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                // Password requirements
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.surfaceSoft,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password Requirements',
                        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
                      ),
                      const SizedBox(height: 8),
                      _buildRequirement('At least 8 characters'),
                      _buildRequirement('At least one uppercase letter'),
                      _buildRequirement('At least one lowercase letter'),
                      _buildRequirement('At least one number'),
                      _buildRequirement('At least one special character'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Save button
                PawlyButton(
                  label: 'Update Password',
                  onPressed: _isLoading ? null : _changePassword,
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

  Widget _buildRequirement(String text) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle_rounded, size: 16, color: colors.secondaryTextColor),
          const SizedBox(width: 8),
          Text(text, style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor)),
        ],
      ),
    );
  }

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    // TODO: Update password in Firebase Auth
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password updated successfully!')));
      context.pop();
    }
  }
}