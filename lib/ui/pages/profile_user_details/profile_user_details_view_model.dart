import 'dart:developer';
import 'package:word_prime/export.dart';

class ProfileUserDetailsViewModel extends BaseViewModel {
  final String? userId;
  final ValueNotifier<UserModel?> currentUserNotifier;
  ProfileUserDetailsViewModel(this.userId, this.currentUserNotifier);

  ValueNotifier<int> tabIndex = ValueNotifier(0);
  ValueNotifier<UserModel?> userNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> addedPostsNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> savedPostsNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> likedPostsNotifier = ValueNotifier(null);
  ValueNotifier<bool> isFollowed = ValueNotifier(false);

  Future<void> getUserData() async {
    if (userId != null) {
      userNotifier.value = await UserRepository().fetchUser(userId);
      isFollowed.value = await UserRepository().isUserFollowed(userId);
      log('profile details User data fetched: ${userNotifier.value?.toJson()}\n');
    } else {
      log('userId : null');
    }
  }

  Future<void> getAddedPosts() async {
    if (userId != null) {
      addedPostsNotifier.value = await PostRepository().fetchAllAddedPosts(
        userId: userId!,
      );
      log('data addedPosts fetched: ${addedPostsNotifier.value}\n');
    } else {
      log('userId : null');
    }
  }

  Future<void> getSavedPosts() async {
    if (userId != null) {
      savedPostsNotifier.value = await PostRepository().fetchAllSavedPosts(
        userId: userId!,
      );
      log('data savedPosts fetched: ${savedPostsNotifier.value}\n');
    } else {
      log('userId : null');
    }
  }

  Future<void> getLikedPosts() async {
    if (userId != null) {
      likedPostsNotifier.value = await PostRepository().fetchAllLikedPosts(
        userId: userId!,
      );
      log('data likedPost fetched: ${likedPostsNotifier.value}\n');
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
      getLikedPosts(),
    ]);
    hideProgress.call();
  }

  Future<void> followUser({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    if (userId != null) {
      await Future.wait([
        UserRepository().followUser(targetUserId: userId),
        getUserData(),
      ]);
    } else {
      log('userId : null');
    }
    hideProgress.call();
  }

  Future<void> unFollowUser({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    if (userId != null) {
      await Future.wait([
        UserRepository().unfollowUser(targetUserId: userId),
        getUserData(),
      ]);
    } else {
      log('userId : null');
    }
    hideProgress.call();
  }
}
