import 'package:flutter/cupertino.dart';
import 'package:word_prime/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  /// Variable where I keep the change of the value of the isHaveObscure
  /// property in the text form field
  ValueNotifier<bool> isActive = ValueNotifier(true);

  /// Variables in which I store the changes of email and password
  /// values in the text form field
  ValueNotifier<String> emailInput = ValueNotifier('');
  ValueNotifier<String> passwordInput = ValueNotifier('');

  /// Check whether the contents of the email and password variables are empty
  bool isEmptyInputText() {
    if (emailInput.value.isEmpty || passwordInput.value.isEmpty) return true;
    return false;
  }
}
