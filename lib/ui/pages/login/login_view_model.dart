import 'dart:developer';
import 'package:word_prime/export.dart';

class LoginViewModel extends BaseViewModel {
  /// Variable where I keep the change of the value of the isHaveObscure
  /// property in the text form field
  ValueNotifier<bool> isActive = ValueNotifier(true);

  /// Variables in which I store the changes of email and password
  /// values in the text form field
  ValueNotifier<String> emailInput = ValueNotifier('');
  ValueNotifier<String> passwordInput = ValueNotifier('');

  /// Check whether the contents of the email and password variables are empty
  bool isEmptyInputText() {
    return emailInput.value.isNotEmpty && passwordInput.value.isNotEmpty;
  }

  Future<void> login({
    /// Callback when login is successful
    required VoidCallback onLoginSuccess,

    /// Callback to show progress indicator
    required VoidCallback showProgress,

    /// Callback to hide progress indicator
    required VoidCallback hideProgress,

    /// Callback to show error message
    required void Function(String message) showErrorSnackBar,
  }) async {
    /// Show progress indicator at the start of the login process
    showProgress.call();

    /// Firebase user login with provided email and password
    UserCredential? userCredential = await ServiceAuthentication().login(
      email: emailInput.value,
      password: passwordInput.value,
    );

    if (userCredential != null) {
      /// Save the email  locally for future use
      await serviceLocalStorage.setString('email', emailInput.value);
      log("email saved");

      /// Call the success callback after successful login
      onLoginSuccess.call();
    } else {
      showErrorSnackBar(LocaleKeys.warningMessages_userNotFound.locale);
    }

    hideProgress.call();
  }

  /// Complete login process with Google.
  /// If the login is successful, `onLoginSuccess` is called.
  String? googleEmail;
  Future<void> loginWithGoogle({
    VoidCallback? onLoginSuccess,
    required Function showProgress,
    required Function hideProgress,
  }) async {
    /// Log in with Google and get the user ID.
    final userCredential = await ServiceAuthentication().loginWithGoogle();

    if (userCredential != null) {
      googleEmail = userCredential.user?.email;
      onLoginSuccess?.call();
      log("Google User ID: $googleEmail");

      /// Storing user information in local storage.
      await serviceLocalStorage.setString('googleEmail', googleEmail!);
      log("Google user information has been saved.");
    } else {
      log("Login with Google failed.");
    }
  }
}
