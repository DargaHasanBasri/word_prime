import 'dart:developer';

import 'package:word_prime/export.dart';

class HomeViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> userNotifier;
  HomeViewModel(this.userNotifier);

  final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
  final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
  final ValueNotifier<bool> isActiveComment = ValueNotifier(false);
  final ValueNotifier<bool> isActiveTranslate = ValueNotifier(false);

  final ValueNotifier<List<PostModel?>?> postsNotifier = ValueNotifier(null);

  Future<void> getFetchPosts({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    try {
      showProgress.call();
      postsNotifier.value = await PostRepository().fetchPost();
      log('data fetched: ${postsNotifier.value}');
      hideProgress.call();
    } catch (e) {
      log('ViewModel An error occurred: $e');
    }
  }
}
