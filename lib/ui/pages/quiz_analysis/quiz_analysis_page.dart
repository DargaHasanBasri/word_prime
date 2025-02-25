import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/quiz/components/question_transiton_animation.dart';
import 'package:word_prime/ui/pages/quiz_analysis/components/daily_bar_chart.dart';
import 'package:word_prime/ui/pages/quiz_analysis/components/level_selection.dart';

class QuizAnalysisPage extends StatefulWidget {
  const QuizAnalysisPage({super.key});

  @override
  State<QuizAnalysisPage> createState() => _QuizAnalysisPageState();
}

class _QuizAnalysisPageState extends BaseStatefulState<QuizAnalysisPage> {
  late final QuizAnalysisViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<QuizAnalysisViewModel>(context, listen: false);
    _vm.fetchAnalysis();
    _vm.chartTitleNotifier.value =
        "${LocaleKeys.quizAnalysis_chartTitle.locale}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: ValueListenableBuilder(
              valueListenable: _vm.analysisNotifier,
              builder: (_, data, ___) {
                bool isLoading = data.isEmpty;
                return Container(
                  padding: AppPaddings.paddingMediumVertical +
                      AppPaddings.paddingSmallHorizontal,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.santaGrey),
                  ),
                  child: QuestionTransition(
                    isLoading: isLoading,
                    child: ValueListenableBuilder(
                      valueListenable: _vm.chartTitleNotifier,
                      builder: (_, __, ___) {
                        return _chartContent(
                          chartTitle: _vm.chartTitleNotifier.value,
                        );
                      },
                    ),
                  ),
                );
              }),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: AppPaddings.paddingSmallVertical,
                child: Column(
                  children: [
                    LevelSelection(
                      iconAddress: AppAssets.icLevelA1Path,
                      levelTitle: EnglishWordLevel.A1.level,
                      backgroundColor: AppColors.cornflowerBlue,
                      iconColor: AppColors.white,
                      onTapResult: () {
                        _vm.chartTitleNotifier.value =
                            EnglishWordLevel.A1.level;
                        _vm.fetchAnalysis(quizLevel: EnglishWordLevel.A1.level);
                      },
                    ),
                    Padding(
                      padding: AppPaddings.paddingSmallVertical,
                      child: LevelSelection(
                        iconAddress: AppAssets.icLevelA2Path,
                        levelTitle: EnglishWordLevel.A2.level,
                        backgroundColor: AppColors.lavenderPurple,
                        onTapResult: () {
                          _vm.chartTitleNotifier.value =
                              EnglishWordLevel.A2.level;
                          _vm.fetchAnalysis(
                              quizLevel: EnglishWordLevel.A2.level);
                        },
                      ),
                    ),
                    LevelSelection(
                      iconAddress: AppAssets.icLevelB1Path,
                      levelTitle: EnglishWordLevel.B1.level,
                      backgroundColor: AppColors.neptune,
                      onTapResult: () {
                        _vm.chartTitleNotifier.value =
                            EnglishWordLevel.B1.level;
                        _vm.fetchAnalysis(quizLevel: EnglishWordLevel.B1.level);
                      },
                    ),
                    Padding(
                      padding: AppPaddings.paddingSmallVertical,
                      child: LevelSelection(
                        iconAddress: AppAssets.icLevelB2Path,
                        levelTitle: EnglishWordLevel.B2.level,
                        backgroundColor: AppColors.wildBlueYonder,
                        onTapResult: () {
                          _vm.chartTitleNotifier.value =
                              EnglishWordLevel.B2.level;
                          _vm.fetchAnalysis(
                              quizLevel: EnglishWordLevel.B2.level);
                        },
                      ),
                    ),
                    LevelSelection(
                      iconAddress: AppAssets.icLevelC1Path,
                      levelTitle: EnglishWordLevel.C1.level,
                      backgroundColor: AppColors.pastelBlue,
                      onTapResult: () {
                        _vm.chartTitleNotifier.value =
                            EnglishWordLevel.C1.level;
                        _vm.fetchAnalysis(quizLevel: EnglishWordLevel.C1.level);
                      },
                    ),
                    Padding(
                      padding: AppPaddings.paddingSmallVertical,
                      child: LevelSelection(
                        iconAddress: AppAssets.icLevelC2Path,
                        levelTitle: EnglishWordLevel.C2.level,
                        backgroundColor: AppColors.rhino,
                        onTapResult: () {
                          _vm.chartTitleNotifier.value =
                              EnglishWordLevel.C2.level;
                          _vm.fetchAnalysis(
                              quizLevel: EnglishWordLevel.C2.level);
                        },
                      ),
                    ),
                    LevelSelection(
                      iconAddress: AppAssets.icMixedPath,
                      levelTitle: "All",
                      backgroundColor: AppColors.artyClickRed,
                      onTapResult: () {
                        _vm.chartTitleNotifier.value =
                            "${LocaleKeys.quizAnalysis_chartTitle.locale}";
                        _vm.fetchAnalysis();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _chartContent({String? chartTitle}) {
    return Column(
      children: [
        Text(
          chartTitle ?? "",
          textAlign: TextAlign.center,
        ),
        Text(
          LocaleKeys.quizAnalysis_chartSubTitle.locale,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: DailyBarChart(
            values1: _vm.getTotalCorrectList(),
            values2: _vm.getTotalWrongList(),
            maxYValue: _vm.getMaxTotalQuestion(),
            days: _vm.weekDays,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColors.cornflowerBlue,
                ),
                SizedBox(width: 8),
                Text(
                  LocaleKeys.quizAnalysis_correctTitle.locale,
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColors.artyClickRed,
                ),
                SizedBox(width: 8),
                Text(
                  LocaleKeys.quizAnalysis_incorrectTitle.locale,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.rhino,
      leading: IconButton(
        onPressed: () {
          appRoutes.popIfBackStackNotEmpty();
        },
        icon: Image.asset(
          AppAssets.icArrowBackLeftPath,
          color: AppColors.white,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ),
      title: Text(
        LocaleKeys.quizAnalysis_appBarTitle.locale,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
