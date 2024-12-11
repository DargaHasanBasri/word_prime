import 'dart:developer';

import 'package:word_prime/export.dart';

class MyProfileFollowedFollowersViewModel extends BaseViewModel {
  final bool isFollowedPage;
  final ValueNotifier<UserModel?> currentUserNotifier;

  MyProfileFollowedFollowersViewModel(
      this.isFollowedPage, this.currentUserNotifier);

  final ValueNotifier<bool> isFollowed = ValueNotifier(false);
  final ValueNotifier<List<UserModel?>?> followedOrFollowersNotifier =
      ValueNotifier(null);
  final ValueNotifier<List<String?>?> followedUserIdsNotifier =
      ValueNotifier(null);

  Future<void> getFollowedAndFollower({
    required VoidCallback? showProgress,
    required VoidCallback? hideProgress,
  }) async {
    showProgress?.call();
    getFollowedUserIds();
    followedOrFollowersNotifier.value =
        await UserRepository().fetchFollowedAndFollower(
      userId: currentUserNotifier.value?.userId,
      isFollow: isFollowedPage,
    );
    hideProgress?.call();
    log('fetched followed/followers user data: ${followedOrFollowersNotifier.value}');
  }

  Future<void> followUser({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
    required String? targetUserId,
  }) async {
    showProgress.call();
    await Future.wait([
      UserRepository().followUser(targetUserId: targetUserId),
      getFollowedAndFollower(
        showProgress: () {},
        hideProgress: () {},
      )
    ]);
    hideProgress.call();
  }

  Future<void> unFollowUser({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
    required String? targetUserId,
  }) async {
    showProgress.call();
    await Future.wait([
      UserRepository().unfollowUser(targetUserId: targetUserId),
      getFollowedAndFollower(
        showProgress: () {},
        hideProgress: () {},
      )
    ]);
    hideProgress.call();
  }

  Future<void> getFollowedUserIds() async {
    try {
      followedUserIdsNotifier.value =
          await UserRepository().fetchFollowedUserIds(
        targetUserId: currentUserNotifier.value?.userId,
      );
      log('fetched followed list: ${followedUserIdsNotifier.value}');
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }
}
