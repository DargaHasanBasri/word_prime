import 'package:flutter/gestures.dart';
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
      backgroundColor: AppColors.backgroundColor,
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
          padding: const EdgeInsets.only(top: 16, bottom: 24),
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
                            ? AppColors.cornflowerBlue.withOpacity(0.4)
                            : AppColors.cornflowerBlue,
                        onClick: () {
                          appRoutes.navigateTo(Routes.Login);
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
          style: TextStyle(
            color: AppColors.mirage,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            LocaleKeys.registerPage_registerTitle.locale,
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          LocaleKeys.registerPage_registerSubTitle.locale,
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
        text: LocaleKeys.registerPage_isSignInMsg.locale,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.mirage,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' ${LocaleKeys.signIn.locale}',
            style: TextStyle(
              fontSize: 16,
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
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => appRoutes.popIfBackStackNotEmpty(),
        color: AppColors.mirage,
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
