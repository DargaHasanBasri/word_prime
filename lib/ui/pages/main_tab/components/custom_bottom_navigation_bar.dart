import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/main_tab/components/active_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final ValueNotifier<int> whichIndex;
  CustomBottomNavigationBar({
    super.key,
    required this.whichIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mirage.withOpacity(0.03),
            blurRadius: 28,
            offset: Offset(0, -8),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ValueListenableBuilder(
          valueListenable: whichIndex,
          builder: (_, __, ___) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 0;
                  },
                  child: whichIndex.value == 0
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabHomePath,
                          pageName: 'Home',
                        )
                      : Image.asset(
                          AppAssets.icMainTabHomePath,
                          width: 24,
                          height: 24,
                          color: AppColors.pastelBlue,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 1;
                  },
                  child: whichIndex.value == 1
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabGamePath,
                          pageName: 'Game',
                        )
                      : Image.asset(
                          AppAssets.icMainTabGamePath,
                          width: 24,
                          height: 24,
                          color: AppColors.pastelBlue,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 2;
                  },
                  child: whichIndex.value == 2
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabWordAddPath,
                          pageName: 'Add Word',
                        )
                      : Image.asset(
                          AppAssets.icMainTabWordAddPath,
                          width: 24,
                          height: 24,
                          color: AppColors.pastelBlue,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 3;
                  },
                  child: whichIndex.value == 3
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabTaskPath,
                          pageName: 'Tasks',
                        )
                      : Image.asset(
                          AppAssets.icMainTabTaskPath,
                          width: 24,
                          height: 24,
                          color: AppColors.pastelBlue,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 4;
                  },
                  child: whichIndex.value == 4
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabProfilePath,
                          pageName: 'Profile',
                        )
                      : Image.asset(
                          AppAssets.icMainTabProfilePath,
                          width: 24,
                          height: 24,
                          color: AppColors.pastelBlue,
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
