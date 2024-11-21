import 'package:word_prime/export.dart';

class ProfileProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> userNotifier;
  const ProfileProvider({
    super.key,
    required this.userNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(userNotifier),
      child: ProfilePage(),
    );
  }
}
