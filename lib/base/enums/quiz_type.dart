import 'package:word_prime/export.dart';

/// QuizType is an enum class that represents quiz types.
enum QuizType {
  Saved,
  Added;

  /// A title is returned depending on the quiz type.
  String get type {
    switch (this) {
      case QuizType.Saved:

        /// Returns the title text for saved quizzes.
        return LocaleKeys.quizSavedTitle.locale;
      case QuizType.Added:

        /// Returns the title text for added quizzes.
        return LocaleKeys.quizAddedTitle.locale;
    }
  }
}
