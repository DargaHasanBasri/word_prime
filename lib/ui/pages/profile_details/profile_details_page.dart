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

  @override
  void initState() {
    _vm = Provider.of<ProfileDetailsViewModel>(context, listen: false);
    _vm.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.cornflowerBlue,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _vm.fullNameInput,
          builder: (_, __, ___) {
            _fullNameController.text = _vm.fullNameInput.value;
            return CustomTextFormField(
              controller: _fullNameController,
              textFieldTitle: LocaleKeys.profileDetail_fullNameTitle.locale,
              textFieldTitleColor: Theme.of(context).colorScheme.secondary,
              onChanged: (String text) {
                _vm.fullNameInput.value = text;
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _vm.emailInput,
          builder: (_, __, ___) {
            _emailController.text = _vm.emailInput.value;
            return Padding(
              padding: AppPaddings.paddingMediumVertical,
              child: CustomTextFormField(
                controller: _emailController,
                inputType: TextInputType.emailAddress,
                textFieldTitle: LocaleKeys.profileDetail_emailTitle.locale,
                textFieldTitleColor: Theme.of(context).colorScheme.secondary,
                onChanged: (String text) {
                  _vm.emailInput.value = text;
                },
              ),
            );
          },
        ),
        const Spacer(),
        ValueListenableBuilder(
          valueListenable: _vm.emailInput,
          builder: (_, __, ___) {
            return CustomButton(
              title: 'PAROLA SIFIRLA',
              onClick: () {
                _vm.emailInput.value.isNotEmpty
                    ? _vm.processPasswordReset(
                        showProgress: () => showProgress(context),
                        hideProgress: () => hideProgress(),
                        onSendLinkSuccess: () {
                          appRoutes.navigateTo(
                            Routes.ResetPassword,
                            arguments: _vm.emailInput.value,
                          );
                        },
                        showErrorSnackBar: () {
                          showSnackBar(
                            context: context,
                            content: CustomSnackBarContent(
                              text: LocaleKeys
                                  .warningMessages_unexpectedError.locale,
                              iconType: CustomSnackBarType.error,
                            ),
                          );
                        },
                      )
                    : showSnackBar(
                        context: context,
                        content: CustomSnackBarContent(
                          text: LocaleKeys.warningMessages_emptySpace.locale,
                          iconType: CustomSnackBarType.info,
                        ),
                      );
              },
            );
          },
        ),
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: CustomButton(
            title: LocaleKeys.profileDetail_update.locale.toUpperCase(),
            onClick: () {
              _vm.profileDetailsUpdate();
            },
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => appRoutes.popIfBackStackNotEmpty(),
        icon: Image.asset(
          AppAssets.icArrowBackLeftPath,
          color: Theme.of(context).colorScheme.secondary,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ),
      title: Text(
        LocaleKeys.profileDetail_title.locale,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
