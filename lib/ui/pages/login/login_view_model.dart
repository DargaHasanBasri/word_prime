import 'package:flutter/cupertino.dart';
import 'package:word_prime/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  /// Variable where I keep the change of the value of the isHaveObscure
  /// property in the text form field
  ValueNotifier<bool> isActive = ValueNotifier(true);
}
