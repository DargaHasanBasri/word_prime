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
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ValueListenableBuilder(
      valueListenable: _vm.userNotifier,
      builder: (_, __, ___) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: AppPaddings.paddingXXLargeBottom * 2,
                  child: CurrentUserProfileInfo(
                    userName: _vm.userNotifier.value?.userName,
                    userEmail: _vm.userNotifier.value?.email,
                    profileImageAddress:
                        _vm.userNotifier.value?.profileImageAddress,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 24,
              top: 180,
              right: 24,
              child: Column(
                children: [
                  _currentProfileDetail(
                    totalPost: _vm.userNotifier.value?.totalPost,
                    score: _vm.userNotifier.value?.totalScore,
                    followCount: 0,
                    followerCount: 0,
                  ),
                  Padding(
                    padding: AppPaddings.paddingLargeTop,
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
            ),
          ],
        );
      },
    );
  }

  Widget _currentProfileDetail({
    int? totalPost,
    int? score,
    int? followCount,
    int? followerCount,
  }) {
    return Container(
      padding:
          AppPaddings.paddingMediumVertical + AppPaddings.paddingMediumLeft,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
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
                  detailCount: totalPost ?? 0,
                  detailIcon: AppAssets.appLogoPath,
                  detailColor: AppColors.cornflowerBlue,
                  onTap: () {},
                ),
                SizedBox(height: AppSizes.sizedBoxMediumHeight),
                ProfileDetailContainer(
                  detailTitle: LocaleKeys.level.locale,
                  detailCount: score ?? 0,
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
                  detailCount: followCount ?? 0,
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
                  detailCount: followerCount ?? 0,
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
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.rhino,
      title: Text(
        LocaleKeys.profilePage_myProfile.locale,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
      ),
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
