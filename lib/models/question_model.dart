import 'package:equatable/equatable.dart';
import 'package:word_prime/base/base_model.dart';

class QuestionModel extends BaseModel<QuestionModel> with EquatableMixin {
  String? questionId;
  String? questionWord;
  String? answerWord;
  String? questionImageAddress;
  String? questionLevel;
  bool? isAnswered;
  bool? isTrue;
  List<String?>? options;

  QuestionModel({
    this.questionId,
    this.questionWord,
    this.answerWord,
    this.questionImageAddress,
    this.questionLevel,
    this.isAnswered,
    this.isTrue,
    this.options,
  });

  @override
  List<Object?> get props => [
        questionId,
        questionWord,
        answerWord,
        questionImageAddress,
        questionLevel,
        isAnswered,
        isTrue,
        options
      ];

  QuestionModel copyWith({
    String? questionId,
    String? questionWord,
    String? answerWord,
    String? questionImageAddress,
    String? questionLevel,
    bool? isAnswered,
    bool? isTrue,
    List<String>? options,
  }) {
    return QuestionModel(
      questionId: questionId ?? this.questionId,
      questionWord: questionWord ?? this.questionWord,
      answerWord: answerWord ?? this.answerWord,
      questionImageAddress: questionImageAddress ?? this.questionImageAddress,
      questionLevel: questionLevel ?? this.questionLevel,
      isAnswered: isAnswered ?? this.isAnswered,
      isTrue: isTrue ?? this.isTrue,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'question_word': questionWord,
      'answer_word': answerWord,
      'question_image_address': questionImageAddress,
      'question_level': questionLevel,
      'is_answered': isAnswered,
      'is_true': isTrue,
      'options': options,
    };
  }

  @override
  QuestionModel fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionId: json['question_id'] as String?,
      questionWord: json['question_word'] as String?,
      answerWord: json['answer_word'] as String?,
      questionImageAddress: json['question_image_address'] as String?,
      questionLevel: json['question_level'] as String?,
      isAnswered: json['is_answered'] as bool?,
      isTrue: json['is_true'] as bool?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}
