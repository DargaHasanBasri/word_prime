import 'package:word_prime/export.dart';

class ForgotPasswordProvider extends StatelessWidget {
  const ForgotPasswordProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordViewModel(),
      child: ForgotPasswordPage(),
    );
  }
}
