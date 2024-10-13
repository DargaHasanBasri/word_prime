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
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.metallicBlue,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              '${userScore} ${LocaleKeys.score.locale}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.metallicBlue,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              border: Border.all(color: AppColors.gulGrey),
            ),
            child: Text(
              '${rankOrder}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
