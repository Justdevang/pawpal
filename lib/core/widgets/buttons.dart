// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Primary button with trailing chevron
class PawPalButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool showChevron;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const PawPalButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.showChevron = true,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return SizedBox(
      width: width ?? double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colors.primary,
          foregroundColor: foregroundColor ?? colors.onPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const StadiumBorder(),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(colors.onPrimary),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: foregroundColor ?? colors.onPrimary,
                    ),
                  ),
                  if (showChevron)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colors.accent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

/// Secondary button
class PawPalSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? borderColor;
  final Color? textColor;
  final double? width;

  const PawPalSecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.borderColor,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return SizedBox(
      width: width ?? double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor ?? colors.primary,
          side: BorderSide(color: borderColor ?? colors.primary, width: 1.5),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor ?? colors.primary),
                ),
              )
            : Text(
                label,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? colors.primary,
                ),
              ),
      ),
    );
  }
}

/// Ghost button
class PawPalGhostButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? textColor;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const PawPalGhostButton({
    super.key,
    required this.label,
    this.onPressed,
    this.textColor,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? colors.primary,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 18, color: textColor ?? colors.primary),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColor ?? colors.primary,
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            Icon(trailingIcon, size: 18, color: textColor ?? colors.primary),
          ],
        ],
      ),
    );
  }
}