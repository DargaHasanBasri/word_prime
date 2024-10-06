import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/forgot_password/components/password_reset_method.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BaseStatefulState<ForgotPasswordPage> {
  late final ForgotPasswordViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<ForgotPasswordViewModel>(context, listen: false);
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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.appPaddingVertical,
            child: _titleSubtitleText(),
          ),
          PasswordResetMethod(
            onClick: () {
              appRoutes.navigateTo(
                Routes.ForgotPasswordMethod,
                arguments: 'Email',
              );
            },
            title: LocaleKeys.emailHintText.locale,
            subTitle: LocaleKeys.forgotPassword_enterMailHintText.locale,
            iconAddress: AppAssets.icSmsPath,
          ),
          SizedBox(height: 12),
          PasswordResetMethod(
            onClick: () {
              appRoutes.navigateTo(
                Routes.ForgotPasswordMethod,
                arguments: 'Name',
              );
            },
            title: LocaleKeys.nameHintText.locale,
            subTitle: LocaleKeys.forgotPassword_enterNameHintText.locale,
            iconAddress: AppAssets.icUserPath,
          ),
        ],
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
            LocaleKeys.forgotPassword_forgotTitle.locale,
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          LocaleKeys.forgotPassword_forgotSubTitle.locale,
          style: TextStyle(
            color: AppColors.paleSky,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => appRoutes.popIfBackStackNotEmpty,
        color: AppColors.mirage,
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
