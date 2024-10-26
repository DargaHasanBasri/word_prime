import 'package:word_prime/export.dart';

class ChangeLanguagePopup extends StatelessWidget {
  final String groupValue;
  final ValueChanged<String?> onChangedEnglish;
  final ValueChanged<String?> onChangedTurkish;
  final VoidCallback onTapCancelButton;
  final VoidCallback onTapConfirmButton;
  const ChangeLanguagePopup({
    super.key,
    required this.groupValue,
    required this.onChangedEnglish,
    required this.onChangedTurkish,
    required this.onTapCancelButton,
    required this.onTapConfirmButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: AppPaddings.appPaddingVertical,
          child: Text(
            LocaleKeys.settings_changeLanguageTitle.locale,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 20,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: AppPaddings.appPaddingLargeHorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadioButton(
                title: LocaleKeys.english.locale,
                value: AppLocaleConstants.EN_RADIO_BTN_VALUE,
                groupValue: groupValue,
                onChanged: onChangedEnglish,
              ),
              CustomRadioButton(
                title: LocaleKeys.turkish.locale,
                value: AppLocaleConstants.TR_RADIO_BTN_VALUE,
                groupValue: groupValue,
                onChanged: onChangedTurkish,
              ),
            ],
          ),
        ),
        Padding(
          padding: AppPaddings.appPaddingAll,
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
