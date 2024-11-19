import 'dart:developer';
import 'package:word_prime/export.dart';

class RegisterViewModel extends BaseViewModel {
  /// Variable where I keep the change of the value of the isHaveObscure
  /// property in the text form field
  ValueNotifier<bool> isActive = ValueNotifier(true);

  /// Variables in which I store the changes of email-password-name
  /// values in the text form field
  ValueNotifier<String> nameInput = ValueNotifier('');
  ValueNotifier<String> emailInput = ValueNotifier('');
  ValueNotifier<String> passwordInput = ValueNotifier('');

  /// Check whether the contents of the email-password-name variables are empty
  bool isEmptyInputText() {
    return emailInput.value.isNotEmpty &&
        passwordInput.value.isNotEmpty &&
        nameInput.value.isNotEmpty;
  }

  /// It allows the user to register using their e-mail, password and other information.
  /// User information is sent to the 'register' method of the 'ServiceAuthentication' class as 'UserModel'.
  /// If the registration process is successful, the `onRegistrationSuccess` callback is invoked.
  /// If it fails, an error message is logged.
  ///
  /// Parameters:
  /// - [onRegistrationSuccess]: Callback to run when registration is successful.
  String? userId;
  Future<void> register({
    VoidCallback? onRegistrationSuccess,
    required Function showProgress,
    required Function hideProgress,
  }) async {
    try {
      showProgress();

      UserCredential? userCredential = await ServiceAuthentication().register(
        userModel: UserModel(
          email: emailInput.value,
          password: passwordInput.value,
          userName: nameInput.value,
          profileImageAddress: AppLocaleConstants.DEFAULT_PROFILE_PICTURE,
          emailVerification: false,
        ),
      );

      if (userCredential != null) {
        userId = userCredential.user!.uid;
        log("Success");
        onRegistrationSuccess?.call();
      }
    } catch (e) {
      log('An error occurred: $e');
    } finally {
      hideProgress();
    }
  }
}
