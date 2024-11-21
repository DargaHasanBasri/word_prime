import 'package:word_prime/export.dart';

class HomeViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> userNotifier;
  HomeViewModel(this.userNotifier);

  final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
  final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
  final ValueNotifier<bool> isActiveComment = ValueNotifier(false);
  final ValueNotifier<bool> isActiveTranslate = ValueNotifier(false);
}
