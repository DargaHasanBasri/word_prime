import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/onboarding/components/onboarding_first.dart';
import 'package:word_prime/ui/pages/onboarding/components/onboarding_second.dart';

import 'components/current_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends BaseStatefulState<OnboardingPage> {
  late final OnboardingViewModel _vm;

  final PageController _pageController = PageController();

  @override
  void initState() {
    _vm = Provider.of<OnboardingViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            _vm.currentPage.value = page;
          },
          children: [
            OnboardingFirst(),
            OnboardingSecond(),
          ],
        ),
        Padding(
          padding:
              AppPaddings.appPaddingHorizontal + AppPaddings.paddingLargeBottom,
          child: ValueListenableBuilder(
            valueListenable: _vm.currentPage,
            builder: (_, __, ___) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CurrentPageIndicator(
                    currentIndex: _vm.currentPage,
                    countPage: 2,
                  ),
                  SizedBox(height: AppSizes.sizedBoxOverallHeight),
                  CustomButton(
                    title: LocaleKeys.continueTitle.locale.toUpperCase(),
                    onClick: () {
                      _vm.lastPage()
                          ? appRoutes.navigateRemoveUntil(Routes.GetStarted)
                          : _vm.nextPage(_pageController);
                    },
                  ),
                  SizedBox(height: AppSizes.sizedBoxSmallHeight),
                  CustomButton(
                    title: LocaleKeys.skip.locale.toUpperCase(),
                    titleColor: AppColors.cornflowerBlue,
                    backgroundColor: Colors.transparent,
                    borderColor: Theme.of(context).colorScheme.secondary,
                    onClick: () {
                      appRoutes.navigateRemoveUntil(Routes.GetStarted);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.appLogoPath,
            width: AppSizes.sizedBoxMediumWidth,
            height: AppSizes.appOverallIconHeight,
          ),
          SizedBox(width: AppSizes.sizedBoxMediumWidth),
          Text(
            LocaleKeys.appTitle.locale,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.cornflowerBlue,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
