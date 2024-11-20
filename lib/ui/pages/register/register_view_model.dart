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

  /// A variable is defined for the user ID
  String? userId;

  /// An async method is defined for user registration. This method invokes
  /// appropriate callback functions on success of registration or on error
  Future<void> register({
    /// Function to call when registration is successful
    required VoidCallback onRegistrationSuccess,

    /// Function to initialize the loading indicator
    required VoidCallback showProgress,

    /// Function to stop the loading indicator
    required VoidCallback hideProgress,

    /// Function to display the error message. Returns the error message
    required void Function(String message) showErrorSnackBar,
  }) async {
    try {
      /// Call to start loading indicator
      showProgress.call();

      /// Call `register` method from `ServiceAuthentication`
      /// class for user registration
      /// The necessary information for the user model is provided with UserModel
      UserCredential? userCredential = await ServiceAuthentication().register(
        userModel: UserModel(
          email: emailInput.value,
          password: passwordInput.value,
          userName: nameInput.value,

          /// Default profile photo
          profileImageAddress: AppLocaleConstants.DEFAULT_PROFILE_PICTURE,

          /// Email verification status (initially marked as unverified)
          emailVerification: false,
        ),
      );

      /// If user registration is successful, get user ID
      if (userCredential != null) {
        /// Get the user ID returned via Firebase
        userId = userCredential.user!.uid;
        log("Registration Successful");

        /// Register runs successful callback function
        onRegistrationSuccess.call();
      }
    } on FirebaseAuthException catch (e) {
      /// Special exceptions that may occur during
      /// Firebase authentication are caught.

      if (e.code == 'weak-password') {
        showErrorSnackBar(LocaleKeys.warningMessages_weakPassword.locale);
      } else if (e.code == 'email-already-in-use') {
        showErrorSnackBar(LocaleKeys.warningMessages_emailAlreadyUse.locale);
      } else if (e.code == 'invalid-email') {
        showErrorSnackBar(LocaleKeys.warningMessages_invalidEmail.locale);
      }
    } catch (e) {
      log('An error occurred in ViewModel: $e');
      showErrorSnackBar(LocaleKeys.warningMessages_errorOccurred.locale);
    } finally {
      /// Runs to turn off the loading indicator in all cases
      hideProgress.call();
    }
  }
}
