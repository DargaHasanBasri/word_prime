import 'package:word_prime/export.dart';

class MyWordListProvider extends StatelessWidget {
  final String englishLevel;
  const MyWordListProvider({
    super.key,
    required this.englishLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyWordListViewModel(englishLevel),
      child: MyWordListPage(),
    );
  }
}
