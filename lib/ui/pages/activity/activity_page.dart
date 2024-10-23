import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/activity/components/activity_item.dart';
import 'package:word_prime/ui/pages/activity/components/analysis_results.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends BaseStatefulState<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppPaddings.appPaddingAll,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: ActivityItem(
                backgroundColor: AppColors.lavenderPurple,
                titleEmoji: AppLocaleConstants.EMOJI_BRAIN,
                title: LocaleKeys.activityPage_addedWordsQuiz.locale,
                chapterCount: 10,
                isZeroChapterCount: false,
                onTapStart: () {
                  appRoutes.navigateTo(Routes.Quiz);
                },
              ),
            ),
            SizedBox(width: AppSizes.sizedBoxMediumWidth),
            Expanded(
              child: ActivityItem(
                backgroundColor: AppColors.wildBlueYonder,
                titleEmoji: AppLocaleConstants.EMOJI_CONTROL,
                title: LocaleKeys.activityPage_popularQuiz.locale,
                chapterCount: 10,
                isZeroChapterCount: false,
                onTapStart: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        Row(
          children: [
            Expanded(
              child: ActivityItem(
                backgroundColor: AppColors.neptune,
                titleEmoji: AppLocaleConstants.EMOJI_QUESTION_MARK,
                title: '${LocaleKeys.activityPage_soon.locale}...',
                chapterCount: 0,
                isZeroChapterCount: true,
                onTapStart: () {},
              ),
            ),
            SizedBox(width: AppSizes.sizedBoxMediumWidth),
            Expanded(
              child: ActivityItem(
                backgroundColor: AppColors.watermelon,
                titleEmoji: AppLocaleConstants.EMOJI_LIGHTBULB,
                title: '${LocaleKeys.activityPage_soon.locale}...',
                chapterCount: 0,
                isZeroChapterCount: true,
                onTapStart: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.sizedBoxOverallHeight),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppSizes.bottomNavigationBarHeight,
          ),
          child: AnalysisResults(),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.rhino,
      title: Text(
        '${LocaleKeys.activityPage_myActivity.locale}',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
