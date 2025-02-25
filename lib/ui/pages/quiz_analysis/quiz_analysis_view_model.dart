import 'dart:math';
import 'package:word_prime/export.dart';

/// ViewModel class that manages the Quiz Analysis page
class QuizAnalysisViewModel extends BaseViewModel {
  /// Notifier that stores quiz analysis data for UI
  final ValueNotifier<List<QuizAnalysisModel?>> analysisNotifier =
      ValueNotifier([]);

  /// Notifier that stores test analysis data received from firebase
  final ValueNotifier<String> chartTitleNotifier = ValueNotifier("");

  /// List representing the days of the week
  final List<String> weekDays = [
    WeekDay.mon.localizedText,
    WeekDay.tue.localizedText,
    WeekDay.wed.localizedText,
    WeekDay.thu.localizedText,
    WeekDay.fri.localizedText,
    WeekDay.sat.localizedText,
    WeekDay.sun.localizedText,
  ];

  /// Quiz fetches analysis data and saves it in `analysisNotifier`.
  /// If the data is empty, a weekly empty list with 7 elements is assigned.
  Future<bool> fetchAnalysis({String? quizLevel}) async {
    final data = await QuizAnalysisRepository().fetchQuizAnalysis(
      quizLevel: quizLevel,
    );
    analysisNotifier.value = data.isNotEmpty ? data : List.filled(7, null);
    return data.isNotEmpty;
  }

  /// Returns weekly correct answer counts as a list using 'analysisNotifier'.
  List<double> getTotalCorrectList() {
    List<double> weeklyCorrectData = analysisNotifier.value
        .map((data) => data?.totalCorrect?.toDouble() ?? 0.0)
        .toList();
    return weeklyCorrectData;
  }

  /// Returns weekly wrong answer counts as a list using 'analysisNotifier'.
  List<double> getTotalWrongList() {
    List<double> weeklyWrongData = analysisNotifier.value
        .map((data) => data?.totalWrong?.toDouble() ?? 0.0)
        .toList();
    return weeklyWrongData;
  }

  /// Returns the highest total number of questions per week.
  /// Rounds the maximum value to a multiple of 5.
  double getMaxTotalQuestion() {
    List<double> weeklyQuestionData = analysisNotifier.value
        .map((data) => data?.totalQuestion?.toDouble() ?? 0.0)
        .toList();
    double maxTotalCorrect =
        weeklyQuestionData.isNotEmpty ? weeklyQuestionData.reduce(max) : 0.0;
    double maxValue = (maxTotalCorrect / 5).ceil() * 5.0;
    return maxValue;
  }
}
