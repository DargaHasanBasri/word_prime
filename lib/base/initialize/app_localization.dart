import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:word_prime/base/enums/locales.dart';

/// AppLocalization extends the EasyLocalization class and
/// provides localization (language support) for the application.
@immutable
final class AppLocalization extends EasyLocalization {
  AppLocalization({
    required super.child,
    super.key,
  }) : super(
          /// Languages supported by localization.
          supportedLocales: _supportedLocales,

          /// Directory containing language files.
          path: _langPath,

          /// The default language is the language
          /// that will be used when an unsupported language is selected.
          fallbackLocale: Locales.en.locale,
        );

  /// Languages supported by localization.
  static final List<Locale> _supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  /// The path to the folder containing the language files.
  static const String _langPath = 'assets/langs';
}
