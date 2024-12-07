import 'package:word_prime/export.dart';

class AddWordViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;
  AddWordViewModel(this.currentUserNotifier);
}
