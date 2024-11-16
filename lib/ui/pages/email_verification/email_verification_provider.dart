import 'package:word_prime/export.dart';

class EmailVerificationProvider extends StatelessWidget {
  const EmailVerificationProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmailVerificationViewModel(),
      child: EmailVerificationPage(),
    );
  }
}
