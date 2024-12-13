import 'dart:developer';

import 'package:word_prime/export.dart';

class UpdatePostViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;
  final PostModel? currentPostModel;

  late ValueNotifier<PostModel?> updatePostModelNotifier;
  UpdatePostViewModel(
    this.currentUserNotifier,
    this.currentPostModel,
  ) {
    updatePostModelNotifier = ValueNotifier(currentPostModel?.copyWith());
  }

  ValueNotifier<String> turkishWordInput = ValueNotifier('');
  ValueNotifier<String> englishWordInput = ValueNotifier('');
  ValueNotifier<String> turkishSentencesInput = ValueNotifier('');
  ValueNotifier<String> englishSentencesInput = ValueNotifier('');

  ValueNotifier<List<String>?> turkishSentences = ValueNotifier([]);
  ValueNotifier<List<String>?> englishSentences = ValueNotifier([]);

  bool isEmptyInputText() {
    if (turkishWordInput.value.isEmpty &&
        englishWordInput.value.isEmpty &&
        turkishSentencesInput.value.isEmpty &&
        englishSentencesInput.value.isEmpty) return true;
    return false;
  }

  Future<bool> updatePost() async {
    if (turkishWordInput.value.isNotEmpty)
      updatePostModelNotifier.value = updatePostModelNotifier.value?.copyWith(
        wordTurkish: turkishWordInput.value,
      );
    if (englishWordInput.value.isNotEmpty)
      updatePostModelNotifier.value = updatePostModelNotifier.value?.copyWith(
        wordEnglish: englishWordInput.value,
      );
    if (turkishSentencesInput.value.isNotEmpty)
      updatePostModelNotifier.value = updatePostModelNotifier.value?.copyWith(
        sentenceTurkish: ['${turkishSentencesInput.value}'],
      );
    if (englishSentencesInput.value.isNotEmpty)
      updatePostModelNotifier.value = updatePostModelNotifier.value?.copyWith(
        sentenceEnglish: ['${englishWordInput.value}'],
      );
    isEmptyInputText()
        ? null
        : updatePostModelNotifier.value =
            updatePostModelNotifier.value?.copyWith(
            updatedDate: Timestamp.now(),
          );
    log('${currentPostModel?.postId}');

    return await PostRepository().postUpdate(
      model: updatePostModelNotifier.value,
      docId: currentPostModel?.postId,
    );
  }
}
