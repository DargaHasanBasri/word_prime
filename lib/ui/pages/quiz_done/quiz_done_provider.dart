import 'package:word_prime/export.dart';

class QuizDoneProvider extends StatelessWidget {
  final int totalCorrect;
  final int totalWrong;
  final int totalElapsedTime;
  final String quizLevel;
  const QuizDoneProvider({
    super.key,
    required this.totalCorrect,
    required this.totalWrong,
    required this.totalElapsedTime,
    required this.quizLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizDoneViewModel(
        totalCorrect,
        totalWrong,
        totalElapsedTime,
        quizLevel,
      ),
      child: QuizDonePage(),
    );
  }
}
