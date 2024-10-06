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
      backgroundColor: AppColors.white,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
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
                                  : AppAssets.icLockPath,
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
                    Text(
                      LocaleKeys.loginPage_forgotPassword.locale,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.cornflowerBlue,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    ValueListenableBuilder(
                      valueListenable: _vm.emailInput,
                      builder: (_, __, ___) {
                        return ValueListenableBuilder(
                          valueListenable: _vm.passwordInput,
                          builder: (_, __, ___) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: CustomButton(
                                title: LocaleKeys.signIn.locale,
                                backgroundColor: _vm.isEmptyInputText()
                                    ? AppColors.cornflowerBlue.withOpacity(0.4)
                                    : AppColors.cornflowerBlue,
                                onClick: () {},
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const OrTextContainer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CustomButton(
                        title: LocaleKeys.loginPage_withApple.locale,
                        titleColor: AppColors.mirage,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.softPeach,
                        borderRadius: 12,
                        isIcon: true,
                        iconLogoAddress: AppAssets.icApplePath,
                        onClick: () {},
                      ),
                    ),
                    CustomButton(
                      title: LocaleKeys.loginPage_withGoogle.locale,
                      titleColor: AppColors.mirage,
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.softPeach,
                      borderRadius: 12,
                      isIcon: true,
                      iconLogoAddress: AppAssets.icGooglePath,
                      onClick: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            LocaleKeys.loginPage_welcomeTitle.locale,
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          LocaleKeys.loginPage_welcomeSubTitle.locale,
          style: TextStyle(
            color: AppColors.paleSky,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _richTextSignUp() {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.loginPage_isSignUpMsg.locale,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.mirage,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' ${LocaleKeys.signUp.locale}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.cornflowerBlue,
            ),
          ),
        ],
      ),
    );
  }
}
