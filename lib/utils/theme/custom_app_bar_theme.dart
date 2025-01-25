import 'package:word_prime/export.dart';

/// Defines the app's AppBar theme styles.
final class CustomAppBarTheme {
  /// Private constructor to prevent instantiation.
  CustomAppBarTheme._();

  /// AppBar settings for light theme.
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
    toolbarHeight: AppSizes.toolbarHeight,
    scrolledUnderElevation: 0,
    centerTitle: true,
  );

  /// AppBar settings for dark theme.
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.mirage,
    toolbarHeight: AppSizes.toolbarHeight,
    scrolledUnderElevation: 0,
    centerTitle: true,
  );
}
