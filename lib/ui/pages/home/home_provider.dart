import 'package:word_prime/export.dart';

class HomeProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> userNotifier;
  const HomeProvider({
    super.key,
    required this.userNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(userNotifier),
      child: HomePage(),
    );
  }
}
