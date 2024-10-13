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
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: AppSizes.activityItemTitleContainerHeight,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
          SizedBox(height: 4),
          Visibility(
            visible: !isZeroChapterCount,
            child: Text(
              '${chapterCount} ${LocaleKeys.activityPage_chapter.locale}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 24),
          CustomButton(
            title: LocaleKeys.start.locale,
            titleVerticalPadding: 8,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.white,
            borderRadius: 40,
            onClick: () => onTapStart.call(),
          ),
        ],
      ),
    );
  }
}
