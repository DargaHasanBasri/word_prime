import 'package:word_prime/export.dart';

class QuizDoneViewModel extends BaseViewModel {
  final int totalCorrect;
  final int totalWrong;
  final int totalElapsedTime;
  final String quizLevel;

  late final int totalScore;
  late final int successPercentage;
  late final int totalQuestion;

  QuizDoneViewModel(
    this.totalCorrect,
    this.totalWrong,
    this.totalElapsedTime,
    this.quizLevel,
  ) {
    totalScore = totalCorrect * 2;
    totalQuestion = totalCorrect + totalWrong;
    successPercentage = ((totalCorrect / totalQuestion) * 100).toInt();
  }
}
