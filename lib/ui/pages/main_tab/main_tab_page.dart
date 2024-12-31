import 'dart:async';
import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/main_tab/components/custom_bottom_navigation_bar.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends BaseStatefulState<MainTabPage> {
  late final MainTabViewModel _vm;
  late StreamSubscription<RefreshUserInfoEvent>? _eventSubscription;

  @override
  void initState() {
    _vm = Provider.of<MainTabViewModel>(context, listen: false);

    _vm.getUserData();
    _eventSubscription = eventBus.on<RefreshUserInfoEvent>().listen((event) {
      _vm.getUserData();
    });

    super.initState();
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    super.dispose();
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
          currentUserNotifier: _vm.userNotifier,
        );
      case 1:
        return ActivityProvider(
          currentUserNotifier: _vm.userNotifier,
        );
      case 2:
        return AddWordProvider(
          currentUserNotifier: _vm.userNotifier,
        );
      case 3:
        return TasksProvider();
      case 4:
        return MyProfileProvider(
          currentUserNotifier: _vm.userNotifier,
        );
      default:
        return HomeProvider(
          currentUserNotifier: _vm.userNotifier,
        );
    }
  }
}
