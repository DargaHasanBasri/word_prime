import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/my_word_list/components/item_my_word_list.dart';
import 'package:word_prime/ui/pages/my_word_list/components/my_word_list_tab_bar.dart';

class MyWordListPage extends StatefulWidget {
  const MyWordListPage({super.key});

  @override
  State<MyWordListPage> createState() => _MyWordListPageState();
}

class _MyWordListPageState extends BaseStatefulState<MyWordListPage> {
  late final MyWordListViewModel _vm;
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<MyWordListViewModel>(context, listen: false);
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
    return ValueListenableBuilder(
      valueListenable: _vm.isSaved,
      builder: (_, __, ___) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppPaddings.appPaddingHorizontal,
              child: MyWordListTabBar(
                onTapAdded: () {
                  if (_vm.isSaved.value) {
                    _vm.isSaved.value = false;
                  }
                },
                onTapSaved: () {
                  if (!_vm.isSaved.value) {
                    _vm.isSaved.value = true;
                  }
                },
                isSaved: _vm.isSaved.value,
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _vm.isSaved.value ? addedList() : savedList(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
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
        '${LocaleKeys.myWordList_appBarTitle.locale} ${_vm.englishLevel}',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _emptyList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Image.asset(AppAssets.imgImgEmptyWordListPath),
            Padding(
              padding: AppPaddings.paddingSmallVertical,
              child: Text(
                LocaleKeys.myWordList_title.locale,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              LocaleKeys.myWordList_subTitle.locale,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(height: AppSizes.sizedBoxLargeHeight),
        CustomButton(
          title: LocaleKeys.myWordList_newWord.locale.toUpperCase(),
          onClick: () {
            appRoutes.navigateTo(
              Routes.AddPost,
              arguments: _vm.englishLevel,
            );
          },
        ),
      ],
    );
  }

  Widget addedList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: AppPaddings.paddingMediumVertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ItemMyWordList(
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
    );
  }

  Widget savedList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: AppPaddings.paddingMediumVertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ItemMyWordList(
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
    );
  }
}
