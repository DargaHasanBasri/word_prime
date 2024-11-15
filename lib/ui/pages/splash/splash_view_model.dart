import 'package:word_prime/export.dart';

class SplashViewModel extends BaseViewModel {
  /// Checks if the user is logged in by verifying if the 'email'
  /// key exists in local storage.
  /// Returns `true` if an email is saved, indicating the user is logged in,
  /// and `false` otherwise.
  bool isLoggedInEmailPassword() {
    return serviceLocalStorage.getString('email') != null;
  }

  /// Checks if the user is logged in by verifying if the 'googleUserId'
  /// key exists in local storage.
  /// Returns "true" if the specified googleUserId is registered,
  /// indicating that the user is logged in, otherwise "false".
  bool isLoggedInWithGoogle() {
    return serviceLocalStorage.getString('googleEmail') != null;
  }

  /// General login control: Login with Google or Email?
  bool isLoggedIn() {
    return isLoggedInWithGoogle() || isLoggedInEmailPassword();
  }
}
