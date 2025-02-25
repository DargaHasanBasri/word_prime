import 'package:word_prime/export.dart';

class AddPostSuccessfulPage extends StatefulWidget {
  const AddPostSuccessfulPage({super.key});

  @override
  State<AddPostSuccessfulPage> createState() => _AddPostSuccessfulPageState();
}

class _AddPostSuccessfulPageState
    extends BaseStatefulState<AddPostSuccessfulPage> {
  late final AddPostSuccessfulViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<AddPostSuccessfulViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        appRoutes.navigateRemoveUntil(
          Routes.MainTab,
          arguments: 2,
        );
      },
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.appPaddingHorizontal,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _successContent(),
        ),
        Padding(
          padding: AppPaddings.appPaddingLargeVertical,
          child: CustomButton(
            title: LocaleKeys.addPost_backHome.locale,
            backgroundColor: Colors.transparent,
            borderColor: Theme.of(context).colorScheme.secondary,
            onClick: () {
              appRoutes.navigateRemoveUntil(
                Routes.MainTab,
                arguments: 2,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _successContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(AppAssets.imgSuccessfulPath),
        ),
        Padding(
          padding: AppPaddings.paddingSmallVertical,
          child: Text(
            LocaleKeys.addPost_successTitle.locale,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          LocaleKeys.addPost_successMsg.locale,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
