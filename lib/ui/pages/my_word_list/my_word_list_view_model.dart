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

  final ValueNotifier<List<PostModel?>?> addedPostsNotifier =
      ValueNotifier(null);

  Future<void> getAddedPosts({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    try {
      showProgress.call();
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
    } finally {
      hideProgress.call();
    }
  }
}
