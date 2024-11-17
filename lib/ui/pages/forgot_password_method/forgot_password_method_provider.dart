import 'package:word_prime/export.dart';

class ForgotPasswordMethodProvider extends StatelessWidget {
  const ForgotPasswordMethodProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordMethodViewModel(),
      child: ForgotPasswordMethodPage(),
    );
  }
}
