import 'package:flutter/material.dart';
import 'package:word_prime/utils/theme/custom_app_bar_theme.dart';
import 'package:word_prime/utils/theme/custom_color_scheme.dart';
import 'package:word_prime/utils/theme/custom_text_theme.dart';

final class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.lightColorScheme,
    textTheme: CustomTextTheme.lightTextTheme,
    scaffoldBackgroundColor: CustomColorScheme.lightColorScheme.primary,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: CustomTextTheme.darkTextTheme,
    colorScheme: CustomColorScheme.darkColorScheme,
    scaffoldBackgroundColor: CustomColorScheme.darkColorScheme.primary,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
  );
}
