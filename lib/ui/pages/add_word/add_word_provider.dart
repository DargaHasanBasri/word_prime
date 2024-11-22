import 'package:word_prime/export.dart';

class AddWordProvider extends StatelessWidget {
  const AddWordProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddWordViewModel(),
      child: AddWordPage(),
    );
  }
}
