import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/profile_user_details/components/profile_user_details_bottom_sheet.dart';

class ProfileUserFollowedFollowersPage extends StatefulWidget {
  const ProfileUserFollowedFollowersPage({super.key});

  @override
  State<ProfileUserFollowedFollowersPage> createState() =>
      _ProfileUserFollowedFollowersPageState();
}

class _ProfileUserFollowedFollowersPageState
    extends BaseStatefulState<ProfileUserFollowedFollowersPage> {
  late final ProfileUserFollowedFollowersViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<ProfileUserFollowedFollowersViewModel>(context,
        listen: false);
    _vm.getFollowedFollowerAndCheck(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return ValueListenableBuilder(
        valueListenable: _vm.followedUserIdsNotifier,
        builder: (_, followedUserIds, ___) {
          return ValueListenableBuilder(
            valueListenable: _vm.followedOrFollowersNotifier,
            builder: (_, userModel, ___) {
              return ListView.separated(
                padding: AppPaddings.paddingMediumVertical,
                physics: BouncingScrollPhysics(),
                itemCount: userModel?.length ?? 0,
                itemBuilder: (context, index) {
                  final bool isCurrentUser =
                      _vm.currentUserNotifier.value?.userId ==
                          userModel?[index]?.userId;
                  final bool isFollowedUser =
                      followedUserIds?.contains(userModel?[index]?.userId) ??
                          false;
                  return _followerListItem(
                    userModel: userModel?[index],
                    isCurrentUser: isCurrentUser,
                    buttonTitle: isFollowedUser
                        ? LocaleKeys.following.locale
                        : LocaleKeys.follow.locale,
                    onTap: () {
                      isFollowedUser
                          ? showCustomBottomSheet(
                              context: context,
                              child: ProfileUserDetailsBottomSheet(
                                onTapPoke: () {},
                                onTapUnfollow: () async {
                                  await _vm.unFollowUser(
                                    targetUserId: userModel?[index]?.userId,
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
                              targetUserId: userModel?[index]?.userId,
                            );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: AppSizes.sizedBoxMediumHeight,
                ),
              );
            },
          );
        });
  }

  Widget _followerListItem({
    required UserModel? userModel,
    required VoidCallback onTap,
    required String buttonTitle,
    required bool isCurrentUser,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              CustomUserCircleAvatar(
                borderPadding: 0,
                borderWidth: 0,
                circleRadius: 24,
                profileImgAddress: userModel?.profileImageAddress,
              ),
              Padding(
                padding: AppPaddings.paddingSmallLeft,
                child: Text(
                  '${userModel?.userName ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: isCurrentUser
              ? SizedBox()
              : CustomButton(
                  title: buttonTitle,
                  borderRadius: 8,
                  titleVerticalPadding: 6,
                  onClick: () => onTap.call(),
                ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
        _vm.isFollowedPage
            ? LocaleKeys.profilePage_follow.locale
            : LocaleKeys.profilePage_follower.locale,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
