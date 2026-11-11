// ignore_for_file: type=lint
import 'package:flutter/material.dart';

/// Theme extension for PawPal colors
class PawPalColors extends ThemeExtension<PawPalColors> {
  // Light theme colors
  static const Color cream = Color(0xFFFFF6EE);
  static const Color blush = Color(0xFFF0C8BE);
  static const Color deepMaroon = Color(0xFF6B0F0A);
  static const Color deepMaroonDark = Color(0xFF4A0A07);
  static const Color orange = Color(0xFFE8812B);
  static const Color mintGreen = Color(0xFF56BF94);
  static const Color healthCardRedStart = Color(0xFFA8302B);
  static const Color healthCardRedEnd = Color(0xFFC0453E);
  static const Color neutral = Color(0xFFEFE6E0);
  static const Color bodyText = Color(0xFF3A3A3A);
  static const Color secondaryText = Color(0xFF7A6A64);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Dark theme colors
  static const Color darkBackground = Color(0xFF1E1412);
  static const Color darkSurface = Color(0xFF2B1D1A);
  static const Color darkMaroon = Color(0xFF8A1F18);
  static const Color darkMintGreen = Color(0xFF3FA57D); // Adjusted for contrast

  final Color background;
  final Color surface;
  final Color surfaceSoft;
  final Color primary;
  final Color primaryDark;
  final Color accent;
  final Color success;
  final Color healthCardGradientStart;
  final Color healthCardGradientEnd;
  final Color searchField;
  final Color bodyTextColor;
  final Color secondaryTextColor;
  final Color onPrimary;
  final Color onSurface;
  final Color divider;
  final Color error;
  final Color warning;
  final Color overlay;

  const PawPalColors({
    required this.background,
    required this.surface,
    required this.surfaceSoft,
    required this.primary,
    required this.primaryDark,
    required this.accent,
    required this.success,
    required this.healthCardGradientStart,
    required this.healthCardGradientEnd,
    required this.searchField,
    required this.bodyTextColor,
    required this.secondaryTextColor,
    required this.onPrimary,
    required this.onSurface,
    required this.divider,
    required this.error,
    required this.warning,
    required this.overlay,
  });

  /// Light theme colors
  static const PawPalColors light = PawPalColors(
    background: cream,
    surface: Colors.white,
    surfaceSoft: blush,
    primary: deepMaroon,
    primaryDark: deepMaroonDark,
    accent: orange,
    success: mintGreen,
    healthCardGradientStart: healthCardRedStart,
    healthCardGradientEnd: healthCardRedEnd,
    searchField: neutral,
    bodyTextColor: bodyText,
    secondaryTextColor: secondaryText,
    onPrimary: Colors.white,
    onSurface: bodyText,
    divider: Color(0xFFE8DCC8),
    error: Color(0xFFD32F2F),
    warning: Color(0xFFF57C00),
    overlay: Color(0x80000000),
  );

  /// Dark theme colors
  static const PawPalColors dark = PawPalColors(
    background: darkBackground,
    surface: darkSurface,
    surfaceSoft: Color(0xFF3D2A26),
    primary: darkMaroon,
    primaryDark: Color(0xFFA82F26),
    accent: orange,
    success: darkMintGreen,
    healthCardGradientStart: Color(0xFF8B2520),
    healthCardGradientEnd: Color(0xFFA03830),
    searchField: Color(0xFF3D2A26),
    bodyTextColor: Color(0xFFF5E6E0),
    secondaryTextColor: Color(0xFFB8A098),
    onPrimary: Colors.white,
    onSurface: Color(0xFFF5E6E0),
    divider: Color(0xFF4A3530),
    error: Color(0xFFEF5350),
    warning: Color(0xFFFFA726),
    overlay: Color(0xCC000000),
  );

  @override
  PawPalColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceSoft,
    Color? primary,
    Color? primaryDark,
    Color? accent,
    Color? success,
    Color? healthCardGradientStart,
    Color? healthCardGradientEnd,
    Color? searchField,
    Color? bodyTextColor,
    Color? secondaryTextColor,
    Color? onPrimary,
    Color? onSurface,
    Color? divider,
    Color? error,
    Color? warning,
    Color? overlay,
  }) {
    return PawPalColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceSoft: surfaceSoft ?? this.surfaceSoft,
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      healthCardGradientStart: healthCardGradientStart ?? this.healthCardGradientStart,
      healthCardGradientEnd: healthCardGradientEnd ?? this.healthCardGradientEnd,
      searchField: searchField ?? this.searchField,
      bodyTextColor: bodyTextColor ?? this.bodyTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      onPrimary: onPrimary ?? this.onPrimary,
      onSurface: onSurface ?? this.onSurface,
      divider: divider ?? this.divider,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      overlay: overlay ?? this.overlay,
    );
  }

  @override
  PawPalColors lerp(ThemeExtension<PawPalColors>? other, double t) {
    if (other is! PawPalColors) return this;
    return PawPalColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSoft: Color.lerp(surfaceSoft, other.surfaceSoft, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      success: Color.lerp(success, other.success, t)!,
      healthCardGradientStart: Color.lerp(healthCardGradientStart, other.healthCardGradientStart, t)!,
      healthCardGradientEnd: Color.lerp(healthCardGradientEnd, other.healthCardGradientEnd, t)!,
      searchField: Color.lerp(searchField, other.searchField, t)!,
      bodyTextColor: Color.lerp(bodyTextColor, other.bodyTextColor, t)!,
      secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
    );
  }
}