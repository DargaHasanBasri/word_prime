import 'package:word_prime/export.dart';


class ProfileDetailsProvider extends StatelessWidget {
  const ProfileDetailsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileDetailsViewModel(),
      child: const ProfileDetailsPage(),
    );
  }
}
