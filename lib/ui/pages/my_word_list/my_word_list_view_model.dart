import 'dart:developer';
import 'package:word_prime/export.dart';

class MyWordListViewModel extends BaseViewModel {
  final String englishLevel;
  MyWordListViewModel(this.englishLevel);

  final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
  final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
  final ValueNotifier<bool> isActiveComment = ValueNotifier(false);
  final ValueNotifier<bool> isActiveTranslate = ValueNotifier(false);
  final ValueNotifier<bool> isSaved = ValueNotifier(false);
  final ValueNotifier<bool> isAddedItem = ValueNotifier(false);
  final ValueNotifier<bool> isSavedItem = ValueNotifier(false);
  final ValueNotifier<bool> isDeletedItem = ValueNotifier(false);

  final ValueNotifier<List<PostModel?>?> addedPostsNotifier =
      ValueNotifier(null);

  final ValueNotifier<List<PostModel?>?> savedPostsNotifier =
      ValueNotifier(null);

  Future<void> getAddedPosts() async {
    try {
      User? _currentUser = FirebaseAuth.instance.currentUser;
      if (_currentUser != null) {
        addedPostsNotifier.value = await PostRepository().fetchAddedPosts(
          userId: _currentUser.uid,
          wordLevel: englishLevel,
        );
        log('data fetched: ${addedPostsNotifier.value}');

        final List<PostModel?>? addPostList = addedPostsNotifier.value;

        if (addPostList != null && addPostList.length > 0)
          isAddedItem.value = true;
      }
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }

  Future<void> getSavedPosts() async {
    try {
      User? _currentUser = FirebaseAuth.instance.currentUser;
      if (_currentUser != null) {
        savedPostsNotifier.value = await PostRepository().fetchSavedPosts(
          userId: _currentUser.uid,
          wordLevel: englishLevel,
        );
        log('data fetched savedPosts: ${savedPostsNotifier.value}');

        final List<PostModel?>? savePostList = savedPostsNotifier.value;

        if (savePostList != null && savePostList.length > 0)
          isSavedItem.value = true;
      }
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
}
