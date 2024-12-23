import 'package:flutter/material.dart';
import 'package:word_prime/utils/app_colors.dart';

final class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    /// headline light
    headlineLarge: TextStyle().copyWith(
      fontSize: 28,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w700,
      color: AppColors.mirage,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.mirage,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 18,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: AppColors.mirage,
    ),

    /// title light
    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.mirage,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: AppColors.mirage,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: AppColors.paleSky,
    ),

    /// body light
    bodyLarge: TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w700,
      color: AppColors.mirage,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.mirage,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: AppColors.mirage,
    ),

    /// label light
    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.mirage,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: AppColors.mirage,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: 12,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: AppColors.mirage,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    /// headline dark
    headlineLarge: TextStyle().copyWith(
      fontSize: 28,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 18,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),

    /// title dark
    titleLarge: TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: AppColors.santaGrey,
    ),

    /// body dark
    bodyLarge: TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),

    /// label dark
    labelLarge: TextStyle().copyWith(
      fontSize: 12,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: 12,
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );
}
