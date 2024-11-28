import 'package:word_prime/export.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                LocaleKeys.onboardingPage_onboardingSecondTitle.locale,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSizes.sizedBoxMediumHeight),
              Text(
                LocaleKeys.onboardingPage_onboardingSecondSubTitle.locale,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Padding(
          padding: AppPaddings.paddingXLargeTop,
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.imgImgBookPath,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
