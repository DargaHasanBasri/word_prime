import 'package:word_prime/export.dart';

class TasksItem extends StatelessWidget {
  final Color backgroundColor;
  final String iconAddress;
  final String title;
  final int chapterCount;
  final VoidCallback onTapStart;
  const TasksItem({
    super.key,
    required this.backgroundColor,
    required this.iconAddress,
    required this.title,
    required this.chapterCount,
    required this.onTapStart,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconAddress,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
          SizedBox(height: AppSizes.sizedBoxSmallHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: AppSizes.sizedBoxSmallHeight),
                    Text(
                      '${chapterCount} ${LocaleKeys.tasksPage_chapter.locale}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSizes.sizedBoxMediumWidth),
              Expanded(
                child: Padding(
                  padding: AppPaddings.paddingMediumRight,
                  child: CustomButton(
                    title: LocaleKeys.start.locale,
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.white,
                    titleVerticalPadding: 8,
                    borderRadius: 40,
                    onClick: () => onTapStart.call(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
