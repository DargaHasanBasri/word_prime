import 'package:word_prime/export.dart';

class QuizProvider extends StatelessWidget {
  const QuizProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizViewModel(),
      child: QuizPage(),
    );
  }
}
