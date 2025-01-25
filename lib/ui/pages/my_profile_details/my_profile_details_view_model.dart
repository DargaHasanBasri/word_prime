import 'dart:developer';

import 'package:word_prime/export.dart';

class MyProfileDetailsViewModel extends BaseViewModel {
  /// Variable where I keep the change of the value of the isHaveObscure
  /// property in the text form field
  ValueNotifier<bool> isActive = ValueNotifier(true);

  /// Variables in which I store the changes of fullName-email-password
  /// values in the text form field
  ValueNotifier<String> fullNameInput = ValueNotifier('');
  ValueNotifier<String> emailInput = ValueNotifier('');

  ValueNotifier<UserModel?> userNotifier = ValueNotifier(null);

  /// Check whether the contents of the fullName-email-password variables are empty
  bool isEmptyInputText() {
    if (fullNameInput.value.isEmpty || emailInput.value.isEmpty) return true;
    return false;
  }

  Future<void> getUserDetails() async {
    try {
      User? _currentUser = FirebaseAuth.instance.currentUser;
      if (_currentUser != null) {
        userNotifier.value = await UserRepository().fetchUser(_currentUser.uid);
        log('User data fetched: ${userNotifier.value?.toJson()}');
        fullNameInput.value = userNotifier.value?.userName ?? '';
        emailInput.value = userNotifier.value?.email ?? '';
      }
    } catch (e) {
      log('ViewModel An error occurred while retrieving user data: $e');
    }
  }

  Future<void> processPasswordReset({
    required VoidCallback onSendLinkSuccess,
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
    required VoidCallback showErrorSnackBar,
  }) async {
    try {
      showProgress.call();
      await ServiceAuthentication().sendResetPasswordLink(emailInput.value);

      onSendLinkSuccess.call();
    } catch (e) {
      log('An error occurred: $e');
      showErrorSnackBar.call();
    } finally {
      hideProgress.call();
    }
  }
}
