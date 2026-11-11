// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/extensions/extensions.dart';
import '../providers/auth_provider.dart';

/// Register page with email/password
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _registerWithEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await ref.read(authProvider.notifier).registerWithEmail(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text,
      );
      if (mounted) context.go('/');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                // Back button
                Align(
                  alignment: Alignment.centerLeft,
                  child: PawlyIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.pop(),
                    size: 40,
                    backgroundColor: colors.surface,
                  ),
                ),
                const SizedBox(height: 24),
                // Title
                Text(
                  'Create Account',
                  style: GoogleFonts.baloo2(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: colors.primaryDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Join PawPal to manage your pets\' care',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: colors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Name field
                PawlyTextField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  hintText: 'John Doe',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Name is required';
                    if (value.length < 2) return 'Name must be at least 2 characters';
                    return null;
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                const SizedBox(height: 16),
                // Email field
                PawlyTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'you@example.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Email is required';
                    if (!value.isValidEmail) return 'Enter a valid email';
                    return null;
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                const SizedBox(height: 16),
                // Password field
                PawlyTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: '••••••••',
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                      color: colors.secondaryTextColor,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Password is required';
                    if (value.length < 8) return 'Password must be at least 8 characters';
                    return null;
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                const SizedBox(height: 16),
                // Confirm password
                PawlyTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: '••••••••',
                  obscureText: _obscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                      color: colors.secondaryTextColor,
                    ),
                    onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please confirm your password';
                    if (value != _passwordController.text) return 'Passwords do not match';
                    return null;
                  },
                  onFieldSubmitted: (_) => _registerWithEmail(),
                ),
                const SizedBox(height: 24),
                // Register button
                PawlyButton(
                  label: 'Create Account',
                  onPressed: _isLoading ? null : _registerWithEmail,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 24),
                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: colors.divider)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Or continue with',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: colors.secondaryTextColor,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: colors.divider)),
                  ],
                ),
                const SizedBox(height: 24),
                // Social buttons
                Row(
                  children: [
                    Expanded(
                      child: PawlySecondaryButton(
                        label: 'Google',
                        onPressed: () => ref.read(authProvider.notifier).signInWithGoogle(),
                        leadingIcon: Icons.g_mobiledata_rounded,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PawlySecondaryButton(
                        label: 'Apple',
                        onPressed: () => ref.read(authProvider.notifier).signInWithApple(),
                        leadingIcon: Icons.apple_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Login link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: colors.secondaryTextColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/login'),
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}