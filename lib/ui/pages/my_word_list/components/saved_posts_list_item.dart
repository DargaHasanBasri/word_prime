import 'package:word_prime/export.dart';

class SavedPostsListItem extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabChoice;
  final VoidCallback onTabShare;
  final VoidCallback onTabTranslate;
  final PostModel? postModel;
  const SavedPostsListItem({
    super.key,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.onTabTranslate,
    required this.postModel,
    required this.onTabChoice,
    required this.onTabShare,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostUserInfo(
          postModel: postModel,
          onTabChoice: () => onTabChoice.call(),
        ),
        postModel?.postImageAddress == null
            ? Padding(
                padding: AppPaddings.paddingMediumVertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostWithoutImage(
                      postModel: postModel,
                    ),
                    Padding(
                      padding: AppPaddings.paddingMediumTop,
                      child: InteractItemsRow(
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
                        onTabLike: () => onTabLike.call(),
                        onTabComment: () => onTabComment.call(),
                        onTabSave: () => onTabSave.call(),
                        postModel: postModel,
                      ),
                    ),
                    Expanded(
                      child: PostWithImage(
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
