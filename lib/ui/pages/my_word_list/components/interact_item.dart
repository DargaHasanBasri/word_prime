import 'package:word_prime/export.dart';

class InteractItem extends StatelessWidget {
  final VoidCallback onTap;
  final String iconAddress;
  final String interactCount;
  const InteractItem({
    super.key,
    required this.onTap,
    required this.iconAddress,
    required this.interactCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTap.call(),
          child: Image.asset(
            iconAddress,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
        ),
        Text(
          interactCount,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.surfaceContainerHigh),
        ),
      ],
    );
  }
}
