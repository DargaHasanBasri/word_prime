import 'package:word_prime/export.dart';

class EmailVerificationProvider extends StatelessWidget {
  final String userId;
  final String userEmail;
  const EmailVerificationProvider({
    super.key,
    required this.userId,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmailVerificationViewModel(userId, userEmail),
      child: EmailVerificationPage(),
    );
  }
}
