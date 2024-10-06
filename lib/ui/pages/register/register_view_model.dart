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
    if (emailInput.value.isEmpty ||
        passwordInput.value.isEmpty ||
        nameInput.value.isEmpty) return true;
    return false;
  }
}
