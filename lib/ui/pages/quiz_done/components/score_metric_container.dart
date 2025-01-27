import 'package:word_prime/export.dart';

class ScoreMetricContainer extends StatelessWidget {
  final String title;
  final String metric;
  final String? iconAddress;
  final Color backgroundColor;
  const ScoreMetricContainer({
    super.key,
    required this.title,
    required this.metric,
    this.iconAddress,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.paddingXSmallTop,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding: AppPaddings.paddingXSmallAll,
            child: Container(
              padding: AppPaddings.paddingMediumAll,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconAddress ?? AppAssets.icScorePath,
                    width: AppSizes.appOverallIconWidth,
                    height: AppSizes.appOverallIconHeight,
                  ),
                  SizedBox(width: AppSizes.sizedBoxXSmallWidth),
                  Text(
                    metric,
                    style: TextStyle(
                      color: AppColors.mirage,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
