import 'package:word_prime/export.dart';

class AddPostProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  final String wordLevel;
  const AddPostProvider({
    super.key,
    required this.currentUserNotifier,
    required this.wordLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPostViewModel(
        currentUserNotifier,
        wordLevel,
      ),
      child: const AddPostPage(),
    );
  }
}
