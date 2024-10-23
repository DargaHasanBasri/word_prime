import 'package:word_prime/export.dart';

class TopThreeRankings extends StatelessWidget {
  final String profileImgAddress;
  final String userName;
  final int userScore;
  final double rankHeight;
  final int rankOrder;
  final bool? isFirst;
  const TopThreeRankings({
    super.key,
    this.isFirst,
    required this.profileImgAddress,
    required this.userName,
    required this.userScore,
    required this.rankHeight,
    required this.rankOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: rankHeight),
        Center(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              CustomUserCircleAvatar(
                borderPadding: 0,
                profileImgAddress: profileImgAddress,
              ),
              (isFirst ?? false)
                  ? Transform.translate(
                      offset: Offset(0, -16),
                      child: Image.asset(
                        AppAssets.icRankFirstPath,
                        width: AppSizes.appOverallIconWidth,
                        height: AppSizes.appOverallIconHeight,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
        Padding(
          padding: AppPaddings.paddingSmallVertical,
          child: Text(
            userName,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: AppPaddings.paddingSmallHorizontal,
          child: Container(
            padding: AppPaddings.paddingSmallHorizontal +
                AppPaddings.paddingXSmallVertical,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              '${userScore} ${LocaleKeys.score.locale}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.white,
                  ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              border: Border.all(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            child: Text(
              '${rankOrder}',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: 40,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
