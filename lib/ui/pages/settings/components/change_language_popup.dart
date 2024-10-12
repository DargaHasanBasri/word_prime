import 'package:word_prime/export.dart';

class ChangeLanguagePopup extends StatelessWidget {
  final String groupValue;
  final ValueChanged<String?> onChangedEnglish;
  final ValueChanged<String?> onChangedTurkish;
  final VoidCallback onTabChangeButton;
  const ChangeLanguagePopup({
    super.key,
    required this.groupValue,
    required this.onChangedEnglish,
    required this.onChangedTurkish,
    required this.onTabChangeButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            LocaleKeys.settings_changeLanguageTitle.locale,
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
          padding: const EdgeInsets.all(24),
          child: CustomButton(
            title: LocaleKeys.change.locale,
            backgroundColor: AppColors.cornflowerBlue,
            titleColor: AppColors.white,
            onClick: () => onTabChangeButton.call(),
          ),
        ),
      ],
    );
  }
}
