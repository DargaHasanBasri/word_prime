import 'package:word_prime/export.dart';

class LeaderboardProvider extends StatelessWidget {
  const LeaderboardProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LeaderboardViewModel(),
      child: LeaderboardPage(),
    );
  }
}
