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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.appPaddingAll,
            child: Container(
              padding: AppPaddings.paddingSmallHorizontal,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AppAssets.icSearchPath,
                      color: AppColors.santaGrey,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Text(
                    'Search for words or users...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: AppPaddings.appPaddingHorizontal,
                child: PostListItem(
                  onTabLike: () {},
                  onTabSave: () {},
                  onTabComment: () {
                    showCustomBottomSheet(
                      context: context,
                      child: CustomCommentBottomSheet(
                        commentController: _commentController,
                        onPressSuffixIcon: () {},
                      ),
                    );
                  },
                  onTabShare: () {},
                  onTabTranslate: () {},
                  onTabChoice: () {},
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: AppPaddings.appPaddingAll,
              child: Container(
                height: 1,
                color: AppColors.platinum.withOpacity(0.3),
              ),
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
