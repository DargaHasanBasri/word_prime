import 'package:word_prime/export.dart';

enum QuizType {
  Saved,
  Added;

  String get type {
    switch (this) {
      case QuizType.Saved:
        return LocaleKeys.quizSavedTitle.locale;
      case QuizType.Added:
        return LocaleKeys.quizAddedTitle.locale;
    }
  }
}
