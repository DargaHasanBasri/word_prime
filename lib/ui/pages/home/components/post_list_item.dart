import 'package:word_prime/export.dart';

class PostListItem extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabShare;
  final VoidCallback onTabTranslate;
  final VoidCallback onTabChoice;
  final VoidCallback onTabUserProfile;
  final PostModel? postModel;
  final bool? isLiked;
  final bool? isSaved;

  const PostListItem({
    super.key,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.onTabShare,
    required this.onTabTranslate,
    required this.onTabChoice,
    required this.postModel,
    required this.onTabUserProfile,
    required this.isLiked,
    required this.isSaved,
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
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              postModel?.postImageAddress == null
                  ? PostWithoutImage(
                      postModel: postModel,
                    )
                  : PostWithImage(
                      postModel: postModel,
                    ),
              Padding(
                padding: AppPaddings.paddingMediumTop,
                child: InteractItemsRow(
                  isLiked: isLiked,
                  isSaved: isSaved,
                  onTabLike: () {
                    onTabLike.call();
                  },
                  onTabComment: () => onTabComment.call(),
                  onTabSave: () => onTabSave.call(),
                  onTabShare: () => onTabShare.call(),
                  postModel: postModel,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
