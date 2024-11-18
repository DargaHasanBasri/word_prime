import 'dart:developer';
import 'package:word_prime/export.dart';

class ForgotPasswordMethodViewModel extends BaseViewModel {
  Future<bool> processPasswordReset({
    required String email,
    required Function showProgress,
    required Function hideProgress,
  }) async {
    try {
      showProgress();

      if (email.isEmpty) {
        log('Email cannot be left blank.');
        return false;
      }

      await ServiceAuthentication().sendResetPasswordLink(email);

      return true;
    } catch (e) {
      log('An error occurred: $e');
      return false;
    } finally {
      hideProgress();
    }
  }
}
