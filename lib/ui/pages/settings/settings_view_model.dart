import 'package:easy_localization/easy_localization.dart';
import 'package:word_prime/export.dart';

class SettingsViewModel extends BaseViewModel {
  ValueNotifier<String> selectedLanguage = ValueNotifier('');

  void changeLanguage(String newLanguage, BuildContext context) {
    context.setLocale(getLocaleFromString(newLanguage));
  }

  Locale getLocaleFromString(String language) {
    switch (language) {
      case 'English':
        return AppLocaleConstants.EN_LOCALE;
      case 'Turkish':
        return AppLocaleConstants.TR_LOCALE;
      default:
        throw ArgumentError("Unsupported language: $language");
    }
  }

  String getStringFromLocale(Locale language) {
    switch (language) {
      case AppLocaleConstants.EN_LOCALE:
        return 'English';
      case AppLocaleConstants.TR_LOCALE:
        return 'Turkish';
      default:
        throw ArgumentError("Unsupported language: $language");
    }
  }
}
