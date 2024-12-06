import 'package:word_prime/export.dart';

class PostDetailProvider extends StatelessWidget {
  final PostModel? currentPost;
  final ValueNotifier<UserModel?> currentUserNotifier;

  const PostDetailProvider({
    super.key,
    required this.currentPost,
    required this.currentUserNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostDetailViewModel(
        currentPost,
        currentUserNotifier,
      ),
      child: PostDetailPage(),
    );
  }
}
