import 'package:word_prime/export.dart';

class ProfileUserDetailsProvider extends StatelessWidget {
  final String? userId;
  final ValueNotifier<UserModel?> currentUserNotifier;
  const ProfileUserDetailsProvider({
    super.key,
    required this.userId,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileUserDetailsViewModel(
        userId,
        currentUserNotifier,
      ),
      child: ProfileUserDetailsPage(),
    );
  }
}
