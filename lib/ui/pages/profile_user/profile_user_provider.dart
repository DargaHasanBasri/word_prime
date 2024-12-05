import 'package:word_prime/export.dart';

class ProfileUserProvider extends StatelessWidget {
  final String? userId;
  const ProfileUserProvider({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileUserViewModel(userId),
      child: ProfileUserPage(),
    );
  }
}
