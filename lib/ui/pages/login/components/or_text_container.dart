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
              color: Theme.of(context).colorScheme.onTertiary,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingMediumHorizontal,
          child: Text(
            LocaleKeys.or.locale,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onTertiary,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
