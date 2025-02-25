import 'package:word_prime/export.dart';

class LevelSelection extends StatelessWidget {
  final String iconAddress;
  final String levelTitle;
  final VoidCallback onTapResult;
  final Color backgroundColor;
  final Color? iconColor;
  const LevelSelection({
    super.key,
    required this.iconAddress,
    required this.levelTitle,
    required this.onTapResult,
    required this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
        padding: AppPaddings.paddingMediumHorizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: AppPaddings.paddingSmallAll,
              child: Image.asset(
                iconAddress,
                width: 50,
                height: 50,
                color: iconColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: AppPaddings.appPaddingHorizontal,
                child: CustomButton(
                  title:
                      LocaleKeys.quizAnalysis_buttonTitle.locale.toUpperCase(),
                  borderRadius: 12,
                  titleVerticalPadding: 4,
                  backgroundColor: Colors.transparent,
                  borderColor: AppColors.white,
                  onClick: () => onTapResult.call(),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Text(
                levelTitle,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 22,
                      color: AppColors.white,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
