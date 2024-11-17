import 'package:word_prime/export.dart';

class EmailVerificationViewModel extends BaseViewModel {
  final String userId;
  final String userEmail;
  EmailVerificationViewModel(this.userId, this.userEmail);

  Future<bool> checkEmailVerification() async {
    return await ServiceAuthentication().checkEmailVerification();
  }
}
