import 'package:word_prime/export.dart';

class ResetPasswordProvider extends StatelessWidget {
  final String userEmail;
  const ResetPasswordProvider({
    super.key,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResetPasswordViewModel(userEmail),
      child: ResetPasswordPage(),
    );
  }
}
