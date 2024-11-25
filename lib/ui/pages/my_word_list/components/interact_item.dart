import 'package:word_prime/export.dart';
import 'package:word_prime/utils/extensions/ext_number_formatter.dart';

class InteractItem extends StatelessWidget {
  final VoidCallback onTap;
  final String iconAddress;
  final int interactCount;
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
          interactCount.formatCount(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.surfaceContainerHigh),
        ),
      ],
    );
  }
}
