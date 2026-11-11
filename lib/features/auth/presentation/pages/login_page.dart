// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/extensions/extensions.dart';
import '../providers/auth_provider.dart';

/// Login page with email/password, Google, Apple, and guest mode
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await ref.read(authProvider.notifier).signInWithEmail(
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

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authProvider.notifier).signInWithGoogle();
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

  Future<void> _signInWithApple() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authProvider.notifier).signInWithApple();
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
                  'Welcome Back',
                  style: GoogleFonts.baloo2(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: colors.primaryDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue to PawPal',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: colors.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
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
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                      color: colors.secondaryTextColor,
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Password is required';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                  onFieldSubmitted: (_) => _signInWithEmail(),
                ),
                const SizedBox(height: 8),
                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => context.push('/forgot-password'),
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Sign in button
                PawlyButton(
                  label: 'Sign In',
                  onPressed: _isLoading ? null : _signInWithEmail,
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
                        onPressed: _isLoading ? null : _signInWithGoogle,
                        isLoading: _isLoading,
                        leadingIcon: Icons.g_mobiledata_rounded,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PawlySecondaryButton(
                        label: 'Apple',
                        onPressed: _isLoading ? null : _signInWithApple,
                        isLoading: _isLoading,
                        leadingIcon: Icons.apple_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Guest mode
                Center(
                  child: TextButton(
                    onPressed: () => context.go('/guest'),
                    child: Text(
                      'Continue as Guest',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colors.secondaryTextColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Sign up link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: colors.secondaryTextColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/register'),
                        child: Text(
                          'Sign Up',
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