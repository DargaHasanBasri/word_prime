import 'package:word_prime/export.dart';

class QuizAnalysisProvider extends StatelessWidget {
  const QuizAnalysisProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizAnalysisViewModel(),
      child: const QuizAnalysisPage(),
    );
  }
}
