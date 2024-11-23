import 'package:word_prime/export.dart';

class EmailVerificationProvider extends StatelessWidget {
  final String userEmail;
  const EmailVerificationProvider({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmailVerificationViewModel(userEmail),
      child: EmailVerificationPage(),
    );
  }
}
