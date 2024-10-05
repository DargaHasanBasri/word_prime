import 'package:flutter/material.dart';
import 'package:word_prime/base/base_stateful_state.dart';
import 'package:word_prime/generated/locale_keys.g.dart';
import 'package:word_prime/ui/pages/login/login_view_model.dart';
import 'package:word_prime/ui/widgets/custom_button.dart';
import 'package:word_prime/ui/widgets/custom_text_form_field.dart';
import 'package:word_prime/utils/app_assets.dart';
import 'package:word_prime/utils/app_colors.dart';
import 'package:word_prime/utils/app_paddings.dart';
import 'package:word_prime/utils/string_localizations_ext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseStatefulState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    LoginViewModel _vm = LoginViewModel();
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: AppPaddings.appPaddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 8),
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
                Padding(
                  padding: const EdgeInsets.only(top: 36, bottom: 16),
                  child: CustomTextFormField(
                    controller: _emailController,
                    isPrefixIcon: true,
                    prefixIconAddress: AppAssets.icSmsPath,
                    hintText: LocaleKeys.emailHintText.locale,
                    inputType: TextInputType.emailAddress,
                  ),
                ),
                ValueListenableBuilder(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: CustomButton(
                    title: LocaleKeys.signIn.locale,
                    onClick: () {},
                  ),
                ),
                _orTextContainer(),
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
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: RichText(
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
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _orTextContainer() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.softPeach,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingMediumHorizontal,
          child: Text(
            LocaleKeys.or.locale,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.santaGrey,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.softPeach,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
