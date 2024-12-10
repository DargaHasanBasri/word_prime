import 'package:word_prime/export.dart';


class MyProfileProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  const MyProfileProvider({
    super.key,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileViewModel(currentUserNotifier),
      child: MyProfilePage(),
    );
  }
}
