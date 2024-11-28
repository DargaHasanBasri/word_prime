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
      resizeToAvoidBottomInset: false,
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
        Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                LocaleKeys.getStartedPage_titleMsg.locale,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: AppPaddings.paddingSmallTop,
                child: Text(
                  LocaleKeys.getStartedPage_subTitleMsg.locale,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: AppPaddings.appPaddingLargeVertical,
                child: CustomButton(
                  title: LocaleKeys.getStartedPage_title.locale.toUpperCase(),
                  onClick: () {
                    appRoutes.navigateTo(Routes.Register);
                  },
                ),
              ),
            ],
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
                appRoutes.navigateRemoveUntil(Routes.Login);
              },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
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
