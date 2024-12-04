import 'package:word_prime/export.dart';

class ProfileDetailContainer extends StatelessWidget {
  final UserModel? userModel;
  final VoidCallback onTapWordButton;
  final VoidCallback onTapScoreButton;
  final VoidCallback onTapFollowButton;
  final VoidCallback onTapFollowerButton;
  const ProfileDetailContainer({
    super.key,
    required this.userModel,
    required this.onTapWordButton,
    required this.onTapScoreButton,
    required this.onTapFollowButton,
    required this.onTapFollowerButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          AppPaddings.paddingMediumVertical + AppPaddings.paddingMediumLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            offset: Offset(0, 8),
            blurRadius: 28,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileItem(
                  context,
                  detailTitle: LocaleKeys.word.locale,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.cornflowerBlue,
                  detailCount: userModel?.totalPost ?? 0,
                  onTap: () => onTapWordButton.call(),
                ),
                SizedBox(height: AppSizes.sizedBoxMediumHeight),
                _profileItem(
                  context,
                  detailTitle: LocaleKeys.level.locale,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.goldenDream,
                  detailCount: userModel?.totalScore ?? 0,
                  onTap: () => onTapScoreButton.call(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileItem(
                  context,
                  detailTitle: LocaleKeys.profilePage_follow.locale,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.greenishTeal,
                  detailCount: 0,
                  onTap: () => onTapFollowButton.call(),
                ),
                SizedBox(height: AppSizes.sizedBoxMediumHeight),
                _profileItem(
                  context,
                  detailTitle: LocaleKeys.profilePage_follower.locale,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.metallicBlue,
                  detailCount: 0,
                  onTap: () => onTapFollowerButton.call(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileItem(
    BuildContext context, {
    required String detailTitle,
    required String detailIcon,
    required Color detailColor,
    required int detailCount,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          child: InkWell(
            onTap: () => onTap.call(),
            borderRadius: BorderRadius.circular(50),
            child: Ink(
              padding: AppPaddings.paddingMediumAll,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                detailIcon,
                color: detailColor,
                width: AppSizes.appOverallIconWidth,
                height: AppSizes.appOverallIconHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingXSmallLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${detailCount}',
                style: TextStyle(
                  color: detailColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                detailTitle,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
