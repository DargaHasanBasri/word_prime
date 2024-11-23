import 'package:word_prime/export.dart';

class WordEnglishLevel extends StatelessWidget {
  final String englishLevelTitle;
  final VoidCallback onTapLevel;

  const WordEnglishLevel({
    super.key,
    required this.englishLevelTitle,
    required this.onTapLevel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapLevel.call(),
      child: Container(
        height: AppSizes.englishLevelContainerHeight,
        padding: AppPaddings.paddingSmallVertical +
            AppPaddings.paddingMediumHorizontal,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.10),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              englishLevelTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
