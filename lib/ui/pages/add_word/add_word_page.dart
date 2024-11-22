import 'dart:developer';
import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/add_word/components/word_english_level.dart';

class AddWordPage extends StatefulWidget {
  const AddWordPage({super.key});

  @override
  State<AddWordPage> createState() => _AddWordPageState();
}

class _AddWordPageState extends BaseStatefulState<AddWordPage> {
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
      children: [
        Row(
          children: [
            Expanded(
              child: WordEnglishLevel(
                englishLevelTitle: 'A1',
                onTapLevel: () {
                  log('A1 click');
                  appRoutes.navigateTo(Routes.MyWordList);
                },
              ),
            ),
            SizedBox(width: AppSizes.sizedBoxOverallHeight),
            Expanded(
              child: WordEnglishLevel(
                englishLevelTitle: 'A2',
                onTapLevel: () {
                  log('A2 click');
                  appRoutes.navigateTo(Routes.MyWordList);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: Row(
            children: [
              Expanded(
                child: WordEnglishLevel(
                  englishLevelTitle: 'B1',
                  onTapLevel: () {
                    log('B1 click');
                    appRoutes.navigateTo(Routes.MyWordList);
                  },
                ),
              ),
              SizedBox(width: AppSizes.sizedBoxOverallHeight),
              Expanded(
                child: WordEnglishLevel(
                  englishLevelTitle: 'B2',
                  onTapLevel: () {
                    log('B2 click');
                    appRoutes.navigateTo(Routes.MyWordList);
                  },
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: WordEnglishLevel(
                englishLevelTitle: 'C1',
                onTapLevel: () {
                  log('C1 click');
                  appRoutes.navigateTo(Routes.MyWordList);
                },
              ),
            ),
            SizedBox(width: AppSizes.sizedBoxOverallHeight),
            Expanded(
              child: WordEnglishLevel(
                englishLevelTitle: 'C2',
                onTapLevel: () {
                  log('C2 click');
                  appRoutes.navigateTo(Routes.MyWordList);
                },
              ),
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
      title: Text(
        '${LocaleKeys.addWord.locale}',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
