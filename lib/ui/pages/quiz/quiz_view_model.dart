import 'dart:async';
import 'package:word_prime/base/repository/quiz_repository.dart';
import 'package:word_prime/export.dart';

class QuizViewModel extends BaseViewModel {
  final String quizType;
  final String languageLevel;
  QuizViewModel(
    this.quizType,
    this.languageLevel,
  );

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<bool> isData = ValueNotifier(false);
  ValueNotifier<int> currentQuestionIndex = ValueNotifier(0);
  ValueNotifier<String?> selectedOption = ValueNotifier(null);
  ValueNotifier<List<QuestionModel?>?> questionNotifier = ValueNotifier(null);
  Timer? timer;
  ValueNotifier<int> seconds = ValueNotifier(AppLocaleConstants.MAX_SECONDS);

  Future<void> getQuiz({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    questionNotifier.value = await QuizRepository().fetchAddedWordsQuizByLevel(
      questionLevel: languageLevel,
    );
    questionNotifier.value?.length == 0
        ? isData.value = false
        : isData.value = true;
    hideProgress.call();
  }

  Future<void> nextClickAction() async {
    isLoading.value = true;
    await Future<void>.delayed(
      const Duration(milliseconds: 300),
      () {
        if (currentQuestionIndex.value <
            ((questionNotifier.value?.length ?? 0) - 1)) {
          resetTimer();
          startTimer();
          currentQuestionIndex.value++;
          selectedOption.value = null;
        }
      },
    );
    isLoading.value = false;
  }

  Future<bool> isLastQuestion() async {
    bool isLast =
        currentQuestionIndex.value + 1 == (questionNotifier.value?.length ?? 0);

    if (!isLast) {
      await nextClickAction();
      return false;
    } else {
      questionNotifier.value = null;
      selectedOption.value = null;
      timer?.cancel();
      return true;
    }
  }

  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(
        Duration(seconds: 1),
        (_) {
          if (seconds.value > 0) {
            seconds.value--;
          } else {
            stopTimer();
          }
        },
      );
    }
  }

  void resetTimer() => seconds.value = AppLocaleConstants.MAX_SECONDS;

  void stopTimer({bool reset = false}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
  }
}
