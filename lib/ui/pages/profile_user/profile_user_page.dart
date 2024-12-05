import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/profile_user/components/profile_user_tab_bar.dart';
import 'package:word_prime/ui/widgets/profile_post_item.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends BaseStatefulState<ProfileUserPage> {
  late final ProfileUserViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<ProfileUserViewModel>(context, listen: false);
    _vm.getAddedAndSavedPosts(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ValueListenableBuilder(
              valueListenable: _vm.userNotifier,
              builder: (_, __, ___) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: AppPaddings.paddingMediumTop,
                      child: _userInfo(),
                    ),
                    Padding(
                      padding: AppPaddings.paddingLargeTop,
                      child: _userProfileMetric(),
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _vm.tabIndex,
              builder: (_, __, ___) {
                return Column(
                  children: [
                    Padding(
                      padding: AppPaddings.paddingMediumVertical,
                      child: ProfileUserTabBar(
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
      ),
    );
  }

  Widget _buildGridView({required List<PostModel?>? postModel}) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: postModel?.length ?? 0,
      itemBuilder: (context, index) {
        final post = postModel?[index];
        return ProfilePostItem(
          postModel: post,
        );
      },
    );
  }

  Widget _userProfileMetric() {
    return Container(
      padding: AppPaddings.paddingSmallVertical,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColors.platinum.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${_vm.userNotifier.value?.totalPost ?? 0}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Word',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(width: AppSizes.sizedBoxSmallWidth),
              Row(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Score',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: AppSizes.sizedBoxOverallWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Following',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(width: AppSizes.sizedBoxSmallWidth),
              Row(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Followers',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: AppSizes.sizedBoxOverallWidth),
          Expanded(
            child: CustomButton(
              title: 'FOLLOW',
              borderRadius: 16,
              onClick: () {
                appRoutes.navigateTo(Routes.Settings);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomUserCircleAvatar(
              circleRadius: 40,
              borderPadding: 0,
              profileImgAddress: _vm.userNotifier.value?.profileImageAddress,
            ),
            SizedBox(width: AppSizes.sizedBoxMediumWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_vm.userNotifier.value?.userName ?? ''}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: AppSizes.sizedBoxXSmallWidth),
                  Text(
                    "Why do we use it? It is a long established fact that a reader will"
                    "be distracted by lorem ipsum lorem ipsum lorem ipsum lorem"
                    " ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          appRoutes.popIfBackStackNotEmpty();
        },
        icon: Image.asset(
          AppAssets.icArrowBackLeftPath,
          color: Theme.of(context).colorScheme.secondary,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ),
      title: ValueListenableBuilder(
        valueListenable: _vm.userNotifier,
        builder: (_, __, ___) {
          return Text(
            '${_vm.userNotifier.value?.userName ?? ''}',
            style: Theme.of(context).textTheme.headlineSmall,
          );
        },
      ),
    );
  }
}
