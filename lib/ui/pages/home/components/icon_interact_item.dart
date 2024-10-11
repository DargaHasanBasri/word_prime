import 'package:word_prime/export.dart';

class IconInteractItem extends StatelessWidget {
  final VoidCallback onTap;
  final String iconAddress;
  final String interactCount;
  const IconInteractItem({
    super.key,
    required this.onTap,
    required this.iconAddress,
    required this.interactCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onTap.call(),
          child: Image.asset(
            iconAddress,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
        ),
        SizedBox(width: AppSizes.sizedBoxSmallWidth),
        Text(
          interactCount,
          style: TextStyle(
            color: AppColors.ebonyClay,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
