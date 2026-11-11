// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'pawly_button.dart';

/// Floating action button per Pawly spec: maroon, bottom right
class PawlyFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String? label;
  final bool isExtended;

  const PawlyFloatingActionButton({
    super.key,
    this.onPressed,
    this.icon = Icons.add_rounded,
    this.label,
    this.isExtended = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        elevation: 2,
        shape: const StadiumBorder(),
        extendedPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        label: Text(
          label!,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colors.onPrimary,
          ),
        ),
        icon: Icon(icon, color: colors.onPrimary),
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: colors.primary,
      foregroundColor: colors.onPrimary,
      elevation: 2,
      shape: const CircleBorder(),
      child: Icon(icon, color: colors.onPrimary, size: 28),
    );
  }
}

/// Frosted icon button for overlays (back, menu)
class PawlyFrostedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final double borderRadius;

  const PawlyFrostedIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 48,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 0.5),
          ),
          child: Center(
            child: Icon(
              icon,
              color: colors.bodyTextColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

/// Status chip
class PawlyStatusChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const PawlyStatusChip({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

/// Empty state per Pawly spec: paw illustration in blush, one CTA
class PawlyEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Widget? illustration;
  final IconData? icon;

  const PawlyEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.illustration,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            illustration ??
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: colors.surfaceSoft,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      icon ?? Icons.pets_rounded,
                      size: 56,
                      color: colors.primary.withValues(alpha: 0.5),
                    ),
                  ),
                ),
            const SizedBox(height: 24),
            Text(
              title,
              style: GoogleFonts.baloo2(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colors.bodyTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: colors.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 24),
              PawlyButton(
                label: actionLabel!,
                onPressed: onAction,
                width: 240,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Bottom sheet per Pawly spec: top radius 28, cream background
class PawlyBottomSheet extends StatelessWidget {
  final Widget child;
  final double? initialChildSize;
  final double? maxChildSize;
  final double? minChildSize;

  const PawlyBottomSheet({
    super.key,
    required this.child,
    this.initialChildSize = 0.7,
    this.maxChildSize = 0.95,
    this.minChildSize = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return DraggableScrollableSheet(
      initialChildSize: initialChildSize!,
      maxChildSize: maxChildSize!,
      minChildSize: minChildSize!,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: colors.divider,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}