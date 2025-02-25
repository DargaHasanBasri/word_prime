import 'package:word_prime/export.dart';

class MainTabProvider extends StatelessWidget {
  final int? tabIndex;
  const MainTabProvider({super.key, this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainTabViewModel(tabIndex),
      child: const MainTabPage(),
    );
  }
}
