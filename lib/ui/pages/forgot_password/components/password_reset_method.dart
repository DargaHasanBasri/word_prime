import 'package:word_prime/export.dart';

class PasswordResetMethod extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final String subTitle;
  final String iconAddress;
  const PasswordResetMethod({
    super.key,
    required this.onClick,
    required this.title,
    required this.subTitle,
    required this.iconAddress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick.call(),
      child: Container(
        padding: AppPaddings.paddingMediumAll,
        decoration: BoxDecoration(
          color: AppColors.alabaster,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.softPeach),
        ),
        child: Row(
          children: [
            Container(
              padding: AppPaddings.paddingSmallAll,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.softPeach),
              ),
              child: Image.asset(
                iconAddress,
                width: AppSizes.appOverallIconWidth,
                height: AppSizes.appOverallIconHeight,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.mirage,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: AppColors.paleSky,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              AppAssets.icArrowBackRightPath,
              width: AppSizes.appOverallIconWidth,
              height: AppSizes.appOverallIconHeight,
              color: AppColors.mirage,
            ),
          ],
        ),
      ),
    );
  }
}
