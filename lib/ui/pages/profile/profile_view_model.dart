import 'dart:developer';

import 'package:word_prime/export.dart';

class ProfileViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;
  ProfileViewModel(this.currentUserNotifier);

  ValueNotifier<int> tabIndex = ValueNotifier(0);
  ValueNotifier<List<PostModel?>?> addedPostsNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> savedPostsNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> likedPostsNotifier = ValueNotifier(null);

  Future<void> getAddedPosts() async {
    User? _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null) {
      addedPostsNotifier.value = await PostRepository().fetchAllAddedPosts(
        userId: _currentUser.uid,
      );
      log('data fetched: ${addedPostsNotifier.value}');
    } else {
      log('currentUser : null');
    }
  }

  Future<void> getSavedPosts() async {
    User? _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null) {
      savedPostsNotifier.value = await PostRepository().fetchAllSavedPosts(
        userId: _currentUser.uid,
      );
      log('data fetched: ${savedPostsNotifier.value}');
    } else {
      log('currentUser : null');
    }
  }

  Future<void> getAddedAndSavedPosts({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    await Future.wait([
      getAddedPosts(),
      getSavedPosts(),
    ]);
    hideProgress.call();
  }
}
