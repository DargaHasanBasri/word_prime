import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/profile/components/profile_detail_container.dart';
import 'package:word_prime/ui/pages/profile/components/current_user_profile_info.dart';
import 'package:word_prime/ui/pages/profile/components/profile_tab_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseStatefulState<ProfilePage> {
  late final ProfileViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<ProfileViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: AppPaddings.paddingXXLargeBottom * 2,
              child: CurrentUserProfileInfo(),
            ),
            Padding(
              padding: AppPaddings.appPaddingLargeHorizontal,
              child: ValueListenableBuilder(
                valueListenable: _vm.tabIndex,
                builder: (_, __, ___) {
                  return ProfileTabBar(
                    whichIndex: _vm.tabIndex,
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          left: 24,
          top: 170,
          right: 24,
          child: _currentProfileDetail(),
        ),
      ],
    );
  }

  Widget _currentProfileDetail() {
    return Container(
      padding:
          AppPaddings.paddingMediumVertical + AppPaddings.paddingMediumLeft,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            offset: Offset(0, 8),
            blurRadius: 28,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailContainer(
                  detailTitle: LocaleKeys.word.locale,
                  detailCount: 12,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.cornflowerBlue,
                  onTap: () {},
                ),
                SizedBox(height: AppSizes.sizedBoxMediumHeight),
                ProfileDetailContainer(
                  detailTitle: LocaleKeys.level.locale,
                  detailCount: 50,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.goldenDream,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailContainer(
                  detailTitle: LocaleKeys.profilePage_follow.locale,
                  detailCount: 98,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.greenishTeal,
                  onTap: () {
                    appRoutes.navigateTo(
                      Routes.FollowerFollow,
                      arguments: true,
                    );
                  },
                ),
                SizedBox(height: AppSizes.sizedBoxMediumHeight),
                ProfileDetailContainer(
                  detailTitle: LocaleKeys.profilePage_follower.locale,
                  detailCount: 5,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.metallicBlue,
                  onTap: () {
                    appRoutes.navigateTo(
                      Routes.FollowerFollow,
                      arguments: false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.rhino,
      toolbarHeight: AppSizes.toolbarHeight,
      title: Text(
        LocaleKeys.profilePage_myProfile.locale,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: AppPaddings.paddingMediumRight,
          child: GestureDetector(
            onTap: () {
              appRoutes.navigateTo(Routes.Settings);
            },
            child: Image.asset(
              AppAssets.icSettingsPath,
              width: AppSizes.appOverallIconWidth,
              height: AppSizes.appOverallIconHeight,
            ),
          ),
        ),
      ],
    );
  }
}
