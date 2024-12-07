import 'package:word_prime/export.dart';

class InteractItemsColumn extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabComment;
  final VoidCallback onTabSave;
  final PostModel? postModel;
  final bool? isLiked;
  final bool? isSaved;
  const InteractItemsColumn({
    super.key,
    required this.onTabLike,
    required this.onTabComment,
    required this.onTabSave,
    required this.postModel,
    required this.isLiked,
    required this.isSaved,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isActiveLike = ValueNotifier(isLiked ?? false);
    final ValueNotifier<bool> isActiveSave = ValueNotifier(isSaved ?? false);
    return Column(
      children: [
        ValueListenableBuilder(
            valueListenable: isActiveLike,
            builder: (_, __, ___) {
              return _interactItemColumn(
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
          padding: AppPaddings.paddingMediumVertical,
          child: _interactItemColumn(
            onTap: () => onTabComment.call(),
            iconAddress: AppAssets.icCommentPath,
            interactCount: postModel?.totalComments ?? 0,
            context: context,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isActiveSave,
          builder: (_, __, ___) {
            return _interactItemColumn(
              onTap: () {
                isActiveSave.value = !isActiveSave.value;
                onTabSave..call();
              },
              iconAddress: isActiveSave.value
                  ? AppAssets.icActiveSavePath
                  : AppAssets.icInactiveSavePath,
              interactCount: postModel?.totalSaves ?? 0,
              context: context,
            );
          },
        ),
      ],
    );
  }

  Widget _interactItemColumn({
    required BuildContext context,
    required VoidCallback onTap,
    required String iconAddress,
    required int interactCount,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTap.call(),
          child: Image.asset(
            iconAddress,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
        ),
        SizedBox(height: AppSizes.sizedBoxSmallHeight),
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
