import 'package:word_prime/export.dart';

class ActivityItem extends StatelessWidget {
  final Color backgroundColor;
  final String titleEmoji;
  final String title;
  final VoidCallback onTapEnter;
  const ActivityItem({
    super.key,
    required this.backgroundColor,
    required this.titleEmoji,
    required this.title,
    required this.onTapEnter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.paddingMediumAll,
      height: 200,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleEmoji,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: AppSizes.sizedBoxXSmallHeight),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.white,
                ),
                maxLines: 3,
              ),
            ],
          ),
          SizedBox(height: AppSizes.sizedBoxOverallHeight),
          CustomButton(
            title: 'ENTER',
            titleVerticalPadding: 6,
            borderRadius: 16,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.white,
            onClick: () => onTapEnter.call(),
          ),
        ],
      ),
    );
  }
}
