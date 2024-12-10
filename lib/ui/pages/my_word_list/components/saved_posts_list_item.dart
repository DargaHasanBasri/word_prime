import 'package:word_prime/export.dart';

class SavedPostsListItem extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabChoice;
  final VoidCallback onTabShare;
  final VoidCallback onTabTranslate;
  final VoidCallback onTabUserProfile;
  final VoidCallback onTabPost;
  final PostModel? postModel;
  final bool? isLiked;
  const SavedPostsListItem({
    super.key,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.onTabTranslate,
    required this.postModel,
    required this.onTabChoice,
    required this.onTabShare,
    required this.onTabUserProfile,
    required this.onTabPost,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostUserInfo(
          postModel: postModel,
          onTabChoice: () => onTabChoice.call(),
          onTabUserProfile: () => onTabUserProfile.call(),
        ),
        postModel?.postImageAddress == null
            ? Padding(
                padding: AppPaddings.paddingMediumVertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostWithoutImage(
                      postModel: postModel,
                      onTabPost: () => onTabPost.call(),
                    ),
                    Padding(
                      padding: AppPaddings.paddingMediumTop,
                      child: InteractItemsRow(
                        isLiked: isLiked,
                        isSaved: true,
                        onTabLike: () => onTabLike.call(),
                        onTabComment: () => onTabComment.call(),
                        onTabSave: () => onTabSave.call(),
                        onTabShare: () => onTabShare.call(),
                        postModel: postModel,
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: AppPaddings.paddingMediumVertical,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: AppPaddings.paddingSmallHorizontal +
                          AppPaddings.paddingLargeRight,
                      child: InteractItemsColumn(
                        isLiked: isLiked,
                        isSaved: true,
                        onTabLike: () => onTabLike.call(),
                        onTabComment: () => onTabComment.call(),
                        onTabSave: () => onTabSave.call(),
                        postModel: postModel,
                      ),
                    ),
                    Expanded(
                      child: PostWithImage(
                        postModel: postModel,
                        onTabPost: () => onTabPost.call(),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
