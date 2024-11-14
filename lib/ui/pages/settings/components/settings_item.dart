import 'package:flutter/cupertino.dart';
import 'package:word_prime/export.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTab;
  final String iconAddress;
  final bool? isFirst;
  final bool? isLast;
  final bool? isSwitchButton;
  const SettingsItem({
    super.key,
    required this.title,
    required this.iconAddress,
    this.onTab,
    this.isFirst,
    this.isLast,
    this.isSwitchButton,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
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
        onTap: isSwitchButton == true ? null : () => onTab?.call(),
        child: Ink(
          child: Padding(
            padding: isSwitchButton == true
                ? AppPaddings.paddingMediumHorizontal
                : AppPaddings.paddingMediumAll,
            child: Row(
              children: [
                Image.asset(
                  iconAddress,
                  color: AppColors.paleSky,
                  width: AppSizes.appOverallIconWidth,
                  height: AppSizes.appOverallIconHeight,
                ),
                SizedBox(width: AppSizes.sizedBoxMediumWidth),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                isSwitchButton == true
                    ? Padding(
                        padding: AppPaddings.paddingSmallVertical,
                        child: Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            activeColor: AppColors.rhino,
                            trackColor: AppColors.pastelBlue,
                            value: themeProvider.isDarkMode,
                            onChanged: (value) {
                              themeProvider.toggleTheme(value);
                            },
                          ),
                        ),
                      )
                    : Image.asset(
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
