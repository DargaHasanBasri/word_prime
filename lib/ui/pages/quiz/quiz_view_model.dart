import 'dart:async';
import 'package:word_prime/export.dart';

class QuizViewModel extends BaseViewModel {
  final String quizType;
  final String languageLevel;
  QuizViewModel(
    this.quizType,
    this.languageLevel,
  );

  ValueNotifier<String> correctOption = ValueNotifier('APPLE');
  ValueNotifier<String?> selectedOption = ValueNotifier(null);

  Timer? timer;
  ValueNotifier<int> seconds = ValueNotifier(AppLocaleConstants.MAX_SECONDS);

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

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
  }
}
