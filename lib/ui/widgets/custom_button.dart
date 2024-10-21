import 'package:word_prime/export.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    Color? backgroundColor,
    Color? titleColor,
    Color? borderColor,
    String? title,
    String? iconLogoAddress,
    double? borderRadius,
    double? titleVerticalPadding,
    VoidCallback? onClick,
    bool? isIcon,
  })  : title = title ?? 'NEXT',
        iconLogoAddress = iconLogoAddress ?? '',
        backgroundColor = backgroundColor ?? AppColors.cornflowerBlue,
        titleColor = titleColor ?? AppColors.white,
        borderColor = borderColor ?? Colors.transparent,
        borderRadius = borderRadius ?? 40,
        titleVerticalPadding = titleVerticalPadding ?? 16,
        isIcon = isIcon ?? false,
        onClick = onClick ?? (() {});
  final Color? backgroundColor;
  final Color? titleColor;
  final String title;
  final String iconLogoAddress;
  final VoidCallback? onClick;
  final double borderRadius;
  final double titleVerticalPadding;
  final Color borderColor;
  final bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: () => onClick?.call(),
          splashColor: AppColors.white.withOpacity(0.5),
          child: Ink(
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: titleVerticalPadding),
              child: isIcon == true
                  ? Row(
                      children: [
                        Padding(
                          padding: AppPaddings.paddingMediumLeft,
                          child: Image.asset(
                            iconLogoAddress,
                            width: AppSizes.appOverallIconWidth,
                            height: AppSizes.appOverallIconHeight,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: titleColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: titleColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
