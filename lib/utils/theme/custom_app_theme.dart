import 'package:flutter/material.dart';
import 'package:word_prime/utils/theme/custom_app_bar_theme.dart';
import 'package:word_prime/utils/theme/custom_color_scheme.dart';
import 'package:word_prime/utils/theme/custom_text_theme.dart';

/// Defines the light and dark themes of the app.
final class CustomAppTheme {
  /// Private constructor to prevent instantiation.
  CustomAppTheme._();

  /// The bright theme of the app is configured with different styles and color schemes.
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'PlusJakartaSans',
    colorScheme: CustomColorScheme.lightColorScheme,
    textTheme: CustomTextTheme.lightTextTheme,
    scaffoldBackgroundColor: CustomColorScheme.lightColorScheme.primary,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
  );

  /// The dark theme of the app is configured with different styles and color schemes.
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'PlusJakartaSans',
    textTheme: CustomTextTheme.darkTextTheme,
    colorScheme: CustomColorScheme.darkColorScheme,
    scaffoldBackgroundColor: CustomColorScheme.darkColorScheme.primary,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
  );
}
