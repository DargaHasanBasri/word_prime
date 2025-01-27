import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/quiz/components/answer_options.dart';
import 'package:word_prime/ui/pages/quiz/components/custom_app_bar.dart';
import 'package:word_prime/ui/pages/quiz/components/question_transiton_animation.dart';
import 'package:word_prime/ui/widgets/custom_quiz_check_bottom_sheet.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _showExitDialog();
      },
      child: Scaffold(
        backgroundColor: AppColors.rhino,
        appBar: CustomAppBar(
          progressIndicatorTimeNotifier: _vm.seconds,
          exitOnTap: () {
            _vm.stopTimer(reset: false);
            _showExitDialog();
          },
        ),
        body: Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: _buildBody(),
        ),
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

  void _showExitDialog() {
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
                      onCorrectAnswer: () async {
                        _vm.stopTimer(reset: false);
                        _vm.totalCorrect.value++;
                        _vm.totalElapsedTime.value +=
                            (AppLocaleConstants.MAX_SECONDS -
                                _vm.seconds.value);
                        await _vm.answered(
                          questionId: currentItem?.questionId,
                          isTrue: true,
                        );
                        showQuizCheckBottomSheet(
                          context: context,
                          child: CustomQuizCheckBottomSheet(
                            isCorrect: true,
                            onTapNext: () async {
                              Navigator.pop(context);
                              await _vm.isLastQuestion()
                                  ? appRoutes.navigateRemoveUntil(
                                      Routes.QuizDone,
                                      arguments: [
                                        _vm.totalCorrect.value,
                                        _vm.totalWrong.value,
                                        _vm.totalElapsedTime.value,
                                        _vm.languageLevel,
                                      ],
                                    )
                                  : null;
                            },
                          ),
                        );
                      },
                      onIncorrectAnswer: () async {
                        _vm.stopTimer(reset: false);
                        _vm.totalWrong.value++;
                        _vm.totalElapsedTime.value +=
                            (AppLocaleConstants.MAX_SECONDS -
                                _vm.seconds.value);
                        await _vm.answered(
                          questionId: currentItem?.questionId,
                          isTrue: false,
                        );
                        showQuizCheckBottomSheet(
                          context: context,
                          child: CustomQuizCheckBottomSheet(
                            isCorrect: false,
                            correctAnswer: currentItem?.answerWord ?? "",
                            onTapNext: () async {
                              Navigator.pop(context);
                              await _vm.isLastQuestion()
                                  ? appRoutes.navigateRemoveUntil(
                                      Routes.QuizDone,
                                      arguments: [
                                        _vm.totalCorrect.value,
                                        _vm.totalWrong.value,
                                        _vm.totalElapsedTime.value,
                                        _vm.languageLevel,
                                      ],
                                    )
                                  : null;
                            },
                          ),
                        );
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
              : "${LocaleKeys.question.locale} ${currentQuestion} of ${totalQuestion}",
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
}
