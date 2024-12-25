import 'package:word_prime/export.dart';

class QuizProvider extends StatelessWidget {
  final String quizType;
  final String languageLevel;
  const QuizProvider({
    super.key,
    required this.quizType,
    required this.languageLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizViewModel(
        quizType,
        languageLevel,
      ),
      child: QuizPage(),
    );
  }
}
