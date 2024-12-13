import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/my_word_list/components/added_empty_list.dart';
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
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: 30,
        ),
        onPressed: () {
          appRoutes.navigateTo(
            Routes.AddPost,
            arguments: [
              _vm.currentUserNotifier,
              _vm.englishLevel,
            ],
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
              padding: AppPaddings.appPaddingHorizontal +
                  AppPaddings.paddingLargeTop,
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
              valueListenable: _vm.savedPostsIdsNotifier,
              builder: (_, __, ___) {
                return ValueListenableBuilder(
                  valueListenable: _vm.likedPostsIdsNotifier,
                  builder: (_, __, ___) {
                    return ValueListenableBuilder(
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
                                  : Padding(
                                      padding: AppPaddings.appPaddingHorizontal,
                                      child: Center(
                                        child: AddedEmptyList(),
                                      ),
                                    ),
                        );
                      },
                    );
                  },
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
      backgroundColor: AppColors.rhino,
      leading: ValueListenableBuilder(
          valueListenable: _vm.isDeletedItem,
          builder: (_, __, ___) {
            return IconButton(
              onPressed: () {
                if (_vm.isDeletedItem.value) {
                  eventBus.fire(new RefreshUserInfoEvent());
                }
                appRoutes.popIfBackStackNotEmpty();
              },
              icon: Image.asset(
                AppAssets.icArrowBackLeftPath,
                color: AppColors.white,
                width: AppSizes.appOverallIconWidth,
                height: AppSizes.appOverallIconHeight,
              ),
            );
          }),
      title: Text(
        '${LocaleKeys.myWordList_appBarTitle.locale} ${_vm.englishLevel}',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
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
              AppPaddings.appPaddingMainTabBottom + AppPaddings.paddingLargeTop,
          shrinkWrap: true,
          itemCount: _vm.addedPostsNotifier.value?.length ?? 0,
          itemBuilder: (context, index) {
            final postModelData = _vm.addedPostsNotifier.value?[index];
            final bool isPostLiked = _vm.likedPostsIdsNotifier.value
                    ?.contains(postModelData?.postId) ??
                false;
            final bool isPostSaved = _vm.savedPostsIdsNotifier.value
                    ?.contains(postModelData?.postId) ??
                false;
            return Padding(
              padding: AppPaddings.appPaddingHorizontal,
              child: AddedWordsListItem(
                postModel: postModelData,
                isLiked: isPostLiked,
                isSaved: isPostSaved,
                onTabLike: () {
                  _vm.likedPost(
                    postId: postModelData?.postId,
                    wordLevel: postModelData?.wordLevel,
                  );
                },
                onTabSave: () {
                  _vm.savedPost(
                    postId: postModelData?.postId,
                    wordLevel: postModelData?.wordLevel,
                  );
                },
                onTabComment: () {
                  _vm.fetchPostComments(
                    showProgress: () => showProgress(context),
                    hideProgress: () => hideProgress(),
                    postId: postModelData?.postId,
                  );
                  showCustomBottomSheet(
                    context: context,
                    child: ValueListenableBuilder(
                      valueListenable: _vm.commentsNotifier,
                      builder: (_, __, ___) {
                        return CustomCommentBottomSheet(
                          commentController: _commentController,
                          currentUserProfileImage: _vm
                              .currentUserNotifier.value?.profileImageAddress,
                          comments: _vm.commentsNotifier.value,
                          onPressSuffixIcon: () async {
                            await _vm.addNewComments(
                              showProgress: () => showProgress(context),
                              hideProgress: () => hideProgress(),
                              postId: postModelData?.postId,
                              comment: _commentController.text,
                            );
                            _commentController.clear();
                            _vm.fetchPostComments(
                              showProgress: () => showProgress(context),
                              hideProgress: () => hideProgress(),
                              postId: postModelData?.postId,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
                onTabChoice: () {
                  showCustomBottomSheet(
                    context: context,
                    child: CustomChoicesBottomSheet(
                      onTapUpdate: () {
                        appRoutes.navigateTo(
                          Routes.UpdatePost,
                          arguments: [
                            _vm.currentUserNotifier,
                            postModelData,
                          ],
                        );
                      },
                      onTapDelete: () {
                        showPopupDialog(
                          context: context,
                          child: Padding(
                            padding: AppPaddings.appPaddingHorizontal,
                            child: ValueListenableBuilder(
                                valueListenable: _vm.isDeletedItem,
                                builder: (_, __, ___) {
                                  return CustomAppPopup(
                                    title: LocaleKeys
                                        .warningMessages_deleteMsgTitle.locale,
                                    subTitle: LocaleKeys
                                        .warningMessages_deleteMsgSubTitle
                                        .locale,
                                    onTapConfirmButton: () async {
                                      await _vm.deleteUserPost(
                                        userPostId:
                                            '${_vm.addedPostsNotifier.value?[index]?.postId}',
                                        showProgress: () =>
                                            showProgress(context),
                                        hideProgress: () => hideProgress(),
                                      );
                                      appRoutes.popPages(2);
                                      _vm.isDeletedItem.value = true;
                                      _vm.getAddedAndSavedPosts(
                                        showProgress: () =>
                                            showProgress(context),
                                        hideProgress: () => hideProgress(),
                                      );
                                    },
                                    onTapCancelButton: () {
                                      appRoutes.popIfBackStackNotEmpty();
                                    },
                                  );
                                }),
                          ),
                        );
                      },
                      onTapShare: () {},
                    ),
                  );
                },
                onTabTranslate: () {},
                onTabShare: () {},
                onTabPost: () {
                  appRoutes.navigateTo(
                    Routes.PostDetail,
                    arguments: [
                      postModelData,
                      _vm.currentUserNotifier,
                    ],
                  );
                },
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
        );
      },
    );
  }

  Widget savedList() {
    return ValueListenableBuilder(
      valueListenable: _vm.savedPostsNotifier,
      builder: (_, __, ___) {
        return ListView.separated(
          controller: _savedScrollController,
          physics: BouncingScrollPhysics(),
          padding:
              AppPaddings.appPaddingMainTabBottom + AppPaddings.paddingLargeTop,
          shrinkWrap: true,
          itemCount: _vm.savedPostsNotifier.value?.length ?? 0,
          itemBuilder: (context, index) {
            final postModel = _vm.savedPostsNotifier.value?[index];
            final bool isPostLiked =
                _vm.likedPostsIdsNotifier.value?.contains(postModel?.postId) ??
                    false;
            return Padding(
              padding: AppPaddings.appPaddingHorizontal,
              child: SavedPostsListItem(
                postModel: postModel,
                isLiked: isPostLiked,
                onTabLike: () {
                  _vm.likedPost(
                    postId: postModel?.postId,
                    wordLevel: postModel?.wordLevel,
                  );
                },
                onTabSave: () {
                  _vm.savedPost(
                    postId: postModel?.postId,
                    wordLevel: postModel?.wordLevel,
                  );
                },
                onTabComment: () {
                  _vm.fetchPostComments(
                    showProgress: () => showProgress(context),
                    hideProgress: () => hideProgress(),
                    postId: postModel?.postId,
                  );
                  showCustomBottomSheet(
                    context: context,
                    child: ValueListenableBuilder(
                      valueListenable: _vm.commentsNotifier,
                      builder: (_, __, ___) {
                        return CustomCommentBottomSheet(
                          commentController: _commentController,
                          currentUserProfileImage: _vm
                              .currentUserNotifier.value?.profileImageAddress,
                          comments: _vm.commentsNotifier.value,
                          onPressSuffixIcon: () async {
                            await _vm.addNewComments(
                              showProgress: () => showProgress(context),
                              hideProgress: () => hideProgress(),
                              postId: postModel?.postId,
                              comment: _commentController.text,
                            );
                            _commentController.clear();
                            _vm.fetchPostComments(
                              showProgress: () => showProgress(context),
                              hideProgress: () => hideProgress(),
                              postId: postModel?.postId,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
                onTabTranslate: () {},
                onTabChoice: () {},
                onTabShare: () {},
                onTabUserProfile: () {
                  appRoutes.navigateTo(
                    Routes.ProfileUserDetails,
                    arguments: [
                      postModel?.userId,
                      _vm.currentUserNotifier,
                    ],
                  );
                },
                onTabPost: () {
                  appRoutes.navigateTo(
                    Routes.PostDetail,
                    arguments: [
                      postModel,
                      _vm.currentUserNotifier,
                    ],
                  );
                },
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
        );
      },
    );
  }
}
