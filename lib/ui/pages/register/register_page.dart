import 'package:word_prime/export.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseStatefulState<RegisterPage> {
  late final RegisterViewModel _vm;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<RegisterViewModel>(context, listen: false);
    super.initState();
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
          padding:
              AppPaddings.paddingMediumTop + AppPaddings.paddingLargeBottom,
          child: _titleSubtitleText(),
        ),
        ValueListenableBuilder(
          valueListenable: _vm.nameInput,
          builder: (_, __, ___) {
            return CustomTextFormField(
              controller: _nameController,
              hintText: LocaleKeys.nameHintText.locale,
              isPrefixIcon: true,
              prefixIconAddress: AppAssets.icUserPath,
              onChanged: (String text) {
                _vm.nameInput.value = text;
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _vm.emailInput,
          builder: (_, __, ___) {
            return Padding(
              padding: AppPaddings.paddingMediumVertical,
              child: CustomTextFormField(
                controller: _emailController,
                hintText: LocaleKeys.emailHintText.locale,
                isPrefixIcon: true,
                prefixIconAddress: AppAssets.icSmsPath,
                onChanged: (String text) {
                  _vm.emailInput.value = text;
                },
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _vm.passwordInput,
          builder: (_, __, ___) {
            return ValueListenableBuilder(
              valueListenable: _vm.isActive,
              builder: (_, __, ___) {
                return CustomTextFormField(
                  controller: _passwordController,
                  hintText: LocaleKeys.registerPage_passwordHintText.locale,
                  isPrefixIcon: true,
                  prefixIconAddress: AppAssets.icLockPath,
                  isHaveObscure: _vm.isActive.value,
                  isSuffixIcon: true,
                  suffixIconAddress: _vm.isActive.value == true
                      ? AppAssets.icCloseEyePath
                      : AppAssets.icOpenEyePath,
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
        ValueListenableBuilder(
          valueListenable: _vm.nameInput,
          builder: (_, __, ___) {
            return ValueListenableBuilder(
              valueListenable: _vm.emailInput,
              builder: (_, __, ___) {
                return ValueListenableBuilder(
                  valueListenable: _vm.passwordInput,
                  builder: (_, __, ___) {
                    return Padding(
                      padding: AppPaddings.appPaddingVertical,
                      child: CustomButton(
                        title: LocaleKeys.signUp.locale.toUpperCase(),
                        backgroundColor: _vm.isEmptyInputText()
                            ? AppColors.cornflowerBlue
                            : AppColors.cornflowerBlue.withOpacity(0.4),
                        onClick: () {
                          _vm.isEmptyInputText()
                              ? _vm.register(
                                  onRegistrationSuccess: () {
                                    appRoutes.navigateTo(
                                      Routes.EmailVerification,
                                      arguments: _vm.emailInput.value,
                                    );
                                  },
                                  showProgress: () => showProgress(context),
                                  hideProgress: () => hideProgress(),
                                  showErrorSnackBar: (String message) {
                                    showSnackBar(
                                      context: context,
                                      content: CustomSnackBarContent(
                                        text: message,
                                        iconType: CustomSnackBarType.error,
                                      ),
                                    );
                                  },
                                )
                              : showSnackBar(
                                  context: context,
                                  content: CustomSnackBarContent(
                                    text: LocaleKeys
                                        .warningMessages_emptySpace.locale,
                                    iconType: CustomSnackBarType.info,
                                  ),
                                );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
        Text(
          LocaleKeys.registerPage_privacyMsg.locale,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        Padding(
          padding: AppPaddings.paddingLargeBottom,
          child: Center(
            child: _richTextSignUp(),
          ),
        ),
      ],
    );
  }

  Widget _titleSubtitleText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.paddingSmallBottom,
          child: Text(
            LocaleKeys.registerPage_registerTitle.locale,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Text(
          LocaleKeys.registerPage_registerSubTitle.locale,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

  Widget _richTextSignUp() {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.registerPage_isSignInMsg.locale,
        style: Theme.of(context).textTheme.titleMedium,
        children: <TextSpan>[
          TextSpan(
            text: ' ${LocaleKeys.signIn.locale}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.cornflowerBlue,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                appRoutes.navigateTo(Routes.Login);
              },
          ),
        ],
      ),
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
