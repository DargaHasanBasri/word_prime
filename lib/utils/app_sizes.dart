import 'package:flutter/material.dart';

/// Defines fixed dimensions used throughout the application.
/// This class helps in consistent sizing of UI elements and allows
/// managing size values from a central place
final class AppSizes {
  AppSizes._();

  /// Radius value used for the logo
  static const double appLogoRadius = 60.0;

  /// AppBar height
  static const double toolbarHeight = 80.0;

  /// Height of bottom navigation bar
  static const double bottomNavigationBarHeight = kBottomNavigationBarHeight;

  /// Height of the activity element's title container
  static const double activityItemTitleContainerHeight = 44;

  /// Width of analysis results container
  static const double analysisResultsContainerWidth = 150;

  /// Width of Top 100 items on leaderboard
  static const double firstHundredContainerWidth = 100;

  /// BottomSheet drag bar width and height
  static const double bottomSheetDragHandleWidth = 50;
  static const double bottomSheetDragHandleHeight = 4;

  /// Width and height values of the general icons of the application
  static const double appOverallIconWidth = 24.0;
  static const double appOverallIconHeight = 24.0;

  /// Height and width for sizedBox 'XLarge'
  static const double sizedBoxXLargeWidth = 100.0;
  static const double sizedBoxXLargeHeight = 100.0;

  /// Height and width for sizedBox 'large'
  static const double sizedBoxLargeWidth = 40.0;
  static const double sizedBoxLargeHeight = 40.0;

  /// Height and width for sizedBox 'Overall'
  static const double sizedBoxOverallWidth = 24.0;
  static const double sizedBoxOverallHeight = 24.0;

  /// Height and width for sizedBox 'Medium'
  static const double sizedBoxMediumWidth = 16.0;
  static const double sizedBoxMediumHeight = 16.0;

  /// Height and width for sizedBox 'Small'
  static const double sizedBoxSmallWidth = 8.0;
  static const double sizedBoxSmallHeight = 8.0;

  /// Height and width for sizedBox 'XSmall'
  static const double sizedBoxXSmallWidth = 4.0;
  static const double sizedBoxXSmallHeight = 4.0;

  /// The height of the container showing the English level
  static const double englishLevelContainerHeight = 150;

  /// Width and height values of icons showing word level
  static const double wordLevelIconWidth = 50.0;
  static const double wordLevelIconHeight = 50.0;

  /// Width and height values of vocabulary quiz level icons
  static const double wordQuizLevelIconWidth = 40.0;
  static const double wordQuizLevelIconHeight = 40.0;
}
