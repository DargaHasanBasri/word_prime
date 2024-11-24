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
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<HomeViewModel>(context, listen: false);
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPaddings.paddingLargeTop,
            child: SizedBox(
              height: AppSizes.sizedBoxUserListViewHeight,
              child: ListView.separated(
                padding: AppPaddings.paddingMediumHorizontal,
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
          SizedBox(height: AppSizes.sizedBoxMediumHeight),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return PostListItem(
                isActiveLike: _vm.isActiveLike,
                isActiveSave: _vm.isActiveSave,
                isTranslate: _vm.isActiveTranslate,
                onTabLike: () {
                  _vm.isActiveLike.value = !_vm.isActiveLike.value;
                },
                onTabSave: () {
                  _vm.isActiveSave.value = !_vm.isActiveSave.value;
                },
                onTabComment: () {
                  showCustomBottomSheet(
                    context: context,
                    child: CustomCommentBottomSheet(
                      commentController: _commentController,
                      onPressSuffixIcon: () {},
                    ),
                  );
                },
                onTabTranslate: () {
                  _vm.isActiveTranslate.value = !_vm.isActiveTranslate.value;
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: AppSizes.sizedBoxSmallHeight,
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
      title: ValueListenableBuilder(
          valueListenable: _vm.userNotifier,
          builder: (_, __, ___) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${LocaleKeys.homePage_welcome.locale}, '
                    '${_vm.userNotifier.value?.userName ?? ''}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Row(
                  children: [
                    CustomUserCircleAvatar(
                      circleRadius: 14,
                      borderPadding: 0,
                      profileImgAddress:
                          _vm.userNotifier.value?.profileImageAddress,
                    ),
                    SizedBox(width: AppSizes.sizedBoxSmallWidth),
                    Image.asset(
                      AppAssets.icNotificationPath,
                      width: AppSizes.appOverallIconWidth,
                      height: AppSizes.appOverallIconWidth,
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
