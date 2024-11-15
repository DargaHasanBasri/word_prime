import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:word_prime/export.dart';

class SettingsViewModel extends BaseViewModel {
  ValueNotifier<String> selectedLanguage = ValueNotifier('');

  void changeLanguage(String newLanguage, BuildContext context) {
    context.setLocale(Locales.getLocaleFromString(newLanguage));
  }

  Future<void> logOutWithEmailPassword() async {
    await ServiceAuthentication().signOutWithEmailPassword();
    serviceLocalStorage.logout('email');
    serviceLocalStorage.logout('userId');
    log("email deleted and log out");
  }

  Future<void> logOutWithGoogle() async {
    await ServiceAuthentication().signOutWithGoogle();
    serviceLocalStorage.logout('googleEmail');
    serviceLocalStorage.logout('googleUserId');
    log("googleEmail deleted and log out");
  }

  Future<void> logOut() async {
    serviceLocalStorage.isLoggedIn('email')
        ? await logOutWithEmailPassword()
        : await logOutWithGoogle();
  }
}
