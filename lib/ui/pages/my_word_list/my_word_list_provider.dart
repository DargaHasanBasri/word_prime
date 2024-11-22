import 'package:word_prime/export.dart';

class MyWordListProvider extends StatelessWidget {
  const MyWordListProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyWordListViewModel(),
      child: MyWordListPage(),
    );
  }
}
