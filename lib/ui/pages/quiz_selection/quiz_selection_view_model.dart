import 'package:word_prime/base/repository/quiz_repository.dart';
import 'package:word_prime/export.dart';

class QuizSelectionViewModel extends BaseViewModel {
  final String quizType;
  final ValueNotifier<UserModel?> currentUserNotifier;
  QuizSelectionViewModel(this.quizType, this.currentUserNotifier);

  ValueNotifier<Map<String?, int>> levelCounts = ValueNotifier({});

  Future<void> newQuestionGeneration({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    final (success, counts) = await QuizRepository().newQuestionGeneration();
    levelCounts.value = counts;
    hideProgress.call();
  }
}
