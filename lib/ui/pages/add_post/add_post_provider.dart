import 'package:word_prime/export.dart';

class AddPostProvider extends StatelessWidget {
  const AddPostProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPostViewModel(),
      child: const AddPostPage(),
    );
  }
}
