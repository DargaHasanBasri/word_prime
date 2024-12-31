import 'package:word_prime/export.dart';

class QuizSelectionProvider extends StatelessWidget {
  final String quizType;
  final ValueNotifier<UserModel?> currentUserNotifier;

  const QuizSelectionProvider({
    super.key,
    required this.quizType,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizSelectionViewModel(
        quizType,
        currentUserNotifier,
      ),
      child: QuizSelectionPage(),
    );
  }
}
