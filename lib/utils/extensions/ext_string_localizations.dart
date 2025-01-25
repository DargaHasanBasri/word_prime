import 'package:easy_localization/easy_localization.dart';

/// It is a specific extension for the String type.
/// It provides a helper method to easily localize string expressions.
extension ExtStringLocalization on String {
  /// `locale` returns the localized equivalent of a String.
  String get locale => this.tr();
}
