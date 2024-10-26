import 'package:word_prime/export.dart';

class FollowerFollowPage extends StatefulWidget {
  const FollowerFollowPage({super.key});

  @override
  State<FollowerFollowPage> createState() => _FollowerFollowPageState();
}

class _FollowerFollowPageState extends BaseStatefulState<FollowerFollowPage> {
  late final FollowerFollowViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<FollowerFollowViewModel>(context, listen: false);
    _vm.isFollowOrFollower.value = _vm.isFollow;
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
    return ListView.separated(
      padding: AppPaddings.paddingMediumVertical,
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) => _followerListItem(),
      separatorBuilder: (context, index) => SizedBox(
        height: AppSizes.sizedBoxMediumHeight,
      ),
    );
  }

  Widget _followerListItem() {
    return Row(
      children: [
        CustomUserCircleAvatar(
          borderPadding: 0,
          borderWidth: 0,
          circleRadius: 24,
          profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: AppPaddings.paddingSmallLeft,
            child: Text(
              AppLocaleConstants.DEFAULT_USER_NAME,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: AppPaddings.paddingLargeLeft,
            child: CustomButton(
              title: LocaleKeys.follow.locale,
              borderRadius: 8,
              titleVerticalPadding: 6,
            ),
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
      title: ValueListenableBuilder(
        valueListenable: _vm.isFollowOrFollower,
        builder: (_, __, ___) {
          return Text(
            _vm.isFollowOrFollower.value
                ? LocaleKeys.profilePage_follow.locale
                : LocaleKeys.profilePage_follower.locale,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          );
        },
      ),
    );
  }
}
