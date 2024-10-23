import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/main_tab/components/active_bottom_navigation_bar_item.dart';
import 'package:word_prime/ui/pages/main_tab/components/inactive_bottom_navigation_bar_item.dart';

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
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cornflowerBlue.withOpacity(0.25),
            blurRadius: 25,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Padding(
        padding: AppPaddings.paddingLargeBottom + AppPaddings.paddingMediumTop,
        child: ValueListenableBuilder(
          valueListenable: whichIndex,
          builder: (_, __, ___) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                whichIndex.value == 0
                    ? ActiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabHomePath,
                        pageName: LocaleKeys.home.locale,
                      )
                    : InactiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabHomePath,
                        onTapIcon: () => whichIndex.value = 0,
                      ),
                whichIndex.value == 1
                    ? ActiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabActivityPath,
                        pageName: LocaleKeys.activity.locale,
                      )
                    : InactiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabActivityPath,
                        onTapIcon: () => whichIndex.value = 1,
                      ),
                whichIndex.value == 2
                    ? ActiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabWordAddPath,
                        pageName: LocaleKeys.addWord.locale,
                      )
                    : InactiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabWordAddPath,
                        onTapIcon: () => whichIndex.value = 2,
                      ),
                whichIndex.value == 3
                    ? ActiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabTaskPath,
                        pageName: LocaleKeys.tasks.locale,
                      )
                    : InactiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabTaskPath,
                        onTapIcon: () => whichIndex.value = 3,
                      ),
                whichIndex.value == 4
                    ? ActiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabProfilePath,
                        pageName: LocaleKeys.profile.locale,
                      )
                    : InactiveBottomNavigationBarItem(
                        iconAddress: AppAssets.icMainTabProfilePath,
                        onTapIcon: () => whichIndex.value = 4,
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
