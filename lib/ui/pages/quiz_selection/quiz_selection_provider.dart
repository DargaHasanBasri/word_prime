import 'package:word_prime/export.dart';

class QuizSelectionProvider extends StatelessWidget {
  final String quizType;
  const QuizSelectionProvider({
    super.key,
    required this.quizType,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizSelectionViewModel(quizType),
      child: QuizSelectionPage(),
    );
  }
}
