import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/my_word_list/components/interact_item.dart';

class ItemMyWordList extends StatelessWidget {
  final ValueNotifier<bool> isActiveLike;
  final ValueNotifier<bool> isActiveSave;
  final ValueNotifier<bool> isTranslate;
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabTranslate;
  const ItemMyWordList({
    super.key,
    required this.isActiveLike,
    required this.isActiveSave,
    required this.isTranslate,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.onTabTranslate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.paddingMediumAll,
      child: Column(
        children: [
          _getUserInfo(context),
          Padding(
            padding: AppPaddings.paddingMediumTop,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppPaddings.paddingLargeRight,
                  child: ValueListenableBuilder(
                    valueListenable: isActiveSave,
                    builder: (_, __, ___) {
                      return ValueListenableBuilder(
                        valueListenable: isActiveLike,
                        builder: (_, __, ___) {
                          return _getInteractItems();
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: AppPaddings.paddingMediumBottom,
                        child: _getUserSentences(context),
                      ),
                      _getPostPicture(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getUserInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomUserCircleAvatar(
          circleRadius: 20,
          borderPadding: 0,
          profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
        ),
        SizedBox(width: AppSizes.sizedBoxMediumWidth),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocaleConstants.DEFAULT_USER_NAME,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    ),
              ),
              Text(
                '${LocaleKeys.level.locale}  10',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
        Spacer(),
        Image.asset(
          AppAssets.icSharePath,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ],
    );
  }

  Widget _getUserSentences(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isTranslate,
      builder: (_, __, ___) {
        return Column(
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
                      AppLocaleConstants.DEFAULT_SENTENCES,
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
                  onTap: () => onTabTranslate.call(),
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
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    AppLocaleConstants.DEFAULT_SENTENCES,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InteractItem(
          onTap: () => onTabLike.call(),
          iconAddress: isActiveLike.value
              ? AppAssets.icActiveLikePath
              : AppAssets.icInactiveLikePath,
          interactCount: '12',
        ),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: InteractItem(
            onTap: () => onTabComment.call(),
            iconAddress: AppAssets.icCommentPath,
            interactCount: '12',
          ),
        ),
        InteractItem(
          onTap: () => onTabSave.call(),
          iconAddress: isActiveSave.value
              ? AppAssets.icActiveSavePath
              : AppAssets.icInactiveSavePath,
          interactCount: '12',
        ),
      ],
    );
  }
}
