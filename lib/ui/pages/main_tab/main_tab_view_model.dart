import 'dart:developer';

import 'package:word_prime/export.dart';

class MainTabViewModel extends BaseViewModel {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  ValueNotifier<UserModel?> userNotifier = ValueNotifier(null);

  Future<void> getUserData({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    try {
      showProgress.call();
      User? _currentUser = FirebaseAuth.instance.currentUser;
      if (_currentUser != null) {
        userNotifier.value = await UserRepository().fetchUser(_currentUser.uid);
        log('User data fetched: ${userNotifier.value?.toJson()}');
      }
    } catch (e) {
      log('ViewModel An error occurred while retrieving user data: $e');
    } finally {
      hideProgress.call();
    }
  }
}
