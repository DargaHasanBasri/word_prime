import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/search/components/search_empty_list.dart';
import 'package:word_prime/ui/pages/search/components/search_post_with_image.dart';
import 'package:word_prime/ui/pages/search/components/search_post_without_image.dart';
import 'package:word_prime/ui/pages/search/components/search_user_info.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends BaseStatefulState<SearchPage> {
  late final SearchViewModel _vm;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _vm = Provider.of<SearchViewModel>(context, listen: false);
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
    return ValueListenableBuilder(
      valueListenable: _vm.isSearch,
      builder: (_, __, ___) {
        return Column(
          children: [
            CustomTextFormField(
              controller: _searchController,
              isAutoTrue: true,
              hintText: LocaleKeys.searchPage_searchText.locale,
              isPrefixIcon: true,
              prefixIconAddress: AppAssets.icSearchPath,
              isSuffixIcon: true,
              suffixIconAddress: AppAssets.icSendPath,
              textInputAction: TextInputAction.done,
              onPressSuffixIcon: () {
                _searchController.text.isNotEmpty
                    ? _vm.getUserOrWordByQuery(
                        showProgress: () => showProgress(context),
                        hideProgress: () => hideProgress(),
                        searchText: _searchController.text.trim(),
                      )
                    : showSnackBar(
                        context: context,
                        content: CustomSnackBarContent(
                          text: LocaleKeys.warningMessages_emptySpace.locale,
                          iconType: CustomSnackBarType.info,
                        ),
                      );
              },
            ),
            SizedBox(height: AppSizes.sizedBoxMediumWidth),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _vm.userListNotifier,
                builder: (_, userList, ___) {
                  return ValueListenableBuilder(
                    valueListenable: _vm.postListNotifier,
                    builder: (_, postList, ___) {
                      final combinedList = [
                        ...(postList ?? []),
                        ...(userList ?? []),
                      ];
                      return ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                        child: _vm.isSearch.value
                            ? combinedList.length == 0
                                ? SearchEmptyList()
                                : ListView.separated(
                                    padding: AppPaddings.appPaddingVertical,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: combinedList.length,
                                    itemBuilder: (context, index) {
                                      if (index < (postList?.length ?? 0)) {
                                        final post = postList?[index];
                                        return post?.postImageAddress != null
                                            ? SearchPostWithImage(
                                                postModel: post,
                                              )
                                            : SearchPostWithoutImage(
                                                postModel: post,
                                              );
                                      } else {
                                        final user = userList?[
                                            index - (postList?.length ?? 0)];
                                        return SearchUserInfo(
                                          userModel: user,
                                        );
                                      }
                                    },
                                    separatorBuilder: (context, index) =>
                                        Padding(
                                      padding: AppPaddings.appPaddingVertical,
                                      child: Container(
                                        height: 1,
                                        color:
                                            AppColors.platinum.withOpacity(0.3),
                                      ),
                                    ),
                                  )
                            : SizedBox(),
                      );
                    },
                  );
                },
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
        LocaleKeys.searchPage_title.locale,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
