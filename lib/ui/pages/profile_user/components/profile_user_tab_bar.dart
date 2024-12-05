import 'package:word_prime/export.dart';

class ProfileUserTabBar extends StatelessWidget {
  final ValueNotifier<int> whichIndex;
  const ProfileUserTabBar({
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
                Text(
                  'Posts',
                  style: TextStyle(
                    color: whichIndex.value == 0
                        ? AppColors.cornflowerBlue
                        : AppColors.cornflowerBlue.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 2,
                  color: whichIndex.value == 0
                      ? AppColors.cornflowerBlue
                      : AppColors.cornflowerBlue.withOpacity(0.5),
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
                Text(
                  LocaleKeys.profilePage_saved.locale,
                  style: TextStyle(
                    color: whichIndex.value == 1
                        ? AppColors.cornflowerBlue
                        : AppColors.cornflowerBlue.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 2,
                  color: whichIndex.value == 1
                      ? AppColors.cornflowerBlue
                      : AppColors.cornflowerBlue.withOpacity(0.5),
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
                Text(
                  LocaleKeys.profilePage_favorites.locale,
                  style: TextStyle(
                    color: whichIndex.value == 2
                        ? AppColors.cornflowerBlue
                        : AppColors.cornflowerBlue.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 2,
                  color: whichIndex.value == 2
                      ? AppColors.cornflowerBlue
                      : AppColors.cornflowerBlue.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
