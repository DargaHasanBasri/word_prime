import 'package:word_prime/export.dart';

class MyProfileDetailsProvider extends StatelessWidget {
  const MyProfileDetailsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProfileDetailsViewModel(),
      child: const MyProfileDetailsPage(),
    );
  }
}
