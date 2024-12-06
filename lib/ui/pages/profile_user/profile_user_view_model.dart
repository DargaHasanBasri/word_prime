import 'dart:developer';
import 'package:word_prime/export.dart';

class ProfileUserViewModel extends BaseViewModel {
  final String? userId;
  final ValueNotifier<UserModel?> currentUserNotifier;
  ProfileUserViewModel(this.userId, this.currentUserNotifier);

  ValueNotifier<int> tabIndex = ValueNotifier(0);
  ValueNotifier<UserModel?> userNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> addedPostsNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> savedPostsNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> likedPostsNotifier = ValueNotifier(null);

  Future<void> getUserData() async {
    if (userId != null) {
      userNotifier.value = await UserRepository().fetchUser(userId!);
      log('User data fetched: ${userNotifier.value?.toJson()}');
    } else {
      log('userId : null');
    }
  }

  Future<void> getAddedPosts() async {
    if (userId != null) {
      addedPostsNotifier.value = await PostRepository().fetchAllAddedPosts(
        userId: userId!,
      );
      log('data fetched: ${addedPostsNotifier.value}');
    } else {
      log('userId : null');
    }
  }

  Future<void> getSavedPosts() async {
    if (userId != null) {
      savedPostsNotifier.value = await PostRepository().fetchAllSavedPosts(
        userId: userId!,
      );
      log('data fetched: ${savedPostsNotifier.value}');
    } else {
      log('userId : null');
    }
  }

  Future<void> getAddedAndSavedPosts({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    await Future.wait([
      getUserData(),
      getAddedPosts(),
      getSavedPosts(),
    ]);
    hideProgress.call();
  }
}
