import 'package:word_prime/export.dart';

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: AppPaddings.appPaddingXLargeHorizontal,
              child: Text(
                LocaleKeys.onboardingPage_onboardingFirstTitle.locale,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: AppPaddings.appPaddingLargeHorizontal +
                  AppPaddings.paddingLargeTop,
              child: Text(
                LocaleKeys.onboardingPage_onboardingFirstSubTitle.locale,
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
                  AppAssets.imgImgOnboardingFirstPath,
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
