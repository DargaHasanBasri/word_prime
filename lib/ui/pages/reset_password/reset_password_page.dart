import 'package:word_prime/export.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends BaseStatefulState<ResetPasswordPage> {
  late final ResetPasswordViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<ResetPasswordViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: AppPaddings.paddingXLargeBottom,
          child: Image.asset(
            AppAssets.icResetPasswordPath,
            height: AppSizes.firstHundredContainerWidth,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Text(
          _vm.userEmail,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          LocaleKeys.resetPassword_title.locale,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        Text(
          LocaleKeys.resetPassword_titleInfo.locale,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          LocaleKeys.resetPassword_titleSubInfo.locale,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.paddingXXLargeTop,
          child: CustomButton(
            title: LocaleKeys.resetPassword_done.locale.toUpperCase(),
            onClick: () => appRoutes.navigateRemoveUntil(Routes.Login),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingLargeTop,
          child: CustomButton(
            title: LocaleKeys.emailVerificationPage_resendEmail.locale
                .toUpperCase(),
            onClick: () {},
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => appRoutes.popIfBackStackNotEmpty(),
        icon: Image.asset(
          AppAssets.icArrowBackLeftPath,
          color: Theme.of(context).colorScheme.secondary,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ),
    );
  }
}
