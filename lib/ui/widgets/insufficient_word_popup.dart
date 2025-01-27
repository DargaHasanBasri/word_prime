import 'package:word_prime/export.dart';

class InsufficientWordPopup extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTapDone;
  const InsufficientWordPopup({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTapDone,
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
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
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
                  title: LocaleKeys.confirm.locale.toUpperCase(),
                  borderRadius: 8,
                  onClick: () => onTapDone.call(),
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
