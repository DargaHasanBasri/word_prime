import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/quiz/components/answer_options.dart';
import 'package:word_prime/ui/pages/quiz/components/question_transiton_animation.dart';
import 'package:word_prime/ui/widgets/custom_timer_progress_indicator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends BaseStatefulState<QuizPage> {
  late final QuizViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<QuizViewModel>(context, listen: false);
    _vm.getQuiz(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );
    _vm.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rhino,
      appBar: _buildAppBar(),
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: _vm.seconds,
        builder: (_, secondsValue, __) {
          // Check if seconds is 0
          if (secondsValue == 0) {
            // Using WidgetsBinding to avoid build-time navigation
            WidgetsBinding.instance.addPostFrameCallback((_) {
              appRoutes.navigateRemoveUntil(Routes.TimeUp);
            });
            _vm.selectedOption.value = null;
            _vm.timer?.cancel();
          }
          return _buildQuestion();
        },
      ),
    );
  }

  Widget _buildQuestion() {
    return ValueListenableBuilder(
      valueListenable: _vm.questionNotifier,
      builder: (_, __, ___) {
        return ValueListenableBuilder(
          valueListenable: _vm.isLoading,
          builder: (_, __, ___) {
            final currentItem =
                _vm.questionNotifier.value?[_vm.currentQuestionIndex.value];
            return QuestionTransition(
              isLoading: _vm.isLoading.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  currentItem?.questionImageAddress != null
                      ? _examplePicture()
                      : SizedBox(),
                  Padding(
                    padding: AppPaddings.paddingMediumVertical,
                    child: _questionContent(
                      currentItem,
                      _vm.currentQuestionIndex.value + 1,
                      _vm.questionNotifier.value?.length,
                    ),
                  ),
                  Padding(
                    padding: currentItem?.questionImageAddress != null
                        ? EdgeInsets.zero
                        : AppPaddings.appPaddingVertical,
                    child: AnswerOptions(
                      options: currentItem?.options ?? [],
                      correctOption: currentItem?.answerWord ?? "",
                      selectedOption: _vm.selectedOption,
                      onCorrectAnswer: () {
                        debugPrint('test true answer');
                        _vm.stopTimer(reset: false);
                      },
                      onIncorrectAnswer: () {
                        debugPrint('test false answer');
                        _vm.stopTimer(reset: false);
                      },
                      onClickNext: () async {
                        await _vm.isLastQuestion()
                            ? appRoutes.navigateRemoveUntil(Routes.MainTab)
                            : null;
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _questionContent(
    QuestionModel? questionModel,
    int? currentQuestion,
    int? totalQuestion,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionModel?.questionWord == null
              ? ""
              : "Question ${currentQuestion} of ${totalQuestion}",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Text(
          questionModel?.questionWord == null
              ? ""
              : "'${questionModel?.questionWord}' kelimesinin Türkçe anlamı nedir?",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _examplePicture() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            AppAssets.imgExampPostPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.rhino,
      toolbarHeight: AppSizes.toolbarHeight,
      automaticallyImplyLeading: false,
      title: Stack(
        children: [
          _exitButton(),
          Center(
            child: CustomTimerProgressIndicator(
              time: _vm.seconds,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _scoreBoard(),
          ),
        ],
      ),
    );
  }

  Widget _exitButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: AppColors.white.withOpacity(0.1),
        onTap: () {
          _vm.stopTimer(reset: false);
          showPopupDialog(
            context: context,
            child: Padding(
              padding: AppPaddings.appPaddingHorizontal,
              child: CustomAppPopup(
                title: LocaleKeys.warningMessages_quizQuitMsgTitle.locale,
                subTitle: LocaleKeys.warningMessages_quizQuitMsgSubTitle.locale,
                onTapCancelButton: () {
                  appRoutes.popIfBackStackNotEmpty();
                  _vm.selectedOption.value != null ? null : _vm.startTimer();
                },
                onTapConfirmButton: () {
                  appRoutes.popPages(2);
                },
              ),
            ),
          );
        },
        child: Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: AppColors.white.withOpacity(0.30),
              width: 3,
            ),
          ),
          child: Image.asset(
            AppAssets.icClosePath,
            width: 12,
            height: 12,
          ),
        ),
      ),
    );
  }

  Widget _scoreBoard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2) +
          EdgeInsets.only(right: 2, left: 8),
      decoration: ShapeDecoration(
        shape: StadiumBorder(side: BorderSide.none),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '12',
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 4),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.pastelBlue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              AppAssets.icScorePath,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
