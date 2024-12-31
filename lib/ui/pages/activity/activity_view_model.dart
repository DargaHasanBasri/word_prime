import 'package:word_prime/export.dart';

class ActivityViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;

  ActivityViewModel(this.currentUserNotifier);
}
