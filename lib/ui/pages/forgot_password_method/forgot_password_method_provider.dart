import 'package:word_prime/export.dart';

class ForgotPasswordMethodProvider extends StatelessWidget {
  final String whichMethod;
  const ForgotPasswordMethodProvider({
    super.key,
    required this.whichMethod,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordMethodViewModel(whichMethod),
      child: ForgotPasswordMethodPage(),
    );
  }
}
