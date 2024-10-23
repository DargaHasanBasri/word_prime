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
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 0;
                  },
                  child: whichIndex.value == 0
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabHomePath,
                          pageName: LocaleKeys.home.locale,
                        )
                      : Image.asset(
                          AppAssets.icMainTabHomePath,
                          width: AppSizes.appOverallIconWidth,
                          height: AppSizes.appOverallIconHeight,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 1;
                  },
                  child: whichIndex.value == 1
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabActivityPath,
                          pageName: LocaleKeys.activity.locale,
                        )
                      : Image.asset(
                          AppAssets.icMainTabActivityPath,
                          width: AppSizes.appOverallIconWidth,
                          height: AppSizes.appOverallIconHeight,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 2;
                  },
                  child: whichIndex.value == 2
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabWordAddPath,
                          pageName: LocaleKeys.addWord.locale,
                        )
                      : Image.asset(
                          AppAssets.icMainTabWordAddPath,
                          width: AppSizes.appOverallIconWidth,
                          height: AppSizes.appOverallIconHeight,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 3;
                  },
                  child: whichIndex.value == 3
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabTaskPath,
                          pageName: LocaleKeys.tasks.locale,
                        )
                      : Image.asset(
                          AppAssets.icMainTabTaskPath,
                          width: AppSizes.appOverallIconWidth,
                          height: AppSizes.appOverallIconHeight,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    whichIndex.value = 4;
                  },
                  child: whichIndex.value == 4
                      ? ActiveBottomNavigationBarItem(
                          iconAddress: AppAssets.icMainTabProfilePath,
                          pageName: LocaleKeys.profile.locale,
                        )
                      : Image.asset(
                          AppAssets.icMainTabProfilePath,
                          width: AppSizes.appOverallIconWidth,
                          height: AppSizes.appOverallIconHeight,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
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
