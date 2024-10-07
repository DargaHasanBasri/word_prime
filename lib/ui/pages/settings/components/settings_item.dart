import 'package:word_prime/export.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTab;
  final String iconAddress;
  final bool? isFirst;
  final bool? isLast;
  const SettingsItem({
    super.key,
    required this.title,
    required this.onTab,
    required this.iconAddress,
    this.isFirst,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(isFirst == true ? 16 : 0),
        bottom: Radius.circular(isLast == true ? 16 : 0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(isFirst == true ? 16 : 0),
          bottom: Radius.circular(isLast == true ? 16 : 0),
        ),
        onTap: () => onTab.call(),
        child: Ink(
          child: Padding(
            padding: AppPaddings.paddingMediumAll,
            child: Row(
              children: [
                Image.asset(
                  iconAddress,
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.mirage,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  AppAssets.icArrowBackRightPath,
                  color: AppColors.santaGrey,
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
