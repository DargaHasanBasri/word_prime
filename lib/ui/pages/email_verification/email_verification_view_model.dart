import 'dart:developer';
import 'package:word_prime/export.dart';

class EmailVerificationViewModel extends BaseViewModel {
  final String userId;
  final String userEmail;
  EmailVerificationViewModel(this.userId, this.userEmail);

  Future<void> resendEmailVerification({
    required Function showProgress,
    required Function hideProgress,
  }) async {
    try {
      showProgress();
      final User? currentUser = FirebaseAuth.instance.currentUser;
      await ServiceAuthentication().resendEmailVerificationLink(currentUser);
    } catch (e) {
      log('An error occurred: $e');
    } finally {
      hideProgress();
    }
  }

  Future<bool> checkEmailVerification() async {
    bool isSuccess = await ServiceAuthentication().checkEmailVerification();
    if (isSuccess) {
      try {
        await FirebaseCollections.users.reference
            .doc(userId)
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
