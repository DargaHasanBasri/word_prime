import 'dart:developer';
import 'package:word_prime/export.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState
    extends BaseStatefulState<EmailVerificationPage>
    with WidgetsBindingObserver {
  late final EmailVerificationViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<EmailVerificationViewModel>(context, listen: false);

    /// Observer is added to listen to lifecycle events
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      log('Back to the application, checking email verification status.');
      await _vm.checkEmailVerification()
          ? appRoutes.navigateRemoveUntil(Routes.Login)
          : log('E-posta henüz doğrulanmadı.');
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: _buildBody(),
        ),
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
            AppAssets.icEmailVerificationPath,
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
          LocaleKeys.emailVerificationPage_title.locale,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sizedBoxOverallHeight),
        Text(
          LocaleKeys.emailVerificationPage_titleMsg.locale,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        Text(
          LocaleKeys.emailVerificationPage_titleInfo.locale,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.paddingXXLargeTop,
          child: CustomButton(
            title: LocaleKeys.emailVerificationPage_resendEmail.locale
                .toUpperCase(),
            onClick: () {},
          ),
        ),
        Padding(
          padding: AppPaddings.paddingLargeTop,
          child: CustomButton(
            title:
                LocaleKeys.emailVerificationPage_backLogin.locale.toUpperCase(),
            onClick: () async {
              await _vm.checkEmailVerification()
                  ? appRoutes.navigateRemoveUntil(Routes.Login)
                  : log('E-posta henüz doğrulanmadı.');
            },
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
