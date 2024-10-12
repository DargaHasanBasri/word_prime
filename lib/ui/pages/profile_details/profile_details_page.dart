import 'package:word_prime/export.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends BaseStatefulState<ProfileDetailsPage> {
  late final ProfileDetailsViewModel _vm;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<ProfileDetailsViewModel>(context, listen: false);
    _fullNameController.text = 'Test User';
    _emailController.text = 'test@gmail.com';
    _passwordController.text = 'testUser?123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
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
          padding: AppPaddings.paddingMediumVertical,
          child: Center(
            child: CustomUserCircleAvatar(circleRadius: 40),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingLargeBottom,
          child: Text(
            LocaleKeys.profileDetail_changePicture.locale,
            style: TextStyle(
              color: AppColors.cornflowerBlue,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _vm.fullNameInput,
          builder: (_, __, ___) {
            return CustomTextFormField(
              controller: _fullNameController,
              textFieldTitle: LocaleKeys.profileDetail_fullNameTitle.locale,
              textFieldTitleColor: AppColors.mirage,
              onChanged: (String text) {
                _vm.fullNameInput.value = text;
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _vm.emailInput,
          builder: (_, __, ___) {
            return Padding(
              padding: AppPaddings.paddingMediumVertical,
              child: CustomTextFormField(
                controller: _emailController,
                inputType: TextInputType.emailAddress,
                textFieldTitle: LocaleKeys.profileDetail_emailTitle.locale,
                textFieldTitleColor: AppColors.mirage,
                onChanged: (String text) {
                  _vm.emailInput.value = text;
                },
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _vm.passwordInput,
          builder: (_, __, ___) {
            return ValueListenableBuilder(
              valueListenable: _vm.isActive,
              builder: (_, __, ___) {
                return CustomTextFormField(
                  controller: _passwordController,
                  textFieldTitle: LocaleKeys.profileDetail_passwordTitle.locale,
                  textFieldTitleColor: AppColors.mirage,
                  textInputAction: TextInputAction.done,
                  isHaveObscure: _vm.isActive.value,
                  isSuffixIcon: true,
                  suffixIconAddress: _vm.isActive.value == true
                      ? AppAssets.icCloseEyePath
                      : AppAssets.icLockPath,
                  onPressSuffixIcon: () {
                    _vm.isActive.value = !_vm.isActive.value;
                  },
                  onChanged: (String text) {
                    _vm.passwordInput.value = text;
                  },
                );
              },
            );
          },
        ),
        const Spacer(),
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: CustomButton(
            title: LocaleKeys.profileDetail_update.locale,
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => appRoutes.popIfBackStackNotEmpty(),
        color: AppColors.mirage,
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      title: Text(
        LocaleKeys.profileDetail_title.locale,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    );
  }
}
