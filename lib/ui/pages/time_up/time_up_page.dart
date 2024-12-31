import 'package:word_prime/export.dart';

class TimeUpPage extends StatefulWidget {
  const TimeUpPage({super.key});

  @override
  State<TimeUpPage> createState() => _TimeUpPageState();
}

class _TimeUpPageState extends BaseStatefulState<TimeUpPage> {
  late final TimeUpViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<TimeUpViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rhino,
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.icSandTimerPath),
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: Text(
            "Zamanın Tükendi",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CustomButton(
          title: "Anasayfaya dönün",
          borderRadius: 24,
          onClick: () {
            appRoutes.navigateRemoveUntil(Routes.MainTab);
          },
        ),
        SizedBox(height: 24),
        CustomButton(
          title: "Sonuçları Gör",
          borderRadius: 24,
          onClick: () {
            appRoutes.navigateRemoveUntil(Routes.MainTab);
          },
        ),
      ],
    );
  }
}
