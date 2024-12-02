import 'package:word_prime/export.dart';

class ProfileUserProvider extends StatelessWidget {
  const ProfileUserProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileUserViewModel(),
      child: ProfileUserPage(),
    );
  }
}
