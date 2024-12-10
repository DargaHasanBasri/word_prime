import 'package:word_prime/export.dart';

class SearchProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  const SearchProvider({
    super.key,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(
        currentUserNotifier,
      ),
      child: SearchPage(),
    );
  }
}
