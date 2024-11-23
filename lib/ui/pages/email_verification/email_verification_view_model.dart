import 'dart:developer';
import 'package:word_prime/export.dart';

class EmailVerificationViewModel extends BaseViewModel {
  /// Stores the user's email address and this information is
  /// displayed to the user in the UI
  final String userEmail;
  EmailVerificationViewModel(this.userEmail);

  /// Resends the email verification link to the user
  Future<void> resendEmailVerification({
    /// Function to initialize the loading indicator
    required VoidCallback showProgress,

    /// Function to stop the loading indicator
    required VoidCallback hideProgress,

    /// Function to display the error message
    required VoidCallback showErrorSnackBar,
  }) async {
    try {
      /// Call to start loading indicator
      showProgress.call();

      /// Existing user information is retrieved from Firebase Authentication
      final User? currentUser = FirebaseAuth.instance.currentUser;

      /// Email verification link is resent to the user
      await ServiceAuthentication().resendEmailVerificationLink(currentUser);
    } catch (e) {
      /// In case of error, the error log is written
      log('An error occurred: $e');
      showErrorSnackBar.call();
    } finally {
      /// Runs to turn off the loading indicator in all cases
      hideProgress.call();
    }
  }

  /// Checks the user's email verification status
  Future<bool> checkEmailVerification() async {
    /// User's email verification status is checked from Firebase
    bool isSuccess = await ServiceAuthentication().checkEmailVerification();
    User? _currentUser = FirebaseAuth.instance.currentUser;
    if (isSuccess && _currentUser != null) {
      /// If validation is successful, the user is updated in the database
      try {
        /// The user's unique document in Firestore is accessed
        /// The `email_verification` field is updated to `true`
        await FirebaseCollections.users.reference
            .doc(_currentUser.uid)
            .update({'email_verification': true});
        log('Email verification updated successfully');
      } catch (e) {
        log('Failed to update email verification: $e');
      }
      return true;
    } else {
      return false;
    }
  }
}
