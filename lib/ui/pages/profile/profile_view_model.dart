import 'package:word_prime/export.dart';

class ProfileViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> userNotifier;
  ProfileViewModel(this.userNotifier);

  ValueNotifier<int> tabIndex = ValueNotifier(0);
}
