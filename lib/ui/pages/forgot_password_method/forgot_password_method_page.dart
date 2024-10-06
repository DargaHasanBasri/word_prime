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
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: ValueListenableBuilder(
            valueListenable: _vm.whichTabBar,
            builder: (_, __, ___) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MethodTabBar(
                    whichMethod: _vm.whichTabBar.value,
                    onTapEmailBar: () {
                      _vm.whichTabBar.value = 'Email';
                    },
                    onTapNameBar: () {
                      _vm.whichTabBar.value = 'Name';
                    },
                  ),
                  _vm.whichTabBar.value == 'Email'
                      ? Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: MethodEmail(
                            emailController: _emailController,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 32),
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
          title: 'Send Link',
          onClick: () {},
        ),
        const Spacer(),
        Center(
          child: _richTextSignUp(),
        ),
        SizedBox(height: 20),
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
