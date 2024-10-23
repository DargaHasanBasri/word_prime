import 'package:word_prime/export.dart';

class ActivityItem extends StatelessWidget {
  final Color backgroundColor;
  final String titleEmoji;
  final String title;
  final int chapterCount;
  final bool isZeroChapterCount;
  final VoidCallback onTapStart;
  const ActivityItem({
    super.key,
    required this.backgroundColor,
    required this.titleEmoji,
    required this.title,
    required this.chapterCount,
    required this.onTapStart,
    required this.isZeroChapterCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.paddingMediumAll,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            titleEmoji,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: AppSizes.sizedBoxXSmallHeight),
          Container(
            height: AppSizes.activityItemTitleContainerHeight,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.white,
                  ),
              maxLines: 2,
            ),
          ),
          SizedBox(height: AppSizes.sizedBoxXSmallHeight),
          Visibility(
            visible: !isZeroChapterCount,
            child: Text(
              '${chapterCount} ${LocaleKeys.activityPage_chapter.locale}',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.white,
                  ),
            ),
          ),
          SizedBox(height: AppSizes.sizedBoxOverallHeight),
          CustomButton(
            title: LocaleKeys.start.locale,
            titleVerticalPadding: 8,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.white,
            onClick: () => onTapStart.call(),
          ),
        ],
      ),
    );
  }
}
