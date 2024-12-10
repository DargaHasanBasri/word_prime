import 'dart:developer';

import 'package:word_prime/export.dart';

class SearchViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;
  SearchViewModel(this.currentUserNotifier);

  ValueNotifier<List<UserModel?>?> userListNotifier = ValueNotifier(null);
  ValueNotifier<List<PostModel?>?> postListNotifier = ValueNotifier(null);
  ValueNotifier<bool> isSearch = ValueNotifier(false);

  Future<void> getUserByQuery({required String searchText}) async {
    userListNotifier.value = await UserRepository().fetchUserByQuery(
      searchText: searchText.toLowerCase(),
    );
    log('data: ${userListNotifier.value}');
  }

  Future<void> getWordByQuery({required String searchText}) async {
    postListNotifier.value = await PostRepository().fetchWordByQuery(
      searchText: searchText.toLowerCase(),
    );
    isSearch.value = true;
    log('data: ${postListNotifier.value}');
  }

  Future<void> getUserOrWordByQuery({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
    required String searchText,
  }) async {
    showProgress.call();
    await Future.wait([
      getUserByQuery(searchText: searchText),
      getWordByQuery(searchText: searchText),
    ]);
    hideProgress.call();
  }
}
