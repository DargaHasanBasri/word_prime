import 'package:word_prime/export.dart';

class PostDetailViewModel extends BaseViewModel {
  final PostModel? currentPost;
  final ValueNotifier<UserModel?> currentUserNotifier;
  PostDetailViewModel(
    this.currentPost,
    this.currentUserNotifier,
  );

  final ValueNotifier<List<CommentModel?>?> commentsNotifier =
      ValueNotifier(null);

  Future<void> fetchPostComments({
    VoidCallback? showProgress,
    VoidCallback? hideProgress,
  }) async {
    showProgress?.call();
    commentsNotifier.value = await PostRepository().fetchPostComments(
      postId: currentPost?.postId,
    );
    hideProgress?.call();
  }

  Future<void> addNewComments({
    required String? comment,
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
  }) async {
    showProgress.call();
    await PostRepository().addComment(
      postId: currentPost?.postId,
      commentModel: CommentModel(
        commentText: comment,
        userId: currentUserNotifier.value?.userId,
        userName: currentUserNotifier.value?.userName,
        userProfileImage: currentUserNotifier.value?.profileImageAddress,
        totalLikes: 0,
        createdDate: Timestamp.now(),
      ),
    );
    await fetchPostComments();
    hideProgress.call();
  }

  Future<void> likedPost() async {
    await PostRepository().likePost(
      userId: currentUserNotifier.value?.userId,
      postId: currentPost?.postId,
      wordLevel: currentPost?.wordLevel,
    );
  }

  Future<void> savedPost() async {
    await PostRepository().savePost(
      userId: currentUserNotifier.value?.userId,
      postId: currentPost?.postId,
      wordLevel: currentPost?.wordLevel,
    );
  }
}
