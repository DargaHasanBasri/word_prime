import 'dart:developer';
import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/my_word_list/components/added_words_list_item.dart';
import 'package:word_prime/ui/pages/my_word_list/components/my_word_list_tab_bar.dart';
import 'package:word_prime/ui/pages/my_word_list/components/saved_posts_list_item.dart';

class MyWordListPage extends StatefulWidget {
  const MyWordListPage({super.key});

  @override
  State<MyWordListPage> createState() => _MyWordListPageState();
}

class _MyWordListPageState extends BaseStatefulState<MyWordListPage> {
  late final MyWordListViewModel _vm;
  late ScrollController _addedScrollController;
  late ScrollController _savedScrollController;
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<MyWordListViewModel>(context, listen: false);

    _vm.getAddedAndSavedPosts(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );

    _addedScrollController = ScrollController();
    _savedScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _addedScrollController.dispose();
    _savedScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add,
          color: AppColors.cornflowerBlue,
          size: 30,
        ),
        onPressed: () {
          appRoutes.navigateTo(
            Routes.AddPost,
            arguments: _vm.englishLevel,
          );
        },
      ),
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
            ValueListenableBuilder(
              valueListenable: _vm.isAddedItem,
              builder: (_, __, ___) {
                return Expanded(
                  child: _vm.isSaved.value
                      ? ValueListenableBuilder(
                          valueListenable: _vm.isSavedItem,
                          builder: (_, __, ___) {
                            return _vm.isSavedItem.value
                                ? savedList()
                                : SizedBox();
                          },
                        )
                      : _vm.isAddedItem.value
                          ? addedList()
                          : Center(
                              child: _emptyAddedItem(),
                            ),
                );
              },
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

  Widget _emptyAddedItem() {
    return Padding(
      padding: AppPaddings.appPaddingHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          )
        ],
      ),
    );
  }

  Widget addedList() {
    return ValueListenableBuilder(
      valueListenable: _vm.addedPostsNotifier,
      builder: (_, __, ___) {
        return ListView.separated(
          controller: _addedScrollController,
          physics: BouncingScrollPhysics(),
          padding:
              AppPaddings.appPaddingMainTabBottom + AppPaddings.paddingSmallTop,
          shrinkWrap: true,
          itemCount: _vm.addedPostsNotifier.value?.length ?? 0,
          itemBuilder: (context, index) {
            return AddedWordsListItem(
              postModel: _vm.addedPostsNotifier.value?[index],
              onTabLike: () {
                log('${_vm.addedPostsNotifier.value?[index]?.postId}');
              },
              onTabSave: () {
                log('${_vm.addedPostsNotifier.value?[index]?.postId}');
              },
              onTabComment: () {
                log('${_vm.addedPostsNotifier.value?[index]?.postId}');
                showCustomBottomSheet(
                  context: context,
                  child: CustomCommentBottomSheet(
                    commentController: _commentController,
                    onPressSuffixIcon: () {},
                  ),
                );
              },
              onTabChoice: () {},
              onTabTranslate: () {},
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: AppSizes.sizedBoxSmallHeight,
          ),
        );
      },
    );
  }

  Widget savedList() {
    return ListView.separated(
      controller: _savedScrollController,
      physics: BouncingScrollPhysics(),
      padding:
          AppPaddings.appPaddingMainTabBottom + AppPaddings.paddingSmallTop,
      shrinkWrap: true,
      itemCount: _vm.savedPostsNotifier.value?.length ?? 0,
      itemBuilder: (context, index) {
        return SavedPostsListItem(
          postModel: _vm.savedPostsNotifier.value?[index],
          onTabLike: () {
            log('${_vm.savedPostsNotifier.value?[index]?.postId}');
          },
          onTabSave: () {
            log('${_vm.savedPostsNotifier.value?[index]?.postId}');
          },
          onTabComment: () {
            log('${_vm.savedPostsNotifier.value?[index]?.postId}');
            showCustomBottomSheet(
              context: context,
              child: CustomCommentBottomSheet(
                commentController: _commentController,
                onPressSuffixIcon: () {},
              ),
            );
          },
          onTabTranslate: () {},
          onTabChoice: () {},
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: AppSizes.sizedBoxSmallHeight,
      ),
    );
  }
}
