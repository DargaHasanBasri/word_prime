import 'package:word_prime/export.dart';

class ActivityProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  const ActivityProvider({super.key, required this.currentUserNotifier});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ActivityViewModel(currentUserNotifier),
      child: ActivityPage(),
    );
  }
}
