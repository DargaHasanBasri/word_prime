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
      backgroundColor: AppColors.cornflowerBlue,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.white,
            child: Image.asset(
              AppAssets.appLogoPath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 10),
            child: Text(
              LocaleKeys.appTitle.locale,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            LocaleKeys.splashPage_title.locale,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
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
