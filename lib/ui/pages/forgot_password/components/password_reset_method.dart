import 'package:word_prime/export.dart';

class PasswordResetMethod extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final String subTitle;
  final String iconAddress;
  const PasswordResetMethod({
    super.key,
    required this.onClick,
    required this.title,
    required this.subTitle,
    required this.iconAddress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick.call(),
      child: Container(
        padding: AppPaddings.paddingMediumAll,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: AppPaddings.paddingSmallAll,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceTint,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              child: Image.asset(
                iconAddress,
                width: AppSizes.appOverallIconWidth,
                height: AppSizes.appOverallIconHeight,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              AppAssets.icArrowBackRightPath,
              color: Theme.of(context).colorScheme.secondary,
              width: AppSizes.appOverallIconWidth,
              height: AppSizes.appOverallIconHeight,
            ),
          ],
        ),
      ),
    );
  }
}
