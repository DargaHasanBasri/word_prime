import 'package:word_prime/export.dart';

class SearchPostInteractItems extends StatelessWidget {
  final VoidCallback onTabLike;
  final VoidCallback onTabSave;
  final PostModel? postModel;
  final bool? isLiked;
  final bool? isSaved;
  const SearchPostInteractItems({
    super.key,
    required this.onTabLike,
    required this.onTabSave,
    this.postModel,
    this.isLiked,
    this.isSaved,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isActiveLike = ValueNotifier(isLiked ?? false);
    final ValueNotifier<bool> isActiveSave = ValueNotifier(isSaved ?? false);
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
          },
        ),
        Padding(
          padding: AppPaddings.paddingMediumHorizontal,
          child: ValueListenableBuilder(
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
