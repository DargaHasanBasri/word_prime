import 'dart:developer';
import 'package:word_prime/export.dart';

class HomeViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;
  HomeViewModel(this.currentUserNotifier);

  final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
  final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
  final ValueNotifier<bool> isActiveComment = ValueNotifier(false);
  final ValueNotifier<bool> isActiveTranslate = ValueNotifier(false);

  final ValueNotifier<List<PostModel?>?> postsNotifier = ValueNotifier(null);
  final ValueNotifier<List<String?>?> likedPostsNotifier = ValueNotifier(null);
  final ValueNotifier<List<String?>?> savedPostsNotifier = ValueNotifier(null);
  final ValueNotifier<List<CommentModel?>?> commentsNotifier =
      ValueNotifier(null);

  Future<void> getFetchPosts({
    required VoidCallback? showProgress,
    required VoidCallback? hideProgress,
  }) async {
    try {
      showProgress?.call();
      postsNotifier.value = await PostRepository().fetchPost();
      log('data fetched: ${postsNotifier.value}');
      await getLikedPostIds();
      await getSavedPostIds();
      hideProgress?.call();
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }

  Future<void> getLikedPostIds() async {
    try {
      likedPostsNotifier.value =
          await PostRepository().fetchLikedOrSavedPostIds(
        subCollectionName: 'liked_posts',
        userId: currentUserNotifier.value?.userId,
      );
      log('data fetched liked list: ${likedPostsNotifier.value}');
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }

  Future<void> getSavedPostIds() async {
    try {
      savedPostsNotifier.value =
          await PostRepository().fetchLikedOrSavedPostIds(
        subCollectionName: 'saved_posts',
        userId: currentUserNotifier.value?.userId,
      );
      log('data fetched saved list: ${savedPostsNotifier.value}');
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }

  Future<void> addNewComments({
    required String? postId,
    required String? comment,
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    await PostRepository().addComment(
      postId: postId,
      commentModel: CommentModel(
        commentText: comment,
        userId: currentUserNotifier.value?.userId,
        userName: currentUserNotifier.value?.userName,
        userProfileImage: currentUserNotifier.value?.profileImageAddress,
        totalLikes: 0,
        createdDate: Timestamp.now(),
      ),
    );
    hideProgress.call();
  }

  Future<void> fetchPostComments({
    required String? postId,
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    commentsNotifier.value = await PostRepository().fetchPostComments(
      postId: postId,
    );
    hideProgress.call();
  }

  Future<void> likedPost({
    required String? postId,
    required String? wordLevel,
  }) async {
    await PostRepository().likePost(
      userId: currentUserNotifier.value?.userId,
      postId: postId,
      wordLevel: wordLevel,
    );
    getFetchPosts(
      showProgress: () {},
      hideProgress: () {},
    );
  }

  Future<void> savedPost({
    required String? postId,
    required String? wordLevel,
  }) async {
    await PostRepository().savePost(
      userId: currentUserNotifier.value?.userId,
      postId: postId,
      wordLevel: wordLevel,
    );
    getFetchPosts(
      showProgress: () {},
      hideProgress: () {},
    );
  }
}
