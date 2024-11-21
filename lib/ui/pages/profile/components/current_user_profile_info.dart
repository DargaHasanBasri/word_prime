import 'package:word_prime/export.dart';

class CurrentUserProfileInfo extends StatelessWidget {
  final String? userName;
  final String? userEmail;
  final String? profileImageAddress;
  const CurrentUserProfileInfo({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.profileImageAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.rhino,
      child: Padding(
        padding: AppPaddings.paddingMediumVertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CustomUserCircleAvatar(
                profileImgAddress: profileImageAddress,
                circleRadius: 40,
                borderPadding: 0,
              ),
            ),
            Padding(
              padding: AppPaddings.paddingMediumTop,
              child: Text(
                userName ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
            Padding(
              padding: AppPaddings.paddingXSmallVertical,
              child: Text(
                userEmail ?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: AppPaddings.paddingXXLargeBottom,
                  child: Text(
                    '${AppLocaleConstants.DEFAULT_USER_INFO_1}, ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                Padding(
                  padding: AppPaddings.paddingXXLargeBottom,
                  child: Text(
                    '${AppLocaleConstants.DEFAULT_USER_INFO_2}, ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                Padding(
                  padding: AppPaddings.paddingXXLargeBottom,
                  child: Text(
                    '${AppLocaleConstants.DEFAULT_USER_INFO_3}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
