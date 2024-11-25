import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/main_tab/components/custom_bottom_navigation_bar.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends BaseStatefulState<MainTabPage> {
  late final MainTabViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<MainTabViewModel>(context, listen: false);

    _vm.getUserData(
      showProgress: () => showProgress(context),
      hideProgress: () => hideProgress(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _vm.currentIndex,
        builder: (_, __, ___) {
          return CustomBottomNavigationBar(
            whichIndex: _vm.currentIndex,
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: _vm.currentIndex,
        builder: (_, __, ___) {
          return _buildBody(_vm.currentIndex.value);
        },
      ),
    );
  }

  Widget _buildBody(int whichIndex) {
    switch (whichIndex) {
      case 0:
        return HomeProvider(
          userNotifier: _vm.userNotifier,
        );
      case 1:
        return ActivityProvider();
      case 2:
        return AddWordProvider();
      case 3:
        return TasksProvider();
      case 4:
        return ProfileProvider(
          userNotifier: _vm.userNotifier,
        );
      default:
        return HomeProvider(
          userNotifier: _vm.userNotifier,
        );
    }
  }
}
