import 'package:flutter/cupertino.dart';
import 'app_sizes.dart';

/// It contains constant padding values used for various
/// UI elements in the application.
/// This class manages padding values from a central source to help
/// the application maintain a consistent appearance and layout.
final class AppPaddings {
  AppPaddings._();

  /// Vertical padding for MainTab page (along with bottom navigation bar height)
  static const appPaddingMainTabVertical =
      EdgeInsets.symmetric(vertical: 24 + AppSizes.bottomNavigationBarHeight);

  /// Vertical padding values
  static const appPaddingLargeVertical = EdgeInsets.symmetric(vertical: 32);
  static const appPaddingVertical = EdgeInsets.symmetric(vertical: 24);
  static const paddingMediumVertical = EdgeInsets.symmetric(vertical: 16);
  static const paddingSmallVertical = EdgeInsets.symmetric(vertical: 8);
  static const paddingXSmallVertical = EdgeInsets.symmetric(vertical: 4);

  /// Horizontal padding values
  static const appPaddingXLargeHorizontal =
      EdgeInsets.symmetric(horizontal: 40);
  static const appPaddingLargeHorizontal = EdgeInsets.symmetric(horizontal: 32);
  static const appPaddingHorizontal = EdgeInsets.symmetric(horizontal: 24);
  static const paddingMediumHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const paddingSmallHorizontal = EdgeInsets.symmetric(horizontal: 8);
  static const paddingXSmallHorizontal = EdgeInsets.symmetric(horizontal: 4);

  /// Equal padding values from all directions
  static const appPaddingAll = EdgeInsets.all(24);
  static const paddingMediumAll = EdgeInsets.all(16);
  static const paddingSmallAll = EdgeInsets.all(8);
  static const paddingXSmallAll = EdgeInsets.all(4);

  /// Padding values from above
  static const paddingXXLargeTop = EdgeInsets.only(top: 60);
  static const paddingXLargeTop = EdgeInsets.only(top: 32);
  static const paddingLargeTop = EdgeInsets.only(top: 24);
  static const paddingMediumTop = EdgeInsets.only(top: 16);
  static const paddingSmallTop = EdgeInsets.only(top: 8);
  static const paddingXSmallTop = EdgeInsets.only(top: 4);

  /// Bottom padding for MainTab page (with bottom navigation bar height)
  static const appPaddingMainTabBottom =
      EdgeInsets.only(bottom: 48 + AppSizes.bottomNavigationBarHeight);

  /// Padding values from below
  static const paddingXXLargeBottom = EdgeInsets.only(bottom: 60);
  static const paddingXLargeBottom = EdgeInsets.only(bottom: 32);
  static const paddingLargeBottom = EdgeInsets.only(bottom: 24);
  static const paddingMediumBottom = EdgeInsets.only(bottom: 16);
  static const paddingSmallBottom = EdgeInsets.only(bottom: 8);
  static const paddingXSmallBottom = EdgeInsets.only(bottom: 4);

  /// Padding values for left side
  static const paddingLargeLeft = EdgeInsets.only(left: 24);
  static const paddingMediumLeft = EdgeInsets.only(left: 16);
  static const paddingSmallLeft = EdgeInsets.only(left: 8);
  static const paddingXSmallLeft = EdgeInsets.only(left: 4);

  /// Padding values for right side
  static const paddingLargeRight = EdgeInsets.only(right: 24);
  static const paddingMediumRight = EdgeInsets.only(right: 16);
  static const paddingSmallRight = EdgeInsets.only(right: 8);
  static const paddingXSmallRight = EdgeInsets.only(right: 4);
}
