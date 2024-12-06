import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/profile/components/profile_detail_container.dart';
import 'package:word_prime/ui/pages/profile/components/current_user_profile_info.dart';
import 'package:word_prime/ui/widgets/profile_post_item.dart';
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
    _vm.getAddedAndSavedPosts(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );
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
      valueListenable: _vm.currentUserNotifier,
      builder: (_, __, ___) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CurrentUserProfileInfo(
                      userName: _vm.currentUserNotifier.value?.userName,
                      userEmail: _vm.currentUserNotifier.value?.email,
                      profileImageAddress:
                          _vm.currentUserNotifier.value?.profileImageAddress,
                    ),
                    Positioned(
                      left: 0,
                      top: 140,
                      right: 0,
                      child: Padding(
                        padding: AppPaddings.appPaddingHorizontal,
                        child: ProfileDetailContainer(
                          userModel: _vm.currentUserNotifier.value,
                          onTapScoreButton: () {},
                          onTapWordButton: () {},
                          onTapFollowButton: () {
                            appRoutes.navigateTo(
                              Routes.FollowerFollow,
                              arguments: true,
                            );
                          },
                          onTapFollowerButton: () {
                            appRoutes.navigateTo(
                              Routes.FollowerFollow,
                              arguments: false,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ValueListenableBuilder(
                valueListenable: _vm.tabIndex,
                builder: (_, __, ___) {
                  return Column(
                    children: [
                      Padding(
                        padding: AppPaddings.appPaddingAll,
                        child: ProfileTabBar(
                          whichIndex: _vm.tabIndex,
                        ),
                      ),
                      Padding(
                        padding: AppPaddings.appPaddingMainTabBottom,
                        child: ValueListenableBuilder(
                          valueListenable: _vm.savedPostsNotifier,
                          builder: (_, __, ___) {
                            return ValueListenableBuilder(
                              valueListenable: _vm.addedPostsNotifier,
                              builder: (_, __, ___) {
                                return _buildGridView(
                                  postModel: _vm.tabIndex.value == 0
                                      ? _vm.addedPostsNotifier.value
                                      : _vm.tabIndex.value == 1
                                          ? _vm.savedPostsNotifier.value
                                          : _vm.addedPostsNotifier.value,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGridView({required List<PostModel?>? postModel}) {
    return GridView.builder(
      padding: AppPaddings.appPaddingHorizontal,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: postModel?.length ?? 0,
      itemBuilder: (context, index) {
        final currentPost = postModel?[index];
        return ProfilePostItem(
          postModel: currentPost,
          onTapPost: () {
            appRoutes.navigateTo(
              Routes.PostDetail,
              arguments: [
                currentPost,
                _vm.currentUserNotifier,
              ],
            );
          },
        );
      },
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
