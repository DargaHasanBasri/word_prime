import 'package:flutter/material.dart';
import 'package:word_prime/utils/app_colors.dart';

/// Enum that defines the type of custom SnackBars to display
/// Each type has a specific icon and color associated with it
enum CustomSnackBarType {
  info,
  warning,
  success,
  error;

  /// Returns the icon associated with each SnackBar type
  /// Used to visually represent the type of the SnackBar
  IconData get icon {
    switch (this) {
      case CustomSnackBarType.info:
        return Icons.info_outline;
      case CustomSnackBarType.warning:
        return Icons.warning_amber_outlined;
      case CustomSnackBarType.success:
        return Icons.check;
      case CustomSnackBarType.error:
        return Icons.error_outline;
    }
  }

  /// Returns the color associated with each SnackBar type
  /// Used to style the SnackBar according to its type
  Color get color {
    switch (this) {
      case CustomSnackBarType.info:
        return AppColors.cornflowerBlue;
      case CustomSnackBarType.warning:
        return AppColors.fadedOrange;
      case CustomSnackBarType.success:
        return AppColors.greenishTeal;
      case CustomSnackBarType.error:
        return AppColors.artyClickRed;
    }
  }
}
