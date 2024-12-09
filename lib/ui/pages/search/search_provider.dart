import 'package:word_prime/export.dart';

class SearchProvider extends StatelessWidget {
  const SearchProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      child: SearchPage(),
    );
  }
}
