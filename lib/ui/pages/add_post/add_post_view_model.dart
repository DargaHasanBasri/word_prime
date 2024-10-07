import 'package:word_prime/export.dart';

class AddPostViewModel extends BaseViewModel {
  /// Variables in which I store the changes of turkishWord-turkishSentences and
  /// englishWord-englishSentences values in the text form field
  ValueNotifier<String> turkishWordInput = ValueNotifier('');
  ValueNotifier<String> englishWordInput = ValueNotifier('');
  ValueNotifier<String> turkishSentencesInput = ValueNotifier('');
  ValueNotifier<String> englishSentencesInput = ValueNotifier('');

  /// Check whether the contents of the turkishWord and englishWord variables are empty
  bool isEmptyInputText() {
    if (turkishWordInput.value.isEmpty || englishWordInput.value.isEmpty) return true;
    return false;
  }
}
