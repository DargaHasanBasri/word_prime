import 'dart:async';
import 'package:word_prime/base/events/refresh_posts_event.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/home/components/home_search_bar.dart';
import 'package:word_prime/ui/pages/home/components/post_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  late final HomeViewModel _vm;
  TextEditingController _commentController = TextEditingController();
  late StreamSubscription<RefreshPostsEvent>? _eventSubscription;

  @override
  void initState() {
    _vm = Provider.of<HomeViewModel>(context, listen: false);

    _vm.getFetchPosts(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );

    _eventSubscription = eventBus.on<RefreshPostsEvent>().listen((event) {
      _vm.getFetchPosts(
        showProgress: () => showProgress(context),
        hideProgress: () => hideProgress(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    _commentController.dispose();
    super.dispose();
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
            child: HomeSearchBar(
              onTapSearchBar: () {
                appRoutes.navigateTo(
                  Routes.Search,
                  arguments: _vm.currentUserNotifier,
                );
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _vm.savedPostsNotifier,
            builder: (_, __, ___) {
              return ValueListenableBuilder(
                valueListenable: _vm.likedPostsNotifier,
                builder: (_, __, ___) {
                  return ValueListenableBuilder(
                    valueListenable: _vm.postsNotifier,
                    builder: (_, __, ___) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _vm.postsNotifier.value?.length ?? 0,
                        itemBuilder: (context, index) {
                          final postModel = _vm.postsNotifier.value?[index];
                          final bool isPostLiked = _vm.likedPostsNotifier.value
                                  ?.contains(postModel?.postId) ??
                              false;
                          final bool isPostSaved = _vm.savedPostsNotifier.value
                                  ?.contains(postModel?.postId) ??
                              false;
                          return Padding(
                            padding: AppPaddings.appPaddingHorizontal,
                            child: PostListItem(
                              postModel: postModel,
                              isLiked: isPostLiked,
                              isSaved: isPostSaved,
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
                              onTabShare: () {},
                              onTabTranslate: () {},
                              onTabChoice: () {},
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
                                            .currentUserNotifier
                                            .value
                                            ?.profileImageAddress,
                                        comments: _vm.commentsNotifier.value,
                                        onPressSuffixIcon: () async {
                                          await _vm.addNewComments(
                                            showProgress: () =>
                                                showProgress(context),
                                            hideProgress: () => hideProgress(),
                                            postId: postModel?.postId,
                                            comment: _commentController.text,
                                          );
                                          _commentController.clear();
                                          _vm.fetchPostComments(
                                            showProgress: () =>
                                                showProgress(context),
                                            hideProgress: () => hideProgress(),
                                            postId: postModel?.postId,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
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
                },
              );
            },
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
          valueListenable: _vm.currentUserNotifier,
          builder: (_, __, ___) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: AppPaddings.paddingSmallHorizontal,
                  child: CustomUserCircleAvatar(
                    circleRadius: 14,
                    borderPadding: 0,
                    profileImgAddress:
                        _vm.currentUserNotifier.value?.profileImageAddress,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${LocaleKeys.homePage_welcome.locale}, '
                    '${_vm.currentUserNotifier.value?.userName ?? ''}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Image.asset(
                  AppAssets.icNotificationPath,
                  width: AppSizes.appOverallIconWidth,
                  height: AppSizes.appOverallIconWidth,
                ),
              ],
            );
          }),
    );
  }
}
