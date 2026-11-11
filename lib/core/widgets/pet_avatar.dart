// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Pet avatar widget with selection and add variants
class PetAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? localPath;
  final String? name;
  final double size;
  final bool isSelected;
  final bool isAddButton;
  final VoidCallback? onTap;

  const PetAvatar({
    super.key,
    this.imageUrl,
    this.localPath,
    this.name,
    this.size = 78,
    this.isSelected = false,
    this.isAddButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    if (isAddButton) {
      return _AddPetAvatar(size: size, colors: colors, onTap: onTap);
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: colors.primary, width: 2)
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: _buildImage(),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (localPath != null) {
      return Image.asset(
        localPath!,
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        width: size,
        height: size,
        placeholder: (context, url) => _placeholder(),
        errorWidget: (context, url, error) => _placeholder(),
      );
    }

    return _placeholder();
  }

  Widget _placeholder() {
    final colors = PawPalColors.light;
    final initial = name?.isNotEmpty == true ? name![0].toUpperCase() : '🐾';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.surfaceSoft, colors.primary.withValues(alpha: 0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: GoogleFonts.baloo2(
            fontSize: size * 0.35,
            fontWeight: FontWeight.w600,
            color: colors.primary,
          ),
        ),
      ),
    );
  }
}

class _AddPetAvatar extends StatelessWidget {
  final double size;
  final PawPalColors colors;
  final VoidCallback? onTap;

  const _AddPetAvatar({
    required this.size,
    required this.colors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colors.surface,
          border: Border.all(color: colors.divider, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size * 0.35,
              height: size * 0.35,
              decoration: BoxDecoration(
                color: colors.accent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: size * 0.2,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add',
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: colors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Small pet avatar for lists and chips
class PetAvatarSmall extends StatelessWidget {
  final String? imageUrl;
  final String? localPath;
  final String? name;
  final double size;

  const PetAvatarSmall({
    super.key,
    this.imageUrl,
    this.localPath,
    this.name,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors.overlay.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    if (localPath != null) {
      return Image.asset(localPath!, fit: BoxFit.cover, width: size, height: size);
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        width: size,
        height: size,
        placeholder: (context, url) => _placeholder(),
        errorWidget: (context, url, error) => _placeholder(),
      );
    }

    return _placeholder();
  }

  Widget _placeholder() {
    final colors = PawPalColors.light;
    final initial = name?.isNotEmpty == true ? name![0].toUpperCase() : '🐾';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.surfaceSoft, colors.primary.withValues(alpha: 0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: GoogleFonts.baloo2(
            fontSize: size * 0.4,
            fontWeight: FontWeight.w600,
            color: colors.primary,
          ),
        ),
      ),
    );
  }
}