import 'package:word_prime/export.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: HomePage(),
    );
  }
}
