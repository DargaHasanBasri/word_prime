import 'dart:developer';

import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/forgot_password_method/components/method_email.dart';

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
      children: [
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: MethodEmail(
            emailController: _emailController,
          ),
        ),
        CustomButton(
          title: LocaleKeys.forgotPassword_sendLink.locale.toUpperCase(),
          onClick: () async {
            bool result = await _vm.processPasswordReset(
              email: _emailController.text.trim(),
              showProgress: () => showProgress(context),
              hideProgress: () => hideProgress(),
            );

            result
                ? appRoutes.navigateTo(
                    Routes.ResetPassword,
                    arguments: _emailController.text,
                  )
                : log('Failed to process password reset.');
          },
        ),
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
                appRoutes.navigateTo(Routes.Register);
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
