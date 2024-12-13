import 'package:word_prime/export.dart';

class UpdatePostProvider extends StatelessWidget {
  final ValueNotifier<UserModel?> currentUserNotifier;
  final PostModel? currentPostModel;

  const UpdatePostProvider({
    super.key,
    required this.currentUserNotifier,
    required this.currentPostModel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdatePostViewModel(
        currentUserNotifier,
        currentPostModel,
      ),
      child: UpdatePostPage(),
    );
  }
}
