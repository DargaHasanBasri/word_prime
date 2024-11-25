import 'package:flutter/cupertino.dart';

import 'app_sizes.dart';

final class AppPaddings {
  AppPaddings._();

  static const appPaddingMainTabVertical =
      EdgeInsets.symmetric(vertical: 24 + AppSizes.bottomNavigationBarHeight);
  static const appPaddingLargeVertical = EdgeInsets.symmetric(vertical: 32);
  static const appPaddingVertical = EdgeInsets.symmetric(vertical: 24);
  static const paddingMediumVertical = EdgeInsets.symmetric(vertical: 16);
  static const paddingSmallVertical = EdgeInsets.symmetric(vertical: 8);
  static const paddingXSmallVertical = EdgeInsets.symmetric(vertical: 4);

  static const appPaddingXLargeHorizontal =
      EdgeInsets.symmetric(horizontal: 40);
  static const appPaddingLargeHorizontal = EdgeInsets.symmetric(horizontal: 32);
  static const appPaddingHorizontal = EdgeInsets.symmetric(horizontal: 24);
  static const paddingMediumHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const paddingSmallHorizontal = EdgeInsets.symmetric(horizontal: 8);
  static const paddingXSmallHorizontal = EdgeInsets.symmetric(horizontal: 4);

  static const appPaddingAll = EdgeInsets.all(24);
  static const paddingMediumAll = EdgeInsets.all(16);
  static const paddingSmallAll = EdgeInsets.all(8);

  static const paddingXXLargeTop = EdgeInsets.only(top: 60);
  static const paddingXLargeTop = EdgeInsets.only(top: 32);
  static const paddingLargeTop = EdgeInsets.only(top: 24);
  static const paddingMediumTop = EdgeInsets.only(top: 16);
  static const paddingSmallTop = EdgeInsets.only(top: 8);
  static const paddingXSmallTop = EdgeInsets.only(top: 4);

  static const appPaddingMainTabBottom =
      EdgeInsets.only(bottom: 24 + AppSizes.bottomNavigationBarHeight);
  static const paddingXXLargeBottom = EdgeInsets.only(bottom: 60);
  static const paddingXLargeBottom = EdgeInsets.only(bottom: 32);
  static const paddingLargeBottom = EdgeInsets.only(bottom: 24);
  static const paddingMediumBottom = EdgeInsets.only(bottom: 16);
  static const paddingSmallBottom = EdgeInsets.only(bottom: 8);
  static const paddingXSmallBottom = EdgeInsets.only(bottom: 4);

  static const paddingLargeLeft = EdgeInsets.only(left: 24);
  static const paddingMediumLeft = EdgeInsets.only(left: 16);
  static const paddingSmallLeft = EdgeInsets.only(left: 8);
  static const paddingXSmallLeft = EdgeInsets.only(left: 4);

  static const paddingLargeRight = EdgeInsets.only(right: 24);
  static const paddingMediumRight = EdgeInsets.only(right: 16);
  static const paddingSmallRight = EdgeInsets.only(right: 8);
  static const paddingXSmallRight = EdgeInsets.only(right: 4);
}
