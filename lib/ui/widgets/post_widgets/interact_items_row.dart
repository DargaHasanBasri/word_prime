import 'package:word_prime/export.dart';

class InteractItemsRow extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final VoidCallback onTabShare;
  final PostModel? postModel;
  const InteractItemsRow({
    super.key,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.postModel,
    required this.onTabShare,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
    final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: isActiveLike,
            builder: (_, __, ___) {
              return _interactItemRow(
                onTap: () {
                  isActiveLike.value = !isActiveLike.value;
                  onTabLike.call();
                },
                iconAddress: isActiveLike.value
                    ? AppAssets.icActiveLikePath
                    : AppAssets.icInactiveLikePath,
                interactCount: postModel?.totalLikes ?? 0,
                context: context,
              );
            }),
        Padding(
          padding: AppPaddings.paddingMediumHorizontal,
          child: _interactItemRow(
            onTap: () => onTabComment.call(),
            iconAddress: AppAssets.icCommentPath,
            interactCount: postModel?.totalComments ?? 0,
            context: context,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isActiveSave,
          builder: (_, __, ___) {
            return _interactItemRow(
              onTap: () {
                isActiveSave.value = !isActiveSave.value;
                onTabSave.call();
              },
              iconAddress: isActiveSave.value
                  ? AppAssets.icActiveSavePath
                  : AppAssets.icInactiveSavePath,
              interactCount: postModel?.totalSaves ?? 0,
              context: context,
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

  Widget _interactItemRow({
    required BuildContext context,
    required VoidCallback onTap,
    required String iconAddress,
    required int interactCount,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onTap.call(),
          child: Image.asset(
            iconAddress,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
        ),
        SizedBox(width: AppSizes.sizedBoxSmallWidth),
        Text(
          interactCount.formatCount(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
              ),
        ),
      ],
    );
  }
}
