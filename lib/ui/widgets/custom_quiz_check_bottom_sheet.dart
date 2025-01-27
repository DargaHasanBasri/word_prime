import 'package:word_prime/export.dart';

class CustomQuizCheckBottomSheet extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onTapNext;
  final String? correctAnswer;
  const CustomQuizCheckBottomSheet({
    super.key,
    required this.isCorrect,
    required this.onTapNext,
    this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCorrect ? AppColors.veryLightGreen : AppColors.lightRed,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.appPaddingHorizontal +
                AppPaddings.paddingMediumVertical,
            child: isCorrect
                ? correctAnswerContent(context)
                : wrongAnswerContent(context),
          ),
          Padding(
            padding: AppPaddings.appPaddingHorizontal +
                AppPaddings.paddingLargeBottom,
            child: GestureDetector(
              onTap: () => onTapNext.call(),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.iron,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: isCorrect
                          ? AppColors.greenishTeal
                          : AppColors.artyClickRed,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? AppColors.greenishTeal
                        : AppColors.artyClickRed,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Text(
                    LocaleKeys.next.locale.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget wrongAnswerContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.artyClickRed,
              radius: 16,
              child: Icon(
                Icons.close,
                color: AppColors.white,
              ),
            ),
            Padding(
              padding: AppPaddings.paddingSmallLeft,
              child: Text(
                LocaleKeys.wrongMsg.locale,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
        Padding(
          padding: AppPaddings.paddingSmallVertical,
          child: Text(
            '${LocaleKeys.correctAnswerMsg.locale} $correctAnswer',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }

  Widget correctAnswerContent(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.greenishTeal,
          radius: 16,
          child: Icon(
            Icons.check,
            color: AppColors.white,
          ),
        ),
        Padding(
          padding: AppPaddings.paddingSmallLeft,
          child: Text(
            LocaleKeys.congratulations.locale,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }
}
