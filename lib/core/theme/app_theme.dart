// ignore_for_file: type=lint
import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'pawpal_colors.dart';
export 'pawpal_text_styles.dart';

import 'pawpal_colors.dart';

/// Theme data for the app
class AppTheme {
  static ThemeData lightTheme = _buildTheme(PawPalColors.light, Brightness.light);
  static ThemeData darkTheme = _buildTheme(PawPalColors.dark, Brightness.dark);

  static ThemeData _buildTheme(PawPalColors colors, Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.surfaceSoft,
        onPrimaryContainer: colors.bodyTextColor,
        secondary: colors.accent,
        onSecondary: Colors.white,
        secondaryContainer: colors.accent.withValues(alpha: 0.15),
        onSecondaryContainer: colors.accent,
        tertiary: colors.success,
        onTertiary: Colors.white,
        error: colors.error,
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.onSurface,
        surfaceContainerHighest: colors.surfaceSoft,
        outline: colors.divider,
        outlineVariant: colors.divider.withValues(alpha: 0.5),
        shadow: colors.overlay,
        scrim: colors.overlay,
        inverseSurface: isDark ? colors.background : colors.surface,
        onInverseSurface: isDark ? colors.onSurface : colors.bodyTextColor,
        inversePrimary: isDark ? colors.primary : colors.primaryDark,
      ),
      extensions: [colors],
      scaffoldBackgroundColor: colors.background,
      canvasColor: colors.background,
      cardColor: colors.surface,
      dividerColor: colors.divider,
      fontFamily: GoogleFonts.nunito().fontFamily,
      textTheme: _buildTextTheme(colors, brightness),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.baloo2(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colors.bodyTextColor,
        ),
        iconTheme: IconThemeData(color: colors.bodyTextColor, size: 24),
        actionsIconTheme: IconThemeData(color: colors.bodyTextColor, size: 24),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.zero,
        shadowColor: colors.overlay,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          minimumSize: const Size(0, 56),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          minimumSize: const Size(0, 56),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary, width: 1.5),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          minimumSize: const Size(0, 56),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: GoogleFonts.nunito(
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.searchField,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        labelStyle: GoogleFonts.nunito(
          fontSize: 14,
          color: colors.secondaryTextColor,
        ),
        hintStyle: GoogleFonts.nunito(
          fontSize: 14,
          color: colors.secondaryTextColor.withValues(alpha: 0.6),
        ),
        floatingLabelStyle: GoogleFonts.nunito(
          fontSize: 12,
          color: colors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        modalBarrierColor: colors.overlay,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titleTextStyle: GoogleFonts.baloo2(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colors.bodyTextColor,
        ),
        contentTextStyle: GoogleFonts.nunito(
          fontSize: 14,
          color: colors.bodyTextColor,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceSoft,
        selectedColor: colors.primary.withValues(alpha: 0.15),
        disabledColor: colors.divider,
        labelStyle: GoogleFonts.nunito(
          fontSize: 12,
          color: colors.bodyTextColor,
        ),
        secondaryLabelStyle: GoogleFonts.nunito(
          fontSize: 12,
          color: colors.onPrimary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: const StadiumBorder(),
        side: BorderSide.none,
        brightness: brightness,
      ),
      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 1,
        space: 1,
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colors.bodyTextColor,
        ),
        subtitleTextStyle: GoogleFonts.nunito(
          fontSize: 14,
          color: colors.secondaryTextColor,
        ),
        iconColor: colors.secondaryTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.primary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 72,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w600, color: colors.accent);
          }
          return GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w500, color: colors.onPrimary.withValues(alpha: 0.7));
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colors.accent, size: 24);
          }
          return IconThemeData(color: colors.onPrimary.withValues(alpha: 0.7), size: 24);
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        elevation: 2,
        shape: const CircleBorder(),
        extendedTextStyle: GoogleFonts.nunito(
          fontSize: 16,
          height: 20 / 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.divider,
        circularTrackColor: colors.divider,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.primary;
          return colors.surface;
        }),
        checkColor: WidgetStateProperty.all(colors.onPrimary),
        side: BorderSide(color: colors.divider, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.primary;
          return colors.divider;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.primary;
          return colors.divider;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return colors.primary.withValues(alpha: 0.3);
          return colors.divider;
        }),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colors.primary,
        inactiveTrackColor: colors.divider,
        thumbColor: colors.primary,
        overlayColor: colors.primary.withValues(alpha: 0.15),
        valueIndicatorColor: colors.primary,
        valueIndicatorTextStyle: GoogleFonts.nunito(color: colors.onPrimary, fontSize: 12),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: colors.primary,
        unselectedLabelColor: colors.secondaryTextColor,
        indicatorColor: colors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500),
        dividerColor: Colors.transparent,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.bodyTextColor.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.nunito(fontSize: 12, color: colors.surface),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.bodyTextColor.withValues(alpha: 0.9),
        contentTextStyle: GoogleFonts.nunito(fontSize: 14, color: colors.surface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        },
      ),
    );
  }

  static TextTheme _buildTextTheme(PawPalColors colors, Brightness brightness) {
    final textColor = brightness == Brightness.light ? colors.bodyTextColor : colors.onSurface;
    final secondaryColor = brightness == Brightness.light ? colors.secondaryTextColor : colors.secondaryTextColor;

    return TextTheme(
      displayLarge: GoogleFonts.baloo2(fontSize: 28, height: 34 / 28, fontWeight: FontWeight.w700, color: textColor, letterSpacing: -0.5),
      displayMedium: GoogleFonts.baloo2(fontSize: 24, height: 30 / 24, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -0.3),
      displaySmall: GoogleFonts.baloo2(fontSize: 20, height: 28 / 20, fontWeight: FontWeight.w600, color: textColor),
      headlineLarge: GoogleFonts.baloo2(fontSize: 24, height: 30 / 24, fontWeight: FontWeight.w600, color: colors.primaryDark),
      headlineMedium: GoogleFonts.baloo2(fontSize: 20, height: 28 / 20, fontWeight: FontWeight.w600, color: textColor),
      headlineSmall: GoogleFonts.baloo2(fontSize: 18, height: 24 / 18, fontWeight: FontWeight.w600, color: textColor),
      titleLarge: GoogleFonts.nunito(fontSize: 18, height: 24 / 18, fontWeight: FontWeight.w600, color: textColor),
      titleMedium: GoogleFonts.nunito(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w500, color: textColor),
      titleSmall: GoogleFonts.nunito(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w500, color: textColor),
      bodyLarge: GoogleFonts.nunito(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w400, color: textColor),
      bodyMedium: GoogleFonts.nunito(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w400, color: textColor),
      bodySmall: GoogleFonts.nunito(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w400, color: secondaryColor),
      labelLarge: GoogleFonts.nunito(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w600, color: textColor),
      labelMedium: GoogleFonts.nunito(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w500, color: secondaryColor),
      labelSmall: GoogleFonts.nunito(fontSize: 10, height: 14 / 10, fontWeight: FontWeight.w500, color: secondaryColor),
    );
  }
}