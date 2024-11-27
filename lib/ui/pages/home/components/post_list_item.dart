import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/home/components/icon_interact_item.dart';

class PostListItem extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabShare;
  final VoidCallback onTabTranslate;
  final VoidCallback onTabChoice;

  const PostListItem({
    super.key,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.onTabShare,
    required this.onTabTranslate,
    required this.onTabChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getUserInfo(context),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: _getPostPicture(),
        ),
        Padding(
          padding: AppPaddings.paddingMediumBottom,
          child: _getUserSentences(context),
        ),
        _getInteractItems(),
      ],
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
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${LocaleKeys.level.locale}  10',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
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

  Widget _getUserSentences(BuildContext context) {
    final ValueNotifier<bool> isTranslate = ValueNotifier(false);
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
                  onTap: () {
                    isTranslate.value = !isTranslate.value;
                    onTabTranslate.call();
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
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            AppAssets.imgExampPostPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _getInteractItems() {
    final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
    final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isActiveLike,
          builder: (_, __, ___) {
            return IconInteractItem(
              onTap: () {
                isActiveLike.value = !isActiveLike.value;
                onTabLike.call();
              },
              iconAddress: isActiveLike.value
                  ? AppAssets.icActiveLikePath
                  : AppAssets.icInactiveLikePath,
              interactCount: '12',
            );
          },
        ),
        Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: IconInteractItem(
            onTap: () => onTabComment.call(),
            iconAddress: AppAssets.icCommentPath,
            interactCount: '12',
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isActiveSave,
          builder: (_, __, ___) {
            return IconInteractItem(
              onTap: () {
                isActiveSave.value = !isActiveSave.value;
                onTabSave..call();
              },
              iconAddress: isActiveSave.value
                  ? AppAssets.icActiveSavePath
                  : AppAssets.icInactiveSavePath,
              interactCount: '12',
            );
          },
        ),
        Spacer(),
        GestureDetector(
          onTap: () => onTabShare.call(),
          child: Image.asset(
            AppAssets.icSharePath,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
        ),
      ],
    );
  }
}
