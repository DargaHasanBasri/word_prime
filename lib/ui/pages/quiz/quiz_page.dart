import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/quiz/components/answer_options.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _examplePicture(),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: _questionContent(),
        ),
        AnswerOptions(
          options: ['APPLE', 'BANANA', 'CHERRY'],
          correctOption: _vm.correctOption,
          selectedOption: _vm.selectedOption,
          onCorrectAnswer: () {
            debugPrint('test true answer');
            _vm.stopTimer(reset: false);
          },
          onIncorrectAnswer: () {
            debugPrint('test false answer');
            _vm.stopTimer(reset: false);
          },
        ),
      ],
    );
  }

  Widget _questionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question 12 of 20',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'What is the English meaning of the word apple?',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 30,
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
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.rhino,
      toolbarHeight: AppSizes.toolbarHeight,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: AppColors.white.withOpacity(0.1),
              onTap: () {},
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
          ),
          CustomTimerProgressIndicator(
            time: _vm.seconds,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: AppColors.white.withOpacity(0.1),
              onTap: () {},
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
          ),
        ],
      ),
    );
  }
}
