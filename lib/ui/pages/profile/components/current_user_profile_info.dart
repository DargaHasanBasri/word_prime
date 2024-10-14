import 'package:word_prime/export.dart';

class CurrentUserProfileInfo extends StatelessWidget {
  const CurrentUserProfileInfo({super.key});

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
                profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                borderPadding: 0,
              ),
            ),
            Padding(
              padding: AppPaddings.paddingMediumTop,
              child: Text(
                AppLocaleConstants.DEFAULT_USER_NAME,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: AppPaddings.paddingXSmallVertical,
              child: Text(
                AppLocaleConstants.DEFAULT_USER_EMAIL,
                style: TextStyle(
                  color: AppColors.santaGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: AppPaddings.paddingXLargeBottom,
                  child: Text(
                    '${AppLocaleConstants.DEFAULT_USER_INFO_1}, ',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: AppPaddings.paddingXLargeBottom,
                  child: Text(
                    '${AppLocaleConstants.DEFAULT_USER_INFO_2}, ',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: AppPaddings.paddingXLargeBottom,
                  child: Text(
                    '${AppLocaleConstants.DEFAULT_USER_INFO_3}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
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
