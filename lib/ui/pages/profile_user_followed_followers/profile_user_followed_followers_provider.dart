import 'package:word_prime/export.dart';

class ProfileUserFollowedFollowersProvider extends StatelessWidget {
  final bool isFollowedPage;
  final String userId;
  final ValueNotifier<UserModel?> currentUserNotifier;

  const ProfileUserFollowedFollowersProvider({
    super.key,
    required this.isFollowedPage,
    required this.userId,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileUserFollowedFollowersViewModel(
        isFollowedPage,
        userId,
        currentUserNotifier,
      ),
      child: ProfileUserFollowedFollowersPage(),
    );
  }
}
