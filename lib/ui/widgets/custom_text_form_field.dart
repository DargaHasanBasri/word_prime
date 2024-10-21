import 'package:word_prime/export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    this.hintTextColor,
    this.textFieldTitleColor,
    super.key,
    TextInputType? inputType,
    TextInputAction? textInputAction,
    String? hintText,
    String? textFieldTitle,
    String? prefixIconAddress,
    String? suffixIconAddress,
    double? borderRadius,
    Color? textFieldBgColor,
    bool? isAutoTrue,
    bool? isPrefixIcon,
    bool? isSuffixIcon,
    this.onChanged,
    this.onPressSuffixIcon,
    this.isRequired = false,
    this.isHaveObscure = false,
  })  : inputType = inputType ?? TextInputType.text,
        textInputAction = textInputAction ?? TextInputAction.next,
        textFieldBgColor = textFieldBgColor ?? Colors.transparent,
        textFieldTitle = textFieldTitle ?? '',
        hintText = hintText ?? '',
        prefixIconAddress = prefixIconAddress ?? 'assets/images/ic_sms.png',
        suffixIconAddress = suffixIconAddress ?? 'assets/images/ic_sms.png',
        borderRadius = borderRadius ?? 16,
        isAutoTrue = isAutoTrue ?? false,
        isPrefixIcon = isPrefixIcon ?? false,
        isSuffixIcon = isSuffixIcon ?? false;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final String hintText;
  final String textFieldTitle;
  final String prefixIconAddress;
  final String suffixIconAddress;
  final Function? onChanged;
  final VoidCallback? onPressSuffixIcon;
  final double borderRadius;
  final Color textFieldBgColor;
  final Color? hintTextColor;
  final Color? textFieldTitleColor;
  final bool isAutoTrue;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final bool isRequired;
  final bool isHaveObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTextFieldTitle(),
        TextFormField(
          controller: controller,
          obscureText: isHaveObscure,
          autofocus: isAutoTrue,
          keyboardType: inputType,
          textInputAction: textInputAction,
          onChanged: _onChanged,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                decoration: TextDecoration.none,
                decorationThickness: 0,
                color: Theme.of(context).colorScheme.secondary,
              ),
          decoration: InputDecoration(
            prefixIcon: isPrefixIcon
                ? Image.asset(
                    prefixIconAddress,
                    width: AppSizes.appOverallIconWidth,
                    height: AppSizes.appOverallIconHeight,
                  )
                : null,
            suffixIcon: isSuffixIcon
                ? IconButton(
                    onPressed: () => onPressSuffixIcon?.call(),
                    icon: Image.asset(
                      suffixIconAddress,
                      width: AppSizes.appOverallIconWidth,
                      height: AppSizes.appOverallIconHeight,
                    ),
                  )
                : null,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color:
                      hintTextColor ?? Theme.of(context).colorScheme.onTertiary,
                ),
            filled: true,
            fillColor: textFieldBgColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: AppColors.cornflowerBlue,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getTextFieldTitle() {
    if (textFieldTitle.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Text(
              textFieldTitle,
              style: TextStyle(
                fontSize: 14,
                color: textFieldTitleColor ?? AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 6),
            if (isRequired)
              Text(
                '*',
                style: TextStyle(
                  color: AppColors.watermelon,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  void _onChanged(String value) {
    if (onChanged != null) {
      onChanged?.call(value.trim());
    }
  }
}
