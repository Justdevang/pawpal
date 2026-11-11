// ignore_for_file: type=lint
/// App-wide constants
class AppConstants {
  // Animation durations
  static const Duration fastAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration slowAnimation = Duration(milliseconds: 400);

  // Stagger delays
  static const Duration staggerDelay = Duration(milliseconds: 60);

  // Spacing
  static const double screenPadding = 20.0;
  static const double cardRadius = 20.0;
  static const double buttonRadius = 999.0;
  static const double avatarRadius = 16.0;
  static const double bottomSheetRadius = 28.0;
  static const double searchFieldRadius = 16.0;
  static const double statTileRadius = 20.0;

  // Sizes
  static const double minTouchTarget = 48.0;
  static const double maxContentWidth = 480.0;
  static const double bottomNavHeight = 88.0;
  static const double fabSize = 56.0;

  // Notification
  static const int maxPendingNotifications = 64;

  // Pagination
  static const int defaultPageSize = 20;

  // Cache
  static const Duration cacheExpiry = Duration(days: 7);

  // Debounce
  static const Duration searchDebounce = Duration(milliseconds: 300);
}