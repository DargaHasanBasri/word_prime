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
    if (emailInput.value.isEmpty || passwordInput.value.isEmpty) return true;
    return false;
  }

  /// Allows the user to log in using their e-mail and password information.
  /// the `onLoginSuccess` callback is invoked. If login fails,
  /// an error message is logged.
  ///
  /// Parameters:
  /// - [onLoginSuccess]: Callback to be executed when login is successful.
  /// If the login is successful, the user ID is assigned to the `userId` variable
  String? userId;
  Future<void> login({VoidCallback? onLoginSuccess}) async {
    String? uid = await ServiceAuthentication().login(
      email: emailInput.value,
      password: passwordInput.value,
    );

    if (uid != null) {
      userId = uid;
      onLoginSuccess?.call();
      log("$userId");

      /// Stores the user's email and user ID in local storage when they log in.
      /// The `setString` method is used to save these values with the specified keys.
      await serviceLocalStorage.setString('email', emailInput.value);
      await serviceLocalStorage.setString('userId', userId!);
      log("email saved");
    } else {
      log("Login failed.");
    }
  }

  /// Complete login process with Google.
  /// If the login is successful, `onLoginSuccess` is called.
  String? googleUserId;
  String? googleEmail;
  Future<void> loginWithGoogle({VoidCallback? onLoginSuccess}) async {
    /// Log in with Google and get the user ID.
    final userCredential = await ServiceAuthentication().loginWithGoogle();

    if (userCredential != null) {
      googleUserId = userCredential.user?.uid;
      googleEmail = userCredential.user?.email;
      onLoginSuccess?.call();
      log("Google User ID: $googleUserId");
      log("Google User ID: $googleEmail");

      /// Storing user information in local storage.
      await serviceLocalStorage.setString('googleUserId', googleUserId!);
      await serviceLocalStorage.setString('googleEmail', googleEmail!);
      log("Google user information has been saved.");
    } else {
      log("Login with Google failed.");
    }
  }
}
