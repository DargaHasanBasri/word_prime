import 'package:word_prime/export.dart';

class CustomAppPopup extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTapCancelButton;
  final VoidCallback onTapConfirmButton;
  const CustomAppPopup({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTapCancelButton,
    required this.onTapConfirmButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: AppPaddings.paddingLargeTop,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSizes.sizedBoxSmallHeight),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: LocaleKeys.cancel.locale,
                  backgroundColor: Colors.transparent,
                  borderRadius: 8,
                  onClick: () => onTapCancelButton.call(),
                  borderColor: AppColors.cornflowerBlue,
                  titleVerticalPadding: 8,
                  titleColor: AppColors.cornflowerBlue,
                ),
              ),
              SizedBox(width: AppSizes.sizedBoxOverallWidth),
              Expanded(
                child: CustomButton(
                  title: LocaleKeys.confirm.locale,
                  borderRadius: 8,
                  onClick: () => onTapConfirmButton.call(),
                  titleVerticalPadding: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
