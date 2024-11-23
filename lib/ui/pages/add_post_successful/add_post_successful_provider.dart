import 'package:word_prime/export.dart';

class AddPostSuccessfulProvider extends StatelessWidget {
  final String wordLevel;
  const AddPostSuccessfulProvider({
    super.key,
    required this.wordLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPostSuccessfulViewModel(wordLevel),
      child: const AddPostSuccessfulPage(),
    );
  }
}
