// ignore_for_file: type=lint, avoid_positional_boolean_parameters
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.light);

  void setMode(ThemeMode mode) => state = mode;
  void toggle(bool isDark) => state = isDark ? ThemeMode.dark : ThemeMode.light;
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

