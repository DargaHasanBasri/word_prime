import 'package:word_prime/export.dart';

class WordEnglishLevel extends StatelessWidget {
  final String englishLevelTitle;
  final String iconAddress;
  final Color? iconColor;
  final Color backgroundColor;
  final VoidCallback onTapLevel;

  const WordEnglishLevel({
    super.key,
    required this.englishLevelTitle,
    required this.onTapLevel,
    required this.iconAddress,
    required this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapLevel.call(),
      child: Container(
        height: AppSizes.englishLevelContainerHeight,
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
        child: Stack(
          children: [
            Padding(
              padding: AppPaddings.paddingSmallAll,
              child: Text(
                englishLevelTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.white,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: AppPaddings.paddingSmallAll,
                child: Image.asset(
                  iconAddress,
                  width: AppSizes.wordLevelIconWidth,
                  height: AppSizes.wordLevelIconHeight,
                  color: iconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
