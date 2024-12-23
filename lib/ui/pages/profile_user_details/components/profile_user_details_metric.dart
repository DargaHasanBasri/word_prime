import 'package:word_prime/export.dart';

class ProfileUserDetailsMetric extends StatelessWidget {
  final UserModel? userModel;
  final VoidCallback onTapFollowButton;
  final VoidCallback onTapFollowing;
  final VoidCallback onTapFollowers;
  final String? buttonTitle;
  final bool isCurrentUser;
  const ProfileUserDetailsMetric({
    super.key,
    required this.userModel,
    required this.onTapFollowButton,
    required this.buttonTitle,
    required this.onTapFollowing,
    required this.onTapFollowers,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          AppPaddings.paddingSmallVertical + AppPaddings.appPaddingHorizontal,
      decoration: BoxDecoration(
        color: AppColors.rhino,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomUserCircleAvatar(
                circleRadius: 40,
                borderPadding: 0,
                profileImgAddress: userModel?.profileImageAddress,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _metricItem(
                        context,
                        metricCount: userModel?.totalPost ?? 0,
                        metricName: LocaleKeys.word.locale,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(
                              color: AppColors.santaGrey,
                            ),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => onTapFollowing.call(),
                          child: _metricItem(
                            context,
                            metricCount: userModel?.totalFollow ?? 0,
                            metricName: LocaleKeys.following.locale,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onTapFollowers.call(),
                        child: _metricItem(
                          context,
                          metricCount: userModel?.totalFollower ?? 0,
                          metricName: LocaleKeys.profilePage_follower.locale,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.appOverallIconHeight),
          Padding(
            padding: AppPaddings.paddingMediumBottom,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userModel?.userName ?? ''}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.white,
                                ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppSizes.sizedBoxSmallHeight),
                      Text(
                        "Why do we use it? It is a long established fact that a reader will"
                        "be distracted by lorem ipsum lorem ipsum lorem ipsum lorem"
                        " ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                isCurrentUser
                    ? SizedBox()
                    : Expanded(
                        child: CustomButton(
                          title: buttonTitle ?? '',
                          borderRadius: 16,
                          titleVerticalPadding: 6,
                          onClick: () => onTapFollowButton.call(),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricItem(
    BuildContext context, {
    required int? metricCount,
    required String? metricName,
  }) {
    return Column(
      children: [
        Text(
          '${metricCount?.formatCount() ?? 0} ',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 22,
                color: AppColors.white,
              ),
        ),
        SizedBox(width: AppSizes.sizedBoxSmallWidth),
        Text(
          metricName ?? '',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
