import 'package:word_prime/export.dart';

class QuizLevel extends StatelessWidget {
  final String englishLevelTitle;
  final String iconAddress;
  final Color? iconColor;
  final Color backgroundColor;
  final VoidCallback onTapStart;

  const QuizLevel({
    super.key,
    required this.englishLevelTitle,
    required this.onTapStart,
    required this.iconAddress,
    required this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: AppPaddings.paddingSmallAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  englishLevelTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 22,
                        color: AppColors.white,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(width: AppSizes.sizedBoxSmallWidth),
                Image.asset(
                  iconAddress,
                  width: AppSizes.wordQuizLevelIconWidth,
                  height: AppSizes.wordQuizLevelIconHeight,
                  color: iconColor,
                ),
              ],
            ),
            Padding(
              padding: AppPaddings.paddingSmallBottom,
              child: CustomButton(
                title: LocaleKeys.start.locale.toUpperCase(),
                borderRadius: 16,
                titleVerticalPadding: 8,
                backgroundColor: Colors.transparent,
                borderColor: AppColors.white,
                onClick: () => onTapStart.call(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
