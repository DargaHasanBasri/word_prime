import 'package:word_prime/export.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: AppPaddings.appPaddingXLargeHorizontal,
              child: Text(
                LocaleKeys.onboardingPage_onboardingSecondTitle.locale,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: AppPaddings.appPaddingLargeHorizontal +
                  AppPaddings.paddingLargeTop,
              child: Text(
                LocaleKeys.onboardingPage_onboardingSecondSubTitle.locale,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        AspectRatio(
          aspectRatio: 8 / 10,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.imgImgOnboardingSecondPath,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
