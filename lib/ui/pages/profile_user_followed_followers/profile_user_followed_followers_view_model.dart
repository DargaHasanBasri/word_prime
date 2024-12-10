import 'dart:developer';
import 'package:word_prime/export.dart';

class ProfileUserFollowedFollowersViewModel extends BaseViewModel {
  final bool isFollowedPage;
  final String userId;
  final ValueNotifier<UserModel?> currentUserNotifier;

  ProfileUserFollowedFollowersViewModel(
    this.isFollowedPage,
    this.userId,
    this.currentUserNotifier,
  );

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
    followedOrFollowersNotifier.value =
        await UserRepository().fetchFollowedAndFollower(
      userId: userId,
      isFollow: isFollowedPage,
    );
    hideProgress?.call();
    log('User data fetched: ${followedOrFollowersNotifier.value}');
  }

  Future<void> followUser({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
    required String? targetUserId,
  }) async {
    showProgress.call();
    await Future.wait([
      UserRepository().followUser(targetUserId: targetUserId),
      getFollowedUserIds(),
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
      getFollowedUserIds(),
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

  Future<void> getFollowedFollowerAndCheck({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    await Future.wait([
      getFollowedUserIds(),
      getFollowedAndFollower(
        showProgress: () {},
        hideProgress: () {},
      ),
    ]);
    hideProgress.call();
  }
}
