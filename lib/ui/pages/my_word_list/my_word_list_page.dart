import 'package:word_prime/export.dart';

class MyWordListPage extends StatefulWidget {
  const MyWordListPage({super.key});

  @override
  State<MyWordListPage> createState() => _MyWordListPageState();
}

class _MyWordListPageState extends BaseStatefulState<MyWordListPage> {
  late final MyWordListViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<MyWordListViewModel>(context, listen: false);
    serviceLocalStorage.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(),
      body: Padding(
        padding: AppPaddings.appPaddingAll,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _emptyList(),
      ],
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
}
