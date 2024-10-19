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
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSizes.sizedBoxSmallHeight),
        Text(
          subTitle,
          style: TextStyle(
            color: AppColors.santaGrey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: 'Cancel',
                  backgroundColor: AppColors.white,
                  borderRadius: 8,
                  onClick: () => onTapCancelButton.call(),
                  borderColor: AppColors.cornflowerBlue,
                  titleVerticalPadding: 8,
                  titleColor: AppColors.cornflowerBlue,
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: CustomButton(
                  title: 'Confirm',
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
