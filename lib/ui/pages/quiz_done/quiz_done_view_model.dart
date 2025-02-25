import 'package:word_prime/export.dart';

class QuizDoneViewModel extends BaseViewModel {
  /// Number of correct answers of the user as a result of the quiz.
  final int totalCorrect;

  /// Number of wrong answers of the user as a result of the quiz.
  final int totalWrong;

  /// Total time spent by the user as a result of the quiz (in seconds).
  final int totalElapsedTime;

  /// Quiz level solved by the user
  final String quizLevel;

  /// The user's total score.
  late final int totalScore;

  /// The user's success percentage.
  late final int successPercentage;

  /// The user's total number of questions.
  late final int totalQuestion;

  /// Constructor: Calculates quiz results.
  QuizDoneViewModel(
    this.totalCorrect,
    this.totalWrong,
    this.totalElapsedTime,
    this.quizLevel,
  ) {
    /// Calculates total quiz score.
    totalScore = totalCorrect * 2;

    /// Calculates the total number of questions.
    totalQuestion = totalCorrect + totalWrong;

    /// Calculates the success percentage.
    successPercentage = ((totalCorrect / totalQuestion) * 100).toInt();
  }

  /// Saves the quiz analysis to the database (FireStore).
  /// Two different analysis types are added: General analysis and daily analysis.
  Future<bool> quizAnalysis() async {
    final results = await Future.wait([
      QuizRepository().addCompletedQuizAnalysis(
        quizAnalysisModel: QuizAnalysisModel(
          quizDate: Timestamp.now(),
          quizLevel: quizLevel,
          successPercentage: successPercentage,
          totalCorrect: totalCorrect,
          totalElapsedTime: totalElapsedTime,
          totalQuestion: totalQuestion,
          totalScore: totalScore,
          totalWrong: totalWrong,
        ),
      ),
      QuizRepository().addCompletedQuizAnalysisDaily(
        quizAnalysisModel: QuizAnalysisModel(
          quizDate: Timestamp.now(),
          quizLevel: EnglishWordLevel.Mix.level,
          successPercentage: successPercentage,
          totalCorrect: totalCorrect,
          totalElapsedTime: totalElapsedTime,
          totalQuestion: totalQuestion,
          totalScore: totalScore,
          totalWrong: totalWrong,
        ),
      ),
    ]);

    /// Returns whether all operations were successful.
    return results.every((result) => result == true);
  }
}
