import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/profile_user_details/components/profile_user_details_bottom_sheet.dart';
import 'package:word_prime/ui/pages/profile_user_details/components/profile_user_details_metric.dart';
import 'package:word_prime/ui/widgets/profile_post_item.dart';

class ProfileUserDetailsPage extends StatefulWidget {
  const ProfileUserDetailsPage({super.key});

  @override
  State<ProfileUserDetailsPage> createState() => _ProfileUserDetailsPageState();
}

class _ProfileUserDetailsPageState
    extends BaseStatefulState<ProfileUserDetailsPage>
    with SingleTickerProviderStateMixin {
  late final ProfileUserDetailsViewModel _vm;
  late TabController _tabController;

  @override
  void initState() {
    _vm = Provider.of<ProfileUserDetailsViewModel>(context, listen: false);
    _tabController = TabController(length: 3, vsync: this);
    _vm.getAddedAndSavedPosts(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, value) {
        return [
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: _vm.isFollowed,
              builder: (_, __, ___) {
                return ValueListenableBuilder(
                  valueListenable: _vm.userNotifier,
                  builder: (_, __, ___) {
                    bool isCurrentUser =
                        _vm.userId == _vm.currentUserNotifier.value?.userId;
                    return ProfileUserDetailsMetric(
                      userModel: _vm.userNotifier.value,
                      isCurrentUser: isCurrentUser,
                      onTapFollowButton: () {
                        _vm.isFollowed.value
                            ? showCustomBottomSheet(
                                context: context,
                                child: ProfileUserDetailsBottomSheet(
                                  onTapPoke: () {},
                                  onTapUnfollow: () async {
                                    await _vm.unFollowUser(
                                      showProgress: () => showProgress(context),
                                      hideProgress: () => hideProgress(),
                                    );
                                    appRoutes.popIfBackStackNotEmpty();
                                  },
                                ),
                              )
                            : _vm.followUser(
                                showProgress: () => showProgress(context),
                                hideProgress: () => hideProgress(),
                              );
                      },
                      buttonTitle: _vm.isFollowed.value
                          ? LocaleKeys.following.locale
                          : LocaleKeys.follow.locale,
                      onTapFollowing: () {
                        appRoutes.navigateTo(
                          Routes.ProfileUserFollowedFollowers,
                          arguments: [
                            true,
                            _vm.userId,
                            _vm.currentUserNotifier,
                          ],
                        );
                      },
                      onTapFollowers: () {
                        appRoutes.navigateTo(
                          Routes.ProfileUserFollowedFollowers,
                          arguments: [
                            false,
                            _vm.userId,
                            _vm.currentUserNotifier,
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ];
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.paddingSmallVertical,
            child: TabBar(
              dividerColor: Colors.transparent,
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                insets: EdgeInsets.symmetric(horizontal: 50),
              ),
              tabs: [
                Tab(
                  icon: _tabBarIcon(iconAddress: AppAssets.icTabBarPost),
                ),
                Tab(
                  icon: _tabBarIcon(iconAddress: AppAssets.icTabBarSaved),
                ),
                Tab(
                  icon: _tabBarIcon(iconAddress: AppAssets.icTabBarLiked),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _vm.likedPostsNotifier,
              builder: (_, __, ___) {
                return ValueListenableBuilder(
                  valueListenable: _vm.savedPostsNotifier,
                  builder: (_, __, ___) {
                    return ValueListenableBuilder(
                      valueListenable: _vm.addedPostsNotifier,
                      builder: (_, __, ___) {
                        return TabBarView(
                          controller: _tabController,
                          children: [
                            _buildGridView(
                                postModel: _vm.addedPostsNotifier.value),
                            _buildGridView(
                                postModel: _vm.savedPostsNotifier.value),
                            _buildGridView(
                                postModel: _vm.likedPostsNotifier.value),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBarIcon({required String? iconAddress}) {
    return Image.asset(
      iconAddress ?? AppAssets.icTabBarPost,
      width: AppSizes.appOverallIconWidth,
      height: AppSizes.appOverallIconHeight,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  Widget _buildGridView({required List<PostModel?>? postModel}) {
    return Padding(
      padding: AppPaddings.appPaddingHorizontal,
      child: GridView.builder(
        padding: AppPaddings.appPaddingVertical,
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
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.rhino,
      leading: IconButton(
        onPressed: () {
          appRoutes.popIfBackStackNotEmpty();
          eventBus.fire(new RefreshUserInfoEvent());
        },
        icon: Image.asset(
          AppAssets.icArrowBackLeftPath,
          color: AppColors.white,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ),
      title: Text(
        LocaleKeys.settings_profileDetails.locale,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
            ),
      ),
    );
  }
}
