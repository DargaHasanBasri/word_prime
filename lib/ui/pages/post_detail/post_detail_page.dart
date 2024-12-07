import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/post_detail/components/user_comment_details.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends BaseStatefulState<PostDetailPage> {
  late final PostDetailViewModel _vm;
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<PostDetailViewModel>(context, listen: false);
    _vm.fetchPostComments(
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _postDetailInfo(),
                Padding(
                  padding: AppPaddings.paddingSmallVertical,
                  child: Text(
                    LocaleKeys.comments.locale,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _vm.commentsNotifier,
                  builder: (_, __, ___) {
                    return _commentsList();
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: _commentTextFormField(),
        ),
      ],
    );
  }

  Widget _postDetailInfo() {
    return Column(
      children: [
        PostUserInfo(
          postModel: _vm.currentPost,
          onTabChoice: () {},
          onTabUserProfile: () {},
        ),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.paddingMediumRight,
                child: InteractItemsColumn(
                  isLiked: null,
                  isSaved: null,
                  onTabLike: () {
                    _vm.likedPost();
                  },
                  onTabSave: () {
                    _vm.savedPost();
                  },
                  onTabComment: () {},
                  postModel: _vm.currentPost,
                ),
              ),
              _vm.currentPost?.postImageAddress == null
                  ? Expanded(
                      child: PostWithoutImage(
                        postModel: _vm.currentPost,
                      ),
                    )
                  : Expanded(
                      child: PostWithImage(
                        postModel: _vm.currentPost,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _commentsList() {
    return ListView.separated(
      padding: AppPaddings.appPaddingVertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _vm.commentsNotifier.value?.length ?? 0,
      itemBuilder: (context, index) {
        final commentModel = _vm.commentsNotifier.value?[index];
        return UserCommentDetails(
          commentModel: commentModel,
          dateTime: commentModel?.createdDate?.toDateTime(),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: AppSizes.sizedBoxMediumHeight,
      ),
    );
  }

  Widget _commentTextFormField() {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: _vm.currentUserNotifier,
          builder: (_, __, ___) {
            return CustomUserCircleAvatar(
              profileImgAddress:
                  _vm.currentUserNotifier.value?.profileImageAddress,
              borderWidth: 0,
              circleRadius: 20,
            );
          },
        ),
        SizedBox(width: AppSizes.sizedBoxSmallWidth),
        Expanded(
          child: CustomTextFormField(
            controller: _commentController,
            borderRadius: 60,
            hintText: LocaleKeys.commentsHintText.locale,
            textInputAction: TextInputAction.done,
            isSuffixIcon: true,
            suffixIconAddress: AppAssets.icSendPath,
            onPressSuffixIcon: () {
              _vm.addNewComments(
                comment: _commentController.text,
                showProgress: () => showProgress(context),
                hideProgress: () => hideProgress(),
              );
              _commentController.clear();
            },
            onChanged: (String text) {},
          ),
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
    );
  }
}
