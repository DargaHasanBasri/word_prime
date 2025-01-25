import 'dart:developer';
import 'package:word_prime/export.dart';

class MyWordListViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;
  final String englishLevel;
  MyWordListViewModel(this.currentUserNotifier, this.englishLevel);

  final ValueNotifier<bool> isSaved = ValueNotifier(false);
  final ValueNotifier<bool> isAddedItem = ValueNotifier(false);
  final ValueNotifier<bool> isSavedItem = ValueNotifier(false);
  final ValueNotifier<bool> isDeletedItem = ValueNotifier(false);

  final ValueNotifier<List<String?>?> likedPostsIdsNotifier =
      ValueNotifier(null);
  final ValueNotifier<List<String?>?> savedPostsIdsNotifier =
      ValueNotifier(null);

  final ValueNotifier<List<PostModel?>?> addedPostsNotifier =
      ValueNotifier(null);

  final ValueNotifier<List<PostModel?>?> savedPostsNotifier =
      ValueNotifier(null);

  final ValueNotifier<List<CommentModel?>?> commentsNotifier =
      ValueNotifier(null);

  Future<void> getAddedPosts() async {
    addedPostsNotifier.value = await PostRepository().fetchAddedPostsByQuery(
      userId: '${currentUserNotifier.value?.userId}',
      wordLevel: englishLevel,
    );
    log('data fetched addedPosts: ${addedPostsNotifier.value}');

    await getSavedPostIds();

    final List<PostModel?>? addPostList = addedPostsNotifier.value;

    if (addPostList != null && addPostList.length > 0) isAddedItem.value = true;
  }

  Future<void> getSavedPosts() async {
    try {
      savedPostsNotifier.value = await PostRepository().fetchSavedPostsByQuery(
        userId: '${currentUserNotifier.value?.userId}',
        wordLevel: englishLevel,
      );
      log('data fetched savedPosts: ${savedPostsNotifier.value}');

      await getLikedPostIds();

      final List<PostModel?>? savePostList = savedPostsNotifier.value;

      if (savePostList != null && savePostList.length > 0)
        isSavedItem.value = true;
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }

  Future<void> getLikedPostIds() async {
    try {
      likedPostsIdsNotifier.value =
          await PostRepository().fetchLikedOrSavedPostIds(
        subCollectionName: 'liked_posts',
        userId: currentUserNotifier.value?.userId,
      );
      log('data fetched liked list: ${likedPostsIdsNotifier.value}');
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }

  Future<void> getSavedPostIds() async {
    try {
      savedPostsIdsNotifier.value =
          await PostRepository().fetchLikedOrSavedPostIds(
        subCollectionName: 'saved_posts',
        userId: currentUserNotifier.value?.userId,
      );
      log('data fetched saved list: ${savedPostsIdsNotifier.value}');
    } catch (e) {
      log('ViewModel An error occurred: $e');
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

  Future<void> deleteUserPost({
    required String userPostId,
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    await PostRepository().deletePost(postId: userPostId);
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
    await getAddedPosts();
    await getSavedPosts();
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
    await getAddedPosts();
    await getSavedPosts();
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
}
