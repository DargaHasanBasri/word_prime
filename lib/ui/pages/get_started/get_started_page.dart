import 'package:word_prime/export.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends BaseStatefulState<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(AppAssets.imgImgGetStartedPath),
        ),
        Text(
          LocaleKeys.getStartedPage_titleMsg.locale,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.paddingSmallTop +
              AppPaddings.appPaddingLargeHorizontal,
          child: Text(
            LocaleKeys.getStartedPage_subTitleMsg.locale,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: AppPaddings.appPaddingHorizontal +
              AppPaddings.appPaddingLargeVertical,
          child: CustomButton(
            title: LocaleKeys.getStartedPage_title.locale.toUpperCase(),
            onClick: () {
              appRoutes.navigateTo(Routes.Login);
            },
          ),
        ),
        Spacer(),
        Center(
          child: Padding(
            padding: AppPaddings.paddingLargeBottom,
            child: _richTextSignUp(),
          ),
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
                  color: AppColors.cornflowerBlue,
                  fontWeight: FontWeight.w700,
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.appLogoPath,
            width: 16,
            height: 24,
          ),
          SizedBox(width: AppSizes.sizedBoxMediumWidth),
          Text(
            LocaleKeys.appTitle.locale,
            style: TextStyle(
              color: AppColors.cornflowerBlue,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
