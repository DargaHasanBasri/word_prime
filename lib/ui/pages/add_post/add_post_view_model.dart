import 'dart:developer';
import 'package:word_prime/export.dart';

class AddPostViewModel extends BaseViewModel {
  final String wordLevel;
  AddPostViewModel(
    this.wordLevel,
  );

  /// Variables in which I store the changes of turkishWord-turkishSentences and
  /// englishWord-englishSentences values in the text form field
  ValueNotifier<String> turkishWordInput = ValueNotifier('');
  ValueNotifier<String> englishWordInput = ValueNotifier('');
  ValueNotifier<String> turkishSentencesInput = ValueNotifier('');
  ValueNotifier<String> englishSentencesInput = ValueNotifier('');

  List<String>? turkishSentences = [
    'Manavdan armut al',
    'Mor renkli armut',
  ];
  List<String>? englishSentences = [
    'Buy pears from the grocery store',
    'Purple colored pear',
  ];

  /// Check whether the contents of the turkishWord and englishWord variables are empty
  bool isEmptyInputText() {
    if (turkishWordInput.value.isEmpty || englishWordInput.value.isEmpty)
      return true;
    return false;
  }

  Future<void> addNewPost({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
    required VoidCallback successAdded,
  }) async {
    try {
      showProgress.call();
      User? _currentUser = FirebaseAuth.instance.currentUser;
      if (_currentUser != null) {
        await PostRepository().addPost(
          PostModel(
            userId: _currentUser.uid,
            totalComments: 0,
            totalLikes: 0,
            totalSaves: 0,
            wordLevel: wordLevel,
            createdDate: Timestamp.now(),
            updatedDate: Timestamp.now(),
            wordEnglish: englishWordInput.value,
            wordTurkish: turkishWordInput.value,
            sentenceEnglish: englishSentences,
            sentenceTurkish: turkishSentences,
          ),
        );
      }
      successAdded.call();
    } catch (e) {
      log('ViewModel An error occurred: $e');
    } finally {
      hideProgress.call();
    }
  }
}
