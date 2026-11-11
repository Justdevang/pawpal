// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pawpal_colors.dart';

/// Text styles for the app
class PawPalTextStyles {
  static TextStyle displayLarge(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.baloo2(
      fontSize: 28,
      height: 34 / 28,
      fontWeight: FontWeight.w700,
      color: colors.bodyTextColor,
      letterSpacing: -0.5,
    );
  }

  static TextStyle displayMedium(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.baloo2(
      fontSize: 24,
      height: 30 / 24,
      fontWeight: FontWeight.w600,
      color: colors.bodyTextColor,
      letterSpacing: -0.3,
    );
  }

  static TextStyle headline1(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.baloo2(
      fontSize: 24,
      height: 30 / 24,
      fontWeight: FontWeight.w600,
      color: colors.primaryDark,
    );
  }

  static TextStyle headline2(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.baloo2(
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w600,
      color: colors.bodyTextColor,
    );
  }

  static TextStyle bodyLarge(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.nunito(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
      color: colors.bodyTextColor,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.nunito(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
      color: colors.bodyTextColor,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.nunito(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w400,
      color: colors.secondaryTextColor,
    );
  }

  static TextStyle labelLarge(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.nunito(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w600,
      color: colors.bodyTextColor,
    );
  }

  static TextStyle labelMedium(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.nunito(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
      color: colors.secondaryTextColor,
    );
  }

  static TextStyle button(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return GoogleFonts.nunito(
      fontSize: 16,
      height: 20 / 16,
      fontWeight: FontWeight.w600,
      color: colors.onPrimary,
      letterSpacing: 0.2,
    );
  }

  /// Two-tone headline: first line primaryDark, second line accent
  static List<TextSpan> twoToneHeadline(BuildContext context, String line1, String line2) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    return [
      TextSpan(
        text: '$line1\n',
        style: GoogleFonts.baloo2(
          fontSize: 28,
          height: 34 / 28,
          fontWeight: FontWeight.w700,
          color: colors.primaryDark,
          letterSpacing: -0.5,
        ),
      ),
      TextSpan(
        text: line2,
        style: GoogleFonts.baloo2(
          fontSize: 28,
          height: 34 / 28,
          fontWeight: FontWeight.w700,
          color: colors.accent,
          letterSpacing: -0.5,
        ),
      ),
    ];
  }
}