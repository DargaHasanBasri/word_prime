import 'package:word_prime/export.dart';

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.imgImgDeerPath,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        Column(
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
      ],
    );
  }
}
