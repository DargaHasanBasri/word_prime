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

    /// Registers this widget as an observer in the `WidgetsBinding`
    /// system to observe the widget's lifecycle changes
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    /// It prevents unnecessary use of system resources by removing the observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    /// Captures the change of application lifecycle states
    if (state == AppLifecycleState.resumed) {
      /// When the app comes back to the foreground (resumed)
      /// it checks the user's email verification status
      /// If the email is verified, the user is redirected to the `Login`
      /// page with all history routes cleared.
      /// SnackBar is displayed informing the user that the email has
      /// not yet been verified
      await _vm.checkEmailVerification()
          ? appRoutes.navigateRemoveUntil(Routes.Login)
          : showSnackBar(
              context: context,
              content: CustomSnackBarContent(
                text: LocaleKeys.warningMessages_emailNotYetVerified.locale,
                iconType: CustomSnackBarType.info,
              ),
            );
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
          padding: AppPaddings.paddingLargeBottom,
          child: Image.asset(
            AppAssets.icEmailVerificationPath,
            height: AppSizes.firstHundredContainerWidth,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Text(
          LocaleKeys.emailVerificationPage_title.locale,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          _vm.userEmail,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sizedBoxOverallHeight),
        Text(
          LocaleKeys.emailVerificationPage_titleMsg.locale,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        Text(
          LocaleKeys.emailVerificationPage_titleInfo.locale,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.paddingXXLargeTop,
          child: CustomButton(
            title: LocaleKeys.emailVerificationPage_resendEmail.locale
                .toUpperCase(),
            onClick: () async {
              await _vm.checkEmailVerification()
                  ? showSnackBar(
                      context: context,
                      content: CustomSnackBarContent(
                        text: LocaleKeys
                            .warningMessages_emailAlreadyVerified.locale,
                        iconType: CustomSnackBarType.info,
                      ),
                    )
                  : _vm.resendEmailVerification(
                      showProgress: () => showProgress(context),
                      hideProgress: () => hideProgress(),
                      showErrorSnackBar: () {
                        showSnackBar(
                          context: context,
                          content: CustomSnackBarContent(
                            text: LocaleKeys
                                .warningMessages_unexpectedError.locale,
                            iconType: CustomSnackBarType.info,
                          ),
                        );
                      },
                    );
            },
          ),
        ),
        Padding(
          padding: AppPaddings.paddingMediumTop,
          child: CustomButton(
            title: LocaleKeys.resetPassword_done.locale.toUpperCase(),
            onClick: () async {
              await _vm.checkEmailVerification()
                  ? appRoutes.navigateRemoveUntil(Routes.Login)
                  : showSnackBar(
                      context: context,
                      content: CustomSnackBarContent(
                        text: LocaleKeys
                            .warningMessages_emailNotYetVerified.locale,
                        iconType: CustomSnackBarType.info,
                      ),
                    );
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
