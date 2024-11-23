import 'package:word_prime/export.dart';

class AddPostSuccessfulPage extends StatefulWidget {
  const AddPostSuccessfulPage({super.key});

  @override
  State<AddPostSuccessfulPage> createState() => _AddPostSuccessfulPageState();
}

class _AddPostSuccessfulPageState
    extends BaseStatefulState<AddPostSuccessfulPage> {
  late final AddPostSuccessfulViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<AddPostSuccessfulViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _successContent(),
        ),
        _customButtonsColumn(),
      ],
    );
  }

  Widget _successContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(AppAssets.imgSuccessfulPath),
        ),
        Padding(
          padding: AppPaddings.paddingSmallVertical,
          child: Text(
            LocaleKeys.addPost_successTitle.locale,
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          LocaleKeys.addPost_successMsg.locale,
          style: TextStyle(
            color: AppColors.paleSky,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _customButtonsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          title: LocaleKeys.addPost_buttonTitle.locale,
          onClick: () {
            appRoutes.navigateRemoveUntil(Routes.MainTab);
          },
        ),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: CustomButton(
            title: LocaleKeys.addPost_backHome.locale,
            titleColor: AppColors.mirage,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.mirage,
            onClick: () {
              appRoutes.navigateTo(Routes.MainTab);
            },
          ),
        ),
      ],
    );
  }
}
