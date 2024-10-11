import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/home/components/post_list_item.dart';
import 'package:word_prime/ui/pages/home/components/user_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  late final HomeViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<HomeViewModel>(context, listen: false);
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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24),
            child: SizedBox(
              height: AppSizes.sizedBoxUserListViewHeight,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return UserListItem();
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: AppSizes.sizedBoxMediumWidth,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return PostListItem(
                isActiveLike: _vm.isActiveLike,
                isActiveSave: _vm.isActiveSave,
                onTabLike: () {
                  _vm.isActiveLike.value = !_vm.isActiveLike.value;
                },
                onTabSave: () {
                  _vm.isActiveSave.value = !_vm.isActiveSave.value;
                },
                onTabComment: () {},
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: AppSizes.sizedBoxSmallWidth,
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
      title: Row(
        children: [
          Text(
            'Welcome, Zephyra \u{1F44B}',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          CustomUserCircleAvatar(
            circleRadius: 14,
            borderPadding: 0,
            profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
          ),
          SizedBox(width: AppSizes.sizedBoxSmallWidth),
          Image.asset(
            AppAssets.icNotificationPath,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconWidth,
          ),
        ],
      ),
    );
  }
}
