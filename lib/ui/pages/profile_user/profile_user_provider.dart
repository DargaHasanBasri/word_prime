import 'package:word_prime/export.dart';

class ProfileUserProvider extends StatelessWidget {
  final String? userId;
  final ValueNotifier<UserModel?> currentUserNotifier;
  const ProfileUserProvider({
    super.key,
    required this.userId,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileUserViewModel(
        userId,
        currentUserNotifier,
      ),
      child: ProfileUserPage(),
    );
  }
}
