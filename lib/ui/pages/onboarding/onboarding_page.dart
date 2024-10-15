import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/onboarding/components/onboarding_second.dart';

import 'components/onboarding_first.dart';

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
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.bottomCenter,
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
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.white,
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
      backgroundColor: AppColors.white,
      toolbarHeight: AppSizes.toolbarHeight,
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
            style: TextStyle(
              color: AppColors.cornflowerBlue,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
