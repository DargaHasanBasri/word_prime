import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:word_prime/export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseStatefulState<SplashPage> {
  late final SplashViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<SplashViewModel>(context, listen: false);
    serviceLocalStorage.getInstance();
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
            padding: AppPaddings.paddingLargeTop,
            child: Text(
              LocaleKeys.appTitle.locale,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
          Padding(
            padding:
                AppPaddings.appPaddingHorizontal + AppPaddings.paddingXSmallTop,
            child: Text(
              LocaleKeys.splashPage_title.locale,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: AppPaddings.paddingLargeTop,
            child: ValueListenableBuilder(
              valueListenable: _vm.isLoading,
              builder: (_, loading, ___) {
                return loading
                    ? Column(
                        children: [
                          SpinKitFadingCircle(
                            color: AppColors.white,
                            size: 50.0,
                          ),
                        ],
                      )
                    : SizedBox(height: 50);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> waitAndNavigate(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        _vm.isLoading.value = false;
        _vm.isLoggedIn()
            ? appRoutes.navigateToReplacement(Routes.MainTab)
            : appRoutes.navigateToReplacement(Routes.Onboarding);
      },
    );
  }
}
