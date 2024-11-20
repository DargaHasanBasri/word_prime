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

  /// Holds the user ID after successful login
  String? userId;
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
    try {
      /// Show progress indicator at the start of the login process
      showProgress.call();

      /// Firebase user login with provided email and password
      UserCredential? userCredential = await ServiceAuthentication().login(
        email: emailInput.value,
        password: passwordInput.value,
      );

      if (userCredential != null) {
        /// Retrieve the user ID from the UserCredential object
        userId = userCredential.user!.uid;

        /// Save the email and userId locally for future use
        await serviceLocalStorage.setString('email', emailInput.value);
        await serviceLocalStorage.setString('userId', userId!);
        log("email saved");

        /// Call the success callback after successful login
        onLoginSuccess.call();
        log("$userId");
      }
    } on FirebaseAuthException catch (e) {
      /// Handle specific FirebaseAuthExceptions
      if (e.code == 'user-not-found') {
        showErrorSnackBar(LocaleKeys.warningMessages_userNotFound.locale);
        log('An error occurred in ViewModel: $e');
      } else if (e.code == 'wrong-password') {
        showErrorSnackBar(LocaleKeys.warningMessages_wrongPassword.locale);
      }
    } catch (e) {
      log('An error occurred in ViewModel: $e');
      showErrorSnackBar(LocaleKeys.warningMessages_errorOccurred.locale);
    } finally {
      /// Ensure the progress indicator is hidden regardless of the outcome
      hideProgress.call();
    }
  }

  /// Complete login process with Google.
  /// If the login is successful, `onLoginSuccess` is called.
  String? googleUserId;
  String? googleEmail;
  Future<void> loginWithGoogle({
    VoidCallback? onLoginSuccess,
    required Function showProgress,
    required Function hideProgress,
  }) async {
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
