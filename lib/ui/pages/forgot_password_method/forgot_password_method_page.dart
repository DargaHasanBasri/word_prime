import 'package:word_prime/export.dart';

class ForgotPasswordMethodPage extends StatefulWidget {
  const ForgotPasswordMethodPage({super.key});

  @override
  State<ForgotPasswordMethodPage> createState() =>
      _ForgotPasswordMethodPageState();
}

class _ForgotPasswordMethodPageState
    extends BaseStatefulState<ForgotPasswordMethodPage> {
  late final ForgotPasswordMethodViewModel _vm;
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<ForgotPasswordMethodViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      children: [
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: emailMethod(),
        ),
        ValueListenableBuilder(
            valueListenable: _vm.emailInput,
            builder: (_, __, ___) {
              return CustomButton(
                title: LocaleKeys.forgotPassword_sendLink.locale.toUpperCase(),
                backgroundColor: _vm.emailInput.value.isNotEmpty
                    ? AppColors.cornflowerBlue
                    : AppColors.cornflowerBlue.withOpacity(0.4),
                onClick: () async {
                  _vm.emailInput.value.isNotEmpty
                      ? _vm.processPasswordReset(
                          showProgress: () => showProgress(context),
                          hideProgress: () => hideProgress(),
                          onSendLinkSuccess: () {
                            appRoutes.navigateTo(
                              Routes.ResetPassword,
                              arguments: _emailController.text,
                            );
                          },
                          showErrorSnackBar: () {
                            showSnackBar(
                              context: context,
                              content: CustomSnackBarContent(
                                text: LocaleKeys
                                    .warningMessages_unexpectedError.locale,
                                iconType: CustomSnackBarType.error,
                              ),
                            );
                          },
                        )
                      : showSnackBar(
                          context: context,
                          content: CustomSnackBarContent(
                            text: LocaleKeys.warningMessages_emptySpace.locale,
                            iconType: CustomSnackBarType.info,
                          ),
                        );
                },
              );
            }),
        const Spacer(),
        Center(
          child: _richTextSignUp(),
        ),
        SizedBox(height: AppSizes.appOverallIconHeight),
      ],
    );
  }

  Widget _richTextSignUp() {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.loginPage_isSignUpMsg.locale,
        style: Theme.of(context).textTheme.titleMedium,
        children: <TextSpan>[
          TextSpan(
            text: ' ${LocaleKeys.signUp.locale}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.cornflowerBlue,
                  fontWeight: FontWeight.w700,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                appRoutes.navigateRemoveUntil(Routes.Register);
              },
          ),
        ],
      ),
    );
  }

  Widget emailMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.forgotPassword_enterMailHintText.locale,
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
        SizedBox(height: AppSizes.sizedBoxSmallHeight),
        Text(
          LocaleKeys.forgotPassword_forgotMethodEmailMsg.locale,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: AppSizes.sizedBoxLargeHeight),
        CustomTextFormField(
          controller: _emailController,
          hintText: LocaleKeys.emailHintText.locale,
          isPrefixIcon: true,
          prefixIconAddress: AppAssets.icSmsPath,
          onChanged: (String text) {
            _vm.emailInput.value = text;
          },
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
