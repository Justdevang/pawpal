// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';

/// Profile settings page
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _photoUrl;
  String? _localPhotoPath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final authState = ref.read(authProvider);
    final user = authState.value;
    if (user != null) {
      _nameController.text = user.displayName ?? '';
      _emailController.text = user.email;
      _photoUrl = user.photoUrl;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Profile',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Photo
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: colors.surfaceSoft,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.divider, width: 2),
                      ),
                      child: _buildPhotoPreview(),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickPhoto,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: colors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: colors.background, width: 2),
                          ),
                          child: Icon(Icons.camera_alt_rounded, color: colors.onPrimary, size: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Name
              PawlyTextField(
                controller: _nameController,
                labelText: 'Display Name',
                hintText: 'Your name',
              ),
              const SizedBox(height: 16),
              // Email (read-only)
              PawlyTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'you@example.com',
                readOnly: true,
              ),
              const SizedBox(height: 32),
              // Save button
              PawlyButton(
                label: 'Save Changes',
                onPressed: _isLoading ? null : _saveProfile,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPreview() {
    if (_localPhotoPath != null) {
      return ClipOval(
        child: Image.asset(_localPhotoPath!, width: 100, height: 100, fit: BoxFit.cover),
      );
    }

    if (_photoUrl != null && _photoUrl!.isNotEmpty) {
      return ClipOval(
        child: Image.network(_photoUrl!, width: 100, height: 100, fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => _placeholder()),
      );
    }

    return _placeholder();
  }

  Widget _placeholder() {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(
      child: Text(
        _nameController.text.isNotEmpty ? _nameController.text[0].toUpperCase() : '👤',
        style: GoogleFonts.baloo2(fontSize: 36, fontWeight: FontWeight.w600, color: colors.primary),
      ),
    );
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 400, maxHeight: 400, imageQuality: 80);
    if (image != null) {
      setState(() => _localPhotoPath = image.path);
      // TODO: Upload to Firebase Storage
    }
  }

  Future<void> _saveProfile() async {
    if (_nameController.text.trim().isEmpty) return;

    setState(() => _isLoading = true);
    // TODO: Update profile in Firebase Auth and Firestore
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated!')));
    }
  }
}