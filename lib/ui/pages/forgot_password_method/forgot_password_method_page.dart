import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/forgot_password_method/components/method_email.dart';
import 'package:word_prime/ui/pages/forgot_password_method/components/method_name.dart';
import 'package:word_prime/ui/pages/forgot_password_method/components/method_tab_bar.dart';

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
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<ForgotPasswordMethodViewModel>(context, listen: false);
    _vm.whichTabBar.value = _vm.whichMethod;
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
          child: ValueListenableBuilder(
            valueListenable: _vm.whichTabBar,
            builder: (_, __, ___) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MethodTabBar(
                    whichMethod: _vm.whichTabBar.value,
                    onTapEmailBar: () {
                      _vm.whichTabBar.value =
                          AppLocaleConstants.FORGOT_METHOD_EMAIL;
                    },
                    onTapNameBar: () {
                      _vm.whichTabBar.value =
                          AppLocaleConstants.FORGOT_METHOD_NAME;
                    },
                  ),
                  _vm.whichTabBar.value ==
                          AppLocaleConstants.FORGOT_METHOD_EMAIL
                      ? Padding(
                          padding: AppPaddings.paddingXLargeTop,
                          child: MethodEmail(
                            emailController: _emailController,
                          ),
                        )
                      : Padding(
                          padding: AppPaddings.paddingXLargeTop,
                          child: MethodName(
                            nameController: _nameController,
                          ),
                        ),
                ],
              );
            },
          ),
        ),
        CustomButton(
          title: LocaleKeys.forgotPassword_sendLink.locale.toUpperCase(),
          onClick: () {
            appRoutes.navigateTo(Routes.Login);
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
