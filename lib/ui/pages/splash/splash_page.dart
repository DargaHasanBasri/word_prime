import 'package:word_prime/export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseStatefulState<SplashPage> {
  @override
  void initState() {
    waitAndNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: AppSizes.appLogoRadius,
            backgroundColor: Theme.of(context).colorScheme.surfaceTint,
            child: Image.asset(
              AppAssets.appLogoPath,
            ),
          ),
          Padding(
            padding:
                AppPaddings.paddingLargeTop + AppPaddings.paddingSmallBottom,
            child: Text(
              LocaleKeys.appTitle.locale,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            LocaleKeys.splashPage_title.locale,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Future<void> waitAndNavigate(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        appRoutes.navigateToReplacement(Routes.Onboarding);
      },
    );
  }
}
