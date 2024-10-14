import 'package:word_prime/export.dart';


class GetStartedProvider extends StatelessWidget {
  const GetStartedProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetStartedViewModel(),
      child: GetStartedPage(),
    );
  }
}
