import 'package:word_prime/export.dart';

class OrTextContainer extends StatelessWidget {
  const OrTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.softPeach,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingMediumHorizontal,
          child: Text(
            LocaleKeys.or.locale,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.santaGrey,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.softPeach,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
