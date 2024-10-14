import 'package:word_prime/export.dart';

class ProfileTabBar extends StatelessWidget {
  final ValueNotifier<int> whichIndex;
  const ProfileTabBar({
    super.key,
    required this.whichIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              whichIndex.value = 0;
            },
            child: Column(
              children: [
                Container(
                  height: 2,
                  color: whichIndex.value == 0
                      ? AppColors.cornflowerBlue
                      : Colors.transparent,
                ),
                Container(
                  padding: AppPaddings.paddingSmallVertical,
                  alignment: Alignment.center,
                  decoration: whichIndex.value == 0
                      ? BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.12),
                              offset: Offset(-4, 4),
                              blurRadius: 20,
                            ),
                          ],
                        )
                      : BoxDecoration(
                          color: Colors.transparent,
                        ),
                  child: Text(
                    LocaleKeys.profilePage_myWords.locale,
                    style: TextStyle(
                      color: whichIndex.value == 0
                          ? AppColors.cornflowerBlue
                          : AppColors.santaGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              whichIndex.value = 1;
            },
            child: Column(
              children: [
                Container(
                  height: 2,
                  color: whichIndex.value == 1
                      ? AppColors.cornflowerBlue
                      : Colors.transparent,
                ),
                Container(
                  padding: AppPaddings.paddingSmallVertical,
                  alignment: Alignment.center,
                  decoration: whichIndex.value == 1
                      ? BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.12),
                              offset: Offset(-4, 4),
                              blurRadius: 20,
                            ),
                          ],
                        )
                      : BoxDecoration(
                          color: Colors.transparent,
                        ),
                  child: Text(
                    LocaleKeys.profilePage_saved.locale,
                    style: TextStyle(
                      color: whichIndex.value == 1
                          ? AppColors.cornflowerBlue
                          : AppColors.santaGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              whichIndex.value = 2;
            },
            child: Column(
              children: [
                Container(
                  height: 2,
                  color: whichIndex.value == 2
                      ? AppColors.cornflowerBlue
                      : Colors.transparent,
                ),
                Container(
                  padding: AppPaddings.paddingSmallVertical,
                  alignment: Alignment.center,
                  decoration: whichIndex.value == 2
                      ? BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.12),
                              offset: Offset(-4, 4),
                              blurRadius: 20,
                            ),
                          ],
                        )
                      : BoxDecoration(
                          color: Colors.transparent,
                        ),
                  child: Text(
                    LocaleKeys.profilePage_favorites.locale,
                    style: TextStyle(
                      color: whichIndex.value == 2
                          ? AppColors.cornflowerBlue
                          : AppColors.santaGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
