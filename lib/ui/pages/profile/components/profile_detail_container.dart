import 'package:word_prime/export.dart';

class ProfileDetailContainer extends StatelessWidget {
  final String detailTitle;
  final int detailCount;
  final String detailIcon;
  final Color detailColor;
  const ProfileDetailContainer({
    super.key,
    required this.detailTitle,
    required this.detailCount,
    required this.detailIcon,
    required this.detailColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: AppPaddings.paddingMediumAll,
          decoration: BoxDecoration(
            color: AppColors.alabaster,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Image.asset(
                detailIcon,
                color: detailColor,
                width: AppSizes.appOverallIconWidth,
                height: AppSizes.appOverallIconHeight,
              ),
            ],
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
                style: TextStyle(
                  color: AppColors.paleSky,
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
