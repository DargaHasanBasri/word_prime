import 'dart:developer';

import 'package:word_prime/export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseStatefulState<LoginPage> {
  late final LoginViewModel _vm;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<LoginViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppPaddings.paddingXXLargeTop,
              child: _titleSubtitleText(),
            ),
            ValueListenableBuilder(
                valueListenable: _vm.emailInput,
                builder: (_, __, ___) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 36, bottom: 16),
                    child: CustomTextFormField(
                      controller: _emailController,
                      isPrefixIcon: true,
                      prefixIconAddress: AppAssets.icSmsPath,
                      hintText: LocaleKeys.emailHintText.locale,
                      inputType: TextInputType.emailAddress,
                      onChanged: (String text) {
                        _vm.emailInput.value = text;
                      },
                    ),
                  );
                }),
            ValueListenableBuilder(
              valueListenable: _vm.passwordInput,
              builder: (_, __, ___) {
                return ValueListenableBuilder(
                  valueListenable: _vm.isActive,
                  builder: (_, __, ___) {
                    return CustomTextFormField(
                      controller: _passwordController,
                      isPrefixIcon: true,
                      isSuffixIcon: true,
                      isHaveObscure: _vm.isActive.value,
                      prefixIconAddress: AppAssets.icLockPath,
                      suffixIconAddress: _vm.isActive.value == true
                          ? AppAssets.icCloseEyePath
                          : AppAssets.icOpenEyePath,
                      hintText: LocaleKeys.passwordHintText.locale,
                      textInputAction: TextInputAction.done,
                      onPressSuffixIcon: () {
                        _vm.isActive.value = !_vm.isActive.value;
                      },
                      onChanged: (String text) {
                        _vm.passwordInput.value = text;
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => appRoutes.navigateTo(Routes.ForgotPassword),
              child: Text(
                LocaleKeys.loginPage_forgotPassword.locale,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.cornflowerBlue,
                      fontWeight: FontWeight.w700,
                    ),
                textAlign: TextAlign.end,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _vm.emailInput,
              builder: (_, __, ___) {
                return ValueListenableBuilder(
                  valueListenable: _vm.passwordInput,
                  builder: (_, __, ___) {
                    return Padding(
                      padding: AppPaddings.appPaddingVertical,
                      child: CustomButton(
                        title: LocaleKeys.signIn.locale.toUpperCase(),
                        backgroundColor: _vm.isEmptyInputText()
                            ? AppColors.cornflowerBlue
                            : AppColors.cornflowerBlue.withOpacity(0.4),
                        onClick: () {
                          _vm.isEmptyInputText()
                              ? _vm.login(
                                  onLoginSuccess: () {
                                    appRoutes.navigateToReplacement(
                                      Routes.MainTab,
                                    );
                                  },
                                  showProgress: () => showProgress(context),
                                  hideProgress: () => hideProgress(),
                                )
                              : log('Boş bırakılamaz');
                        },
                      ),
                    );
                  },
                );
              },
            ),
            const OrTextContainer(),
            Padding(
              padding: AppPaddings.paddingMediumVertical,
              child: CustomButton(
                title: LocaleKeys.loginPage_withGoogle.locale.toUpperCase(),
                titleColor: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                borderColor: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: 12,
                isIcon: true,
                iconLogoAddress: AppAssets.icGooglePath,
                onClick: () {
                  _vm.loginWithGoogle(
                    onLoginSuccess: () {
                      appRoutes.navigateToReplacement(
                        Routes.MainTab,
                      );
                    },
                    showProgress: () => showProgress(context),
                    hideProgress: () => hideProgress(),
                  );
                },
              ),
            ),
            CustomButton(
              title: LocaleKeys.loginPage_withApple.locale.toUpperCase(),
              titleColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              borderColor: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: 12,
              isIcon: true,
              iconLogoAddress: AppAssets.icApplePath,
              onClick: () {},
            ),
            const Spacer(),
            Padding(
              padding: AppPaddings.paddingLargeBottom,
              child: Center(
                child: _richTextSignUp(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleSubtitleText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.paddingSmallBottom,
          child: Text(
            LocaleKeys.loginPage_welcomeTitle.locale,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Text(
          LocaleKeys.loginPage_welcomeSubTitle.locale,
          style: Theme.of(context).textTheme.titleSmall,
        ),
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
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                appRoutes.navigateTo(Routes.Register);
              },
          ),
        ],
      ),
    );
  }
}
