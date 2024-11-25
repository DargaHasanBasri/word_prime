import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/my_word_list/components/interact_item.dart';

class AddedWordsListItem extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabChoice;
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
  });

  @override
  Widget build(BuildContext context) {
    final DateTime? dateTime = postModel?.createdDate?.toDateTime();
    return Container(
      padding: AppPaddings.appPaddingHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: Text(
              AppUtility().timeAgo(dateTime),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.paddingLargeRight,
                child: _getInteractItems(),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: AppPaddings.paddingMediumBottom,
                      child: _getPostPicture(),
                    ),
                    _getUserSentences(context),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getUserSentences(BuildContext context) {
    final ValueNotifier<bool> isTranslate = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: isTranslate,
      builder: (_, __, ___) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: AppPaddings.paddingSmallAll,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      postModel?.wordEnglish ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHigh,
                            fontWeight: FontWeight.w400,
                          ),
                      maxLines: 4,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.sizedBoxSmallWidth),
                GestureDetector(
                  onTap: () {
                    isTranslate.value = !isTranslate.value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cornflowerBlue),
                    ),
                    child: Image.asset(
                      width: AppSizes.appOverallIconWidth,
                      height: AppSizes.appOverallIconHeight,
                      color: Theme.of(context).colorScheme.secondary,
                      isTranslate.value
                          ? AppAssets.icArrowUpPath
                          : AppAssets.icArrowDownPath,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isTranslate.value,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 50,
                  top: 8,
                ),
                child: Container(
                  padding: AppPaddings.paddingSmallAll,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    postModel?.wordTurkish ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHigh,
                          fontWeight: FontWeight.w400,
                        ),
                    maxLines: 4,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _getPostPicture() {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            AppAssets.imgExampPostPath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _getInteractItems() {
    final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
    final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ValueListenableBuilder(
                valueListenable: isActiveLike,
                builder: (_, __, ___) {
                  return InteractItem(
                    onTap: () {
                      isActiveLike.value = !isActiveLike.value;
                      onTabLike.call();
                    },
                    iconAddress: isActiveLike.value
                        ? AppAssets.icActiveLikePath
                        : AppAssets.icInactiveLikePath,
                    interactCount: postModel?.totalLikes ?? 0,
                  );
                }),
            Padding(
              padding: AppPaddings.paddingMediumVertical,
              child: InteractItem(
                onTap: () => onTabComment.call(),
                iconAddress: AppAssets.icCommentPath,
                interactCount: postModel?.totalComments ?? 0,
              ),
            ),
            ValueListenableBuilder(
                valueListenable: isActiveSave,
                builder: (_, __, ___) {
                  return InteractItem(
                    onTap: () {
                      isActiveSave.value = !isActiveSave.value;
                      onTabSave..call();
                    },
                    iconAddress: isActiveSave.value
                        ? AppAssets.icActiveSavePath
                        : AppAssets.icInactiveSavePath,
                    interactCount: postModel?.totalSaves ?? 0,
                  );
                }),
          ],
        ),
        Padding(
          padding: AppPaddings.paddingMediumTop,
          child: GestureDetector(
            onTap: () => onTabChoice.call(),
            child: Image.asset(
              AppAssets.icChoicePath,
              width: AppSizes.appOverallIconWidth,
              height: AppSizes.appOverallIconHeight,
            ),
          ),
        ),
      ],
    );
  }
}
