import 'package:word_prime/export.dart';

class AddPostSuccessfulProvider extends StatelessWidget {
  const AddPostSuccessfulProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPostSuccessfulViewModel(),
      child: const AddPostSuccessfulPage(),
    );
  }
}
