import 'package:word_prime/base/enums/english_word_level.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/quiz_selection/components/quiz_level.dart';

class QuizSelectionPage extends StatefulWidget {
  const QuizSelectionPage({super.key});

  @override
  State<QuizSelectionPage> createState() => _QuizSelectionPageState();
}

class _QuizSelectionPageState extends BaseStatefulState<QuizSelectionPage> {
  late final QuizSelectionViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<QuizSelectionViewModel>(context, listen: false);
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.appPaddingVertical,
            child: QuizLevel(
              backgroundColor: AppColors.cornflowerBlue,
              englishLevelTitle: 'A1 ${LocaleKeys.level.locale}',
              iconAddress: AppAssets.icLevelA1Path,
              iconColor: AppColors.white,
              onTapStart: () {
                appRoutes.navigateTo(
                  Routes.Quiz,
                  arguments: [
                    _vm.quizType,
                    EnglishWordLevel.A1.level,
                  ],
                );
              },
            ),
          ),
          QuizLevel(
            backgroundColor: AppColors.lavenderPurple,
            englishLevelTitle: 'A2 ${LocaleKeys.level.locale}',
            iconAddress: AppAssets.icLevelA2Path,
            onTapStart: () {
              appRoutes.navigateTo(
                Routes.Quiz,
                arguments: [
                  _vm.quizType,
                  EnglishWordLevel.A2.level,
                ],
              );
            },
          ),
          Padding(
            padding: AppPaddings.appPaddingVertical,
            child: QuizLevel(
              backgroundColor: AppColors.neptune,
              englishLevelTitle: 'B1 ${LocaleKeys.level.locale}',
              iconAddress: AppAssets.icLevelB1Path,
              iconColor: AppColors.white,
              onTapStart: () {
                appRoutes.navigateTo(
                  Routes.Quiz,
                  arguments: [
                    _vm.quizType,
                    EnglishWordLevel.B1.level,
                  ],
                );
              },
            ),
          ),
          QuizLevel(
            backgroundColor: AppColors.wildBlueYonder,
            englishLevelTitle: 'B2 ${LocaleKeys.level.locale}',
            iconAddress: AppAssets.icLevelB2Path,
            onTapStart: () {
              appRoutes.navigateTo(
                Routes.Quiz,
                arguments: [
                  _vm.quizType,
                  EnglishWordLevel.B2.level,
                ],
              );
            },
          ),
          Padding(
            padding: AppPaddings.appPaddingVertical,
            child: QuizLevel(
              backgroundColor: AppColors.pastelBlue,
              englishLevelTitle: 'C1 ${LocaleKeys.level.locale}',
              iconAddress: AppAssets.icLevelC1Path,
              iconColor: AppColors.white,
              onTapStart: () {
                appRoutes.navigateTo(
                  Routes.Quiz,
                  arguments: [
                    _vm.quizType,
                    EnglishWordLevel.C1.level,
                  ],
                );
              },
            ),
          ),
          QuizLevel(
            backgroundColor: AppColors.rhino,
            englishLevelTitle: 'C2 ${LocaleKeys.level.locale}',
            iconAddress: AppAssets.icLevelC2Path,
            onTapStart: () {
              appRoutes.navigateTo(
                Routes.Quiz,
                arguments: [
                  _vm.quizType,
                  EnglishWordLevel.C2.level,
                ],
              );
            },
          ),
          Padding(
            padding: AppPaddings.appPaddingVertical,
            child: QuizLevel(
              backgroundColor: AppColors.artyClickRed,
              englishLevelTitle: 'Mixed ${LocaleKeys.level.locale}',
              iconAddress: AppAssets.icMixedPath,
              onTapStart: () {
                appRoutes.navigateTo(
                  Routes.Quiz,
                  arguments: [
                    _vm.quizType,
                    EnglishWordLevel.Mix.level,
                  ],
                );
              },
            ),
          ),
        ],
      ),
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
        '${_vm.quizType}',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
      ),
    );
  }
}