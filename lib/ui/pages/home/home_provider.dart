import 'package:word_prime/export.dart';

class HomeProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  const HomeProvider({
    super.key,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(currentUserNotifier),
      child: HomePage(),
    );
  }
}
