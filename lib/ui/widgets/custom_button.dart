import 'package:flutter/material.dart';
import 'package:word_prime/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    Color? backgroundColor,
    Color? titleColor,
    Color? borderColor,
    String? title,
    String? iconLogoAddress,
    double? borderRadius,
    VoidCallback? onClick,
    bool? isIcon,
  })  : title = title ?? 'NEXT',
        iconLogoAddress = iconLogoAddress ?? '',
        backgroundColor = backgroundColor ?? AppColors.cornflowerBlue,
        titleColor = titleColor ?? AppColors.white,
        borderColor = borderColor ?? Colors.transparent,
        borderRadius = borderRadius ?? 40,
        isIcon = isIcon ?? false,
        onClick = onClick ?? (() {});
  final Color? backgroundColor;
  final Color? titleColor;
  final String title;
  final String iconLogoAddress;
  final VoidCallback? onClick;
  final double borderRadius;
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
                width: 2,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: isIcon == true
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Image.asset(
                            iconLogoAddress,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text(
                              title,
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
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
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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
