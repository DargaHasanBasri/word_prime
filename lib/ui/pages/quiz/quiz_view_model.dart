import 'dart:async';
import 'package:word_prime/export.dart';

class QuizViewModel extends BaseViewModel {
  /// Keeps the type of quiz the user will solve
  final String quizType;

  /// Keeps the user selected English level.
  final String languageLevel;
  QuizViewModel(
    this.quizType,
    this.languageLevel,
  );

  /// bool notifier used to control the fade status during
  /// the transition between quiz questions.
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  /// int notifier kept to keep track of which quiz question the user is on currentQuestionIndex.
  ValueNotifier<int> currentQuestionIndex = ValueNotifier(0);

  /// String notifier that keeps the option selected by the user on selectedOption.
  ValueNotifier<String?> selectedOption = ValueNotifier(null);

  /// To show data retrieved from FireStore in UI, data is stored in 'questionNotifier'.
  ValueNotifier<List<QuestionModel?>?> questionNotifier = ValueNotifier(null);

  /// Timer object used to manage the time set for each question.
  Timer? timer;

  /// Notifier that keeps track of the maximum time set for a question.
  ValueNotifier<int> seconds = ValueNotifier(AppLocaleConstants.MAX_SECONDS);

  /// Variables that track correct and incorrect answers and total elapsed time
  ValueNotifier<int> totalCorrect = ValueNotifier(0);
  ValueNotifier<int> totalWrong = ValueNotifier(0);
  ValueNotifier<int> totalElapsedTime = ValueNotifier(0);

  /// Gets quiz data from FireStore.
  Future<void> getQuiz({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    questionNotifier.value = await QuizRepository().fetchAddedWordsQuizByLevel(
      questionLevel: languageLevel,
    );
    hideProgress.call();
  }

  /// Moving to the next question.
  Future<void> nextClickAction() async {
    /// 'isLoading.value' is set to true to cause a fade during the transition process.
    isLoading.value = true;
    await Future<void>.delayed(
      const Duration(milliseconds: 300),
      () {
        /// If there are still questions left, move on to the next question.
        if (currentQuestionIndex.value <
            ((questionNotifier.value?.length ?? 0) - 1)) {
          /// Reset timer.
          resetTimer();

          /// Start timer for new question.
          startTimer();

          /// increase currentQuestionIndex by one.
          currentQuestionIndex.value++;

          /// Reset selected answer.
          selectedOption.value = null;
        }
      },
    );

    /// When the transition is finished,
    /// 'isLoading.value' is set to false to terminate fading.
    isLoading.value = false;
  }

  /// Checks if it is in the last question
  Future<bool> isLastQuestion() async {
    /// It is questioned whether the currentQuestionIndex + 1 value is
    /// equal to the total number of questions.
    /// In the last question, bool variable is used for checking.
    bool isLast =
        currentQuestionIndex.value + 1 == (questionNotifier.value?.length ?? 0);

    if (!isLast) {
      /// If it is not the last question, move on to the next question.
      await nextClickAction();
      return false;
    } else {
      /// Clear all data if last question reached.
      questionNotifier.value = null;
      selectedOption.value = null;
      timer?.cancel();
      return true;
    }
  }

  /// Saves the reply transaction to FireStore.
  Future<void> answered({
    required String? questionId,
    required bool isTrue,
  }) async {
    await QuizRepository().questionAnswered(
      questionId: questionId,
      isTrue: isTrue,
    );
  }

  /// Starts the timer.
  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(
        Duration(seconds: 1),
        (_) {
          if (seconds.value > 0) {
            /// Decrease by one every second.
            seconds.value--;
          } else {
            /// Stop timer when time is up.
            stopTimer();
          }
        },
      );
    }
  }

  /// Reset timer to default time.
  void resetTimer() => seconds.value = AppLocaleConstants.MAX_SECONDS;

  /// Stops the timer.
  void stopTimer({bool reset = false}) {
    if (reset) {
      /// According to the control of the reset value, if it is true, it resets the timer.
      resetTimer();
    }

    /// If the reset value is false, the timer object is terminated.
    timer?.cancel();
  }
}
