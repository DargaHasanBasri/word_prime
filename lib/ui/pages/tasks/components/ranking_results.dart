import 'package:word_prime/export.dart';

class RankingResults extends StatelessWidget {
  final VoidCallback onTabViewAll;
  const RankingResults({
    super.key,
    required this.onTabViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.rhino,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: AppPaddings.appPaddingAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    LocaleKeys.tasksPage_currentResultsMsg.locale,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(height: AppSizes.sizedBoxMediumHeight),
                  CustomButton(
                    title: LocaleKeys.tasksPage_viewAll.locale,
                    titleVerticalPadding: 8,
                    borderRadius: 8,
                    onClick: () => onTabViewAll.call(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: AppPaddings.paddingSmallVertical,
                  child: AspectRatio(
                    aspectRatio: 2  ,
                    child: Image.asset(
                      AppAssets.imgImgDeerPath,
                    ),
                  ),
                ),
                Padding(
                  padding: AppPaddings.paddingLargeBottom,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppColors.white),
                    ),
                    child: Text(
                      '10000. Sıra',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
