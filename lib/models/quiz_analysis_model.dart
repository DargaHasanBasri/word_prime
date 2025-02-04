import 'package:equatable/equatable.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/base/base_model.dart';

class QuizAnalysisModel extends BaseModel<QuizAnalysisModel>
    with EquatableMixin {
  String? analysisId;
  Timestamp? quizDate;
  int? totalCorrect;
  int? totalWrong;
  int? totalElapsedTime;
  int? totalScore;
  int? totalQuestion;
  int? successPercentage;
  String? quizLevel;

  QuizAnalysisModel({
    this.analysisId,
    this.quizDate,
    this.totalCorrect,
    this.totalWrong,
    this.totalElapsedTime,
    this.totalScore,
    this.totalQuestion,
    this.successPercentage,
    this.quizLevel,
  });

  @override
  List<Object?> get props => [
        analysisId,
        quizDate,
        totalCorrect,
        totalWrong,
        totalElapsedTime,
        totalScore,
        totalQuestion,
        successPercentage,
        quizLevel
      ];

  QuizAnalysisModel copyWith({
    String? analysisId,
    Timestamp? quizDate,
    int? totalCorrect,
    int? totalWrong,
    int? totalElapsedTime,
    int? totalScore,
    int? totalQuestion,
    int? successPercentage,
    String? quizLevel,
  }) {
    return QuizAnalysisModel(
      analysisId: analysisId ?? this.analysisId,
      quizDate: quizDate ?? this.quizDate,
      totalCorrect: totalCorrect ?? this.totalCorrect,
      totalWrong: totalWrong ?? this.totalWrong,
      totalElapsedTime: totalElapsedTime ?? this.totalElapsedTime,
      totalScore: totalScore ?? this.totalScore,
      totalQuestion: totalQuestion ?? this.totalQuestion,
      successPercentage: successPercentage ?? this.successPercentage,
      quizLevel: quizLevel ?? this.quizLevel,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'analysis_id': analysisId,
      'quiz_date': quizDate,
      'total_correct': totalCorrect,
      'total_wrong': totalWrong,
      'total_elapsed_time': totalElapsedTime,
      'total_score': totalScore,
      'total_question': totalQuestion,
      'success_percentage': successPercentage,
      'quiz_level': quizLevel,
    };
  }

  @override
  QuizAnalysisModel fromJson(Map<String, dynamic> json) {
    return QuizAnalysisModel(
      analysisId: json['analysis_id'] as String?,
      quizDate: json['quiz_date'] as Timestamp?,
      totalCorrect: json['total_correct'] as int?,
      totalWrong: json['total_wrong'] as int?,
      totalElapsedTime: json['total_elapsed_time'] as int?,
      totalScore: json['total_score'] as int?,
      totalQuestion: json['total_question'] as int?,
      successPercentage: json['success_percentage'] as int?,
      quizLevel: json['quiz_level'] as String?,
    );
  }
}
