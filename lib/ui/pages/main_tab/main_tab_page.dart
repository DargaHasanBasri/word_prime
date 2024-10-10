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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _vm.currentIndex,
        builder: (_, __, ___) {
          return CustomBottomNavigationBar(
            whichIndex: _vm.currentIndex,
          );
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [],
    );
  }
}
