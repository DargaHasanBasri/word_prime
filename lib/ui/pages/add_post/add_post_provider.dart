import 'package:word_prime/export.dart';

class AddPostProvider extends StatelessWidget {
  final String wordLevel;
  const AddPostProvider({super.key, required this.wordLevel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPostViewModel(wordLevel),
      child: const AddPostPage(),
    );
  }
}
