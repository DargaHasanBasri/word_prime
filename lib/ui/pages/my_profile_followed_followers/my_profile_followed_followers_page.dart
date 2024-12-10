import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/profile_user_details/components/profile_user_details_bottom_sheet.dart';

class MyProfileFollowedFollowersPage extends StatefulWidget {
  const MyProfileFollowedFollowersPage({super.key});

  @override
  State<MyProfileFollowedFollowersPage> createState() =>
      _MyProfileFollowedFollowersPageState();
}

class _MyProfileFollowedFollowersPageState
    extends BaseStatefulState<MyProfileFollowedFollowersPage> {
  late final MyProfileFollowedFollowersViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<MyProfileFollowedFollowersViewModel>(
      context,
      listen: false,
    );
    _vm.getFollowedAndFollower(
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
      valueListenable: _vm.followedOrFollowersNotifier,
      builder: (_, userModel, ___) {
        return ListView.separated(
          padding: AppPaddings.paddingMediumVertical,
          physics: BouncingScrollPhysics(),
          itemCount: userModel?.length ?? 0,
          itemBuilder: (context, index) {
            return _followerListItem(
              userModel: userModel?[index],
              buttonTitle: _vm.isFollowedPage
                  ? LocaleKeys.following.locale
                  : LocaleKeys.follow.locale,
              onTap: () {
                _vm.isFollowedPage
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
  }

  Widget _followerListItem({
    required UserModel? userModel,
    required VoidCallback onTap,
    required String buttonTitle,
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
          child: CustomButton(
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
