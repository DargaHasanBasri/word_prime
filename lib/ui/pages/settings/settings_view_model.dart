import 'package:easy_localization/easy_localization.dart';
import 'package:word_prime/export.dart';

class SettingsViewModel extends BaseViewModel {
  ValueNotifier<String> selectedLanguage = ValueNotifier('');

  void changeLanguage(String newLanguage, BuildContext context) {
    context.setLocale(Locales.getLocaleFromString(newLanguage));
  }
}
