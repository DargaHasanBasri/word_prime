import 'package:word_prime/export.dart';

class ProfileProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  const ProfileProvider({
    super.key,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(currentUserNotifier),
      child: ProfilePage(),
    );
  }
}
