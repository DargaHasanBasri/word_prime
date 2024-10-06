import 'package:word_prime/export.dart';

class ForgotPasswordMethodViewModel extends BaseViewModel {
  final String whichMethod;
  ForgotPasswordMethodViewModel(this.whichMethod);

  ValueNotifier<String> whichTabBar = ValueNotifier('');
}
