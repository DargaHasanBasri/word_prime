import 'package:word_prime/export.dart';

class ProfileDetailsViewModel extends BaseViewModel {
  /// Variable where I keep the change of the value of the isHaveObscure
  /// property in the text form field
  ValueNotifier<bool> isActive = ValueNotifier(true);

  /// Variables in which I store the changes of fullName-email-password
  /// values in the text form field
  ValueNotifier<String> fullNameInput = ValueNotifier('');
  ValueNotifier<String> emailInput = ValueNotifier('');
  ValueNotifier<String> passwordInput = ValueNotifier('');

  /// Check whether the contents of the fullName-email-password variables are empty
  bool isEmptyInputText() {
    if (fullNameInput.value.isEmpty ||
        emailInput.value.isEmpty ||
        passwordInput.value.isEmpty) return true;
    return false;
  }
}
