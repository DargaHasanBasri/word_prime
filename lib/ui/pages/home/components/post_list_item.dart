import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/home/components/icon_interact_item.dart';

class PostListItem extends StatelessWidget {
  final ValueNotifier<bool> isActiveLike;
  final ValueNotifier<bool> isActiveSave;
  final ValueNotifier<bool> isTranslate;
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabTranslate;

  const PostListItem({
    super.key,
    required this.isActiveLike,
    required this.isActiveSave,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.isTranslate,
    required this.onTabTranslate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.paddingMediumAll,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.softPeach),
        ),
      ),
      child: Column(
        children: [
          _getUserInfo(),
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: _getPostPicture(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _getUserSentences(),
          ),
          ValueListenableBuilder(
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
        ],
      ),
    );
  }

  Widget _getUserInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomUserCircleAvatar(
          circleRadius: 20,
          borderPadding: 0,
          profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'X_AE_A-13',
                style: TextStyle(
                  color: AppColors.ebonyClay,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Level  10',
                style: TextStyle(
                  color: AppColors.riverBed,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
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

  Widget _getUserSentences() {
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
                      border: Border.all(color: AppColors.softPeach, width: 2),
                    ),
                    child: Text(
                      'Dolor morbi non arcu risus quis varius. sed nisi lacus sed viverra. Dolor morbi non arcu risus quis varius.',
                      style: TextStyle(
                        color: AppColors.ebonyClay,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => onTabTranslate.call(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cornflowerBlue),
                    ),
                    child: Image.asset(
                      isTranslate.value
                          ? AppAssets.icArrowUpPath
                          : AppAssets.icArrowDownPath,
                      width: AppSizes.appOverallIconWidth,
                      height: AppSizes.appOverallIconHeight,
                      color: AppColors.cornflowerBlue,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isTranslate.value,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 50, top: 8),
                child: Container(
                  padding: AppPaddings.paddingSmallAll,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.pastelBlue.withOpacity(0.8), width: 2),
                  ),
                  child: Text(
                    'Dolor morbi non arcu risus quis varius. sed nisi lacus sed viverra. Dolor morbi non arcu risus quis varius.',
                    style: TextStyle(
                      color: AppColors.ebonyClay,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
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
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            AppAssets.imgExampPostPath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _getInteractItems() {
    return Row(
      children: [
        IconInteractItem(
          onTap: () => onTabLike.call(),
          iconAddress: isActiveLike.value
              ? AppAssets.icActiveLikePath
              : AppAssets.icInactiveLikePath,
          interactCount: '12',
        ),
        Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: IconInteractItem(
            onTap: () => onTabComment.call(),
            iconAddress: AppAssets.icCommentPath,
            interactCount: '12',
          ),
        ),
        IconInteractItem(
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
