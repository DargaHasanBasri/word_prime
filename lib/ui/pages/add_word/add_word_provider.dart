import 'package:word_prime/export.dart';

class AddWordProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  const AddWordProvider({
    super.key,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddWordViewModel(currentUserNotifier),
      child: AddWordPage(),
    );
  }
}
