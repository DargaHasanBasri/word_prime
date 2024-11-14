import 'package:word_prime/export.dart';

class SplashViewModel extends BaseViewModel {

  /// Checks if the user is logged in by verifying if the 'email'
  /// key exists in local storage.
  /// Returns `true` if an email is saved, indicating the user is logged in,
  /// and `false` otherwise.
  bool isLoggedIn() {
    return serviceLocalStorage.getString('email') != null;
  }
}
