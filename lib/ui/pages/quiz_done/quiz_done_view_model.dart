import 'package:word_prime/base/repository/quiz_repository.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/models/quiz_analysis_model.dart';

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

  Future<bool> quizAnalysis() async {
    final isSuccess = await QuizRepository().addCompletedQuizAnalysis(
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
    );

    return isSuccess;
  }
}
