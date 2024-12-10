import 'package:word_prime/export.dart';

class MyProfileFollowedFollowersProvider extends StatelessWidget {
  final bool isFollowedPage;
  final ValueNotifier<UserModel?> currentUserNotifier;

  const MyProfileFollowedFollowersProvider({
    super.key,
    required this.isFollowedPage,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileFollowedFollowersViewModel(
        isFollowedPage,
        currentUserNotifier,
      ),
      child: MyProfileFollowedFollowersPage(),
    );
  }
}
