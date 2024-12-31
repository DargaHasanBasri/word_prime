import 'package:word_prime/export.dart';

class TimeUpProvider extends StatelessWidget {
  const TimeUpProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeUpViewModel(),
      child: TimeUpPage(),
    );
  }
}
