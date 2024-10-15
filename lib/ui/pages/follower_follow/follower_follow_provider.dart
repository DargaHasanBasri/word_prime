import 'package:word_prime/export.dart';

class FollowerFollowProvider extends StatelessWidget {
  final bool isFollow;
  const FollowerFollowProvider({
    super.key,
    required this.isFollow,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FollowerFollowViewModel(isFollow),
      child: FollowerFollowPage(),
    );
  }
}
