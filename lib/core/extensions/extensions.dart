// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;

import '../errors/app_exceptions.dart';

/// Extension for BuildContext to easily access theme colors and text styles
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isTablet => MediaQuery.of(this).size.width >= 600;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  EdgeInsets get safePadding => MediaQuery.of(this).padding;
}

/// Extension for DateTime formatting
extension DateTimeX on DateTime {
  String formatDate({String pattern = 'MMM d, yyyy'}) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[month - 1]} $day, $year';
  }

  String formatTime({bool use24Hour = false}) {
    int hour = this.hour;
    final minute = this.minute.toString().padLeft(2, '0');
    if (!use24Hour) {
      final period = hour >= 12 ? 'PM' : 'AM';
      hour = hour % 12;
      if (hour == 0) hour = 12;
      return '$hour:$minute $period';
    }
    return '$hour:$minute';
  }

  String formatDateTime({bool use24Hour = false}) {
    return '${formatDate()} ${formatTime(use24Hour: use24Hour)}';
  }

  String formatRelative() {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool get isToday => isSameDay(DateTime.now());
  bool get isTomorrow => isSameDay(DateTime.now().add(const Duration(days: 1)));
  bool get isYesterday => isSameDay(DateTime.now().subtract(const Duration(days: 1)));
}

/// Extension for String utilities
extension StringX on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get initials {
    if (isEmpty) return '';
    final words = trim().split(' ');
    if (words.length == 1) return words[0][0].toUpperCase();
    return '${words[0][0]}${words[1][0]}'.toUpperCase();
  }

  bool get isValidEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isValidPhone => RegExp(r'^\+?[\d\s-]{10,}$').hasMatch(this);

  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }
}

/// Extension for List utilities
extension ListX<T> on List<T> {
  List<T> uniqueBy<K>(K Function(T) key) {
    final seen = <K>{};
    return where((element) => seen.add(key(element))).toList();
  }

  T? firstOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

/// Extension for async utilities
extension FutureX<T> on Future<T> {
  Future<Result<T>> toResult() async {
    try {
      final data = await this;
      return Success(data);
    } on AppException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(DatabaseException(e.toString(), originalError: e));
    }
  }
}

/// Haptic feedback helper
class AppHaptics {
  static void light() => services.HapticFeedback.lightImpact();
  static void medium() => services.HapticFeedback.mediumImpact();
  static void heavy() => services.HapticFeedback.heavyImpact();
  static void selection() => services.HapticFeedback.selectionClick();
  static void success() {
    services.HapticFeedback.lightImpact();
    Future.delayed(const Duration(milliseconds: 50), () => services.HapticFeedback.lightImpact());
  }
  static void error() {
    services.HapticFeedback.heavyImpact();
    Future.delayed(const Duration(milliseconds: 100), () => services.HapticFeedback.heavyImpact());
  }
}