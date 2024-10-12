import 'package:word_prime/export.dart';

class ActivityProvider extends StatelessWidget {
  const ActivityProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActivityViewModel(),
      child: ActivityPage(),
    );
  }
}
