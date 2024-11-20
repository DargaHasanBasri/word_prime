import 'dart:developer';
import 'package:word_prime/export.dart';

class ForgotPasswordMethodViewModel extends BaseViewModel {
  ///  Variable in which I store the changes of email values in the text form field
  ValueNotifier<String> emailInput = ValueNotifier('');

  Future<void> processPasswordReset({
    /// Function to call when send link is successful
    required VoidCallback onSendLinkSuccess,

    /// Function to initialize the loading indicator
    required VoidCallback showProgress,

    /// Function to stop the loading indicator
    required VoidCallback hideProgress,

    /// Function to display the error message. Returns the error message
    required VoidCallback showErrorSnackBar,
  }) async {
    try {
      /// Call to start loading indicator
      showProgress.call();
      /// Sends a password reset link to the email address provided in 'emailInput.value'
      ///
      await ServiceAuthentication().sendResetPasswordLink(emailInput.value);

      /// Send link runs successful callback function
      onSendLinkSuccess.call();
    } catch (e) {
      log('An error occurred: $e');
      showErrorSnackBar.call();
    } finally {
      /// Runs to turn off the loading indicator in all cases
      hideProgress.call();
    }
  }
}
