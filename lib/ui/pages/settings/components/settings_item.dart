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
                  width: AppSizes.appOverallIconWidth,
                  height: AppSizes.appOverallIconHeight,
                ),
                SizedBox(width: AppSizes.sizedBoxMediumWidth),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Image.asset(
                  AppAssets.icArrowBackRightPath,
                  color: Theme.of(context).colorScheme.onTertiary,
                  width: AppSizes.appOverallIconWidth,
                  height: AppSizes.appOverallIconHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
