import 'package:word_prime/export.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState
    extends BaseStatefulState<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: AppPaddings.paddingXLargeBottom,
          child: Image.asset(
            AppAssets.icEmailVerificationPath,
            height: AppSizes.firstHundredContainerWidth,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Text(
          LocaleKeys.emailVerificationPage_title.locale,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.sizedBoxOverallHeight),
        Text(
          LocaleKeys.emailVerificationPage_titleMsg.locale,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.paddingXXLargeTop,
          child: CustomButton(
            title: LocaleKeys.emailVerificationPage_resendEmail.locale
                .toUpperCase(),
            onClick: () {},
          ),
        ),
        Padding(
          padding: AppPaddings.paddingLargeTop,
          child: CustomButton(
            title:
                LocaleKeys.emailVerificationPage_backLogin.locale.toUpperCase(),
            onClick: () {
              appRoutes.navigateRemoveUntil(Routes.Login);
            },
          ),
        ),
      ],
    );
  }
}
