import 'package:word_prime/export.dart';

class MyWordListProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;

  final String englishLevel;
  const MyWordListProvider({
    super.key,
    required this.currentUserNotifier,
    required this.englishLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyWordListViewModel(
        currentUserNotifier,
        englishLevel,
      ),
      child: MyWordListPage(),
    );
  }
}
