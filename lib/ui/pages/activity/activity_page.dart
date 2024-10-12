import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/activity/components/activity_item.dart';
import 'package:word_prime/ui/pages/activity/components/analysis_results.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                title: 'En Popüler Kelimelerle Quiz',
                chapterCount: 10,
                isZeroChapterCount: false,
                onTapStart: () {},
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ActivityItem(
                backgroundColor: AppColors.wildBlueYonder,
                titleEmoji: AppLocaleConstants.EMOJI_CONTROL,
                title: 'En Popüler Kelimelerle Quiz',
                chapterCount: 10,
                isZeroChapterCount: false,
                onTapStart: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.sizedBoxOverallHeight),
        Row(
          children: [
            Expanded(
              child: ActivityItem(
                backgroundColor: AppColors.neptune,
                titleEmoji: AppLocaleConstants.EMOJI_QUESTION_MARK,
                title: 'YAKINDA...',
                chapterCount: 0,
                isZeroChapterCount: true,
                onTapStart: () {},
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ActivityItem(
                backgroundColor: AppColors.watermelon,
                titleEmoji: AppLocaleConstants.EMOJI_LIGHTBULB,
                title: 'YAKINDA...',
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
      toolbarHeight: AppSizes.toolbarHeight,
      title: Row(
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.icScorePath,
                width: AppSizes.appOverallIconWidth,
                height: AppSizes.sizedBoxOverallHeight,
              ),
              Text(
                '123',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                'My Activity \u{1F3AF}',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          CustomUserCircleAvatar(
            circleRadius: 14,
            borderPadding: 0,
            profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
          ),
        ],
      ),
    );
  }
}
