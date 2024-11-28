import 'package:word_prime/export.dart';

class AddedWordsListItem extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabChoice;
  final VoidCallback onTabShare;
  final VoidCallback onTabTranslate;
  final PostModel? postModel;
  const AddedWordsListItem({
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
    final DateTime? createdDate = postModel?.createdDate?.toDateTime();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sharingTimeAndChoices(context, dateTime: createdDate),
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

  Widget _sharingTimeAndChoices(
    BuildContext context, {
    DateTime? dateTime,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${AppUtility().timeAgo(dateTime)} ${LocaleKeys.timeAgoMsg_added.locale}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        GestureDetector(
          onTap: () => onTabChoice.call(),
          child: Image.asset(
            AppAssets.icChoicePath,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
        ),
      ],
    );
  }
}
