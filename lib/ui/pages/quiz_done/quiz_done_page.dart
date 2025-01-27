import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/quiz_done/components/score_metric_container.dart';

class QuizDonePage extends StatefulWidget {
  const QuizDonePage({super.key});

  @override
  State<QuizDonePage> createState() => _QuizDonePageState();
}

class _QuizDonePageState extends BaseStatefulState<QuizDonePage> {
  late final QuizDoneViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<QuizDoneViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _showExitDialog();
      },
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: AppPaddings.appPaddingAll,
              child: Text(
                LocaleKeys.quizDone_congratulationsMsg.locale,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 22,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset("assets/images/congratulations.gif"),
            ),
            Column(
              children: [
                Padding(
                  padding: AppPaddings.appPaddingVertical,
                  child: ScoreMetricContainer(
                    title: LocaleKeys.quizDone_totalScore.locale,
                    metric: _vm.totalScore.toString(),
                    iconAddress: AppAssets.icScorePath,
                    backgroundColor: AppColors.goldenDream,
                  ),
                ),
                Padding(
                  padding: AppPaddings.appPaddingHorizontal,
                  child: Row(
                    children: [
                      Expanded(
                        child: ScoreMetricContainer(
                          title: LocaleKeys.quizDone_success.locale,
                          metric: "%${_vm.successPercentage.toString()}",
                          iconAddress: AppAssets.icScorePath,
                          backgroundColor: AppColors.yellowGreen,
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: ScoreMetricContainer(
                          title: LocaleKeys.quizDone_time.locale,
                          metric: "${_vm.totalElapsedTime.toString()} sn",
                          iconAddress: AppAssets.icSandTimerPath,
                          backgroundColor: AppColors.pastelBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  borderRadius: 16,
                  title: LocaleKeys.quizDone_buttonTitle.locale.toUpperCase(),
                  onClick: () {
                    appRoutes.navigateRemoveUntil(Routes.MainTab);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showExitDialog() {
    showPopupDialog(
      context: context,
      child: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: CustomAppPopup(
          title: LocaleKeys.warningMessages_quizQuitMsgTitle.locale,
          subTitle: LocaleKeys.warningMessages_quizQuitMsgSubTitle.locale,
          onTapCancelButton: () {
            appRoutes.popIfBackStackNotEmpty();
          },
          onTapConfirmButton: () {
            appRoutes.navigateRemoveUntil(Routes.MainTab);
          },
        ),
      ),
    );
  }
}
