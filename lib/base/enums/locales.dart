import 'dart:ui';

enum Locales {
  tr(Locale('tr', 'TR')),
  en(Locale('en', 'US'));

  final Locale locale;
  const Locales(this.locale);

  /// Tracks the language change status in string type for the
  /// custom radio button created within the scope of the project.
  static Locale getLocaleFromString(String language) {
    switch (language) {
      case 'English':
        return Locales.en.locale;
      case 'Turkish':
        return Locales.tr.locale;
      default:
        throw ArgumentError("Unsupported language: $language");
    }
  }

  /// Tracks the language change status of type Locale for the
  /// custom radio button created within the project.
  static String getStringFromLocale(Locale language) {
    for (var locale in Locales.values) {
      if (locale.locale == language) {
        return locale == Locales.en ? 'English' : 'Turkish';
      }
    }
    throw ArgumentError("Unsupported language: $language");
  }
}
