import 'package:word_prime/export.dart';

class ForgotPasswordMethodViewModel extends BaseViewModel {
  Future<bool> isEmptyUserEmail(String emailText) async {
    if (emailText.isNotEmpty) {
      await ServiceAuthentication().sendResetPasswordLink(emailText);
      return true;
    }
    return false;
  }
}
