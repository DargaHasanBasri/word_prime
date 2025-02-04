import 'package:word_prime/base/repository/quiz_repository.dart';
import 'package:word_prime/export.dart';

class ActivityViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;

  ActivityViewModel(this.currentUserNotifier);

  Future<bool> isAddedWords() async {
    final addedWordList = await QuizRepository().fetchAddedWords();
    return addedWordList.isEmpty;
  }
}
