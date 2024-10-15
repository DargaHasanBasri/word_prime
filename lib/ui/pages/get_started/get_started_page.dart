import 'package:flutter/gestures.dart';
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
      backgroundColor: AppColors.white,
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
          style: TextStyle(
            color: AppColors.mirage,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.paddingSmallTop +
              AppPaddings.appPaddingLargeHorizontal,
          child: Text(
            LocaleKeys.getStartedPage_subTitleMsg.locale,
            style: TextStyle(
              color: AppColors.paleSky,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
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
      toolbarHeight: AppSizes.toolbarHeight,
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
