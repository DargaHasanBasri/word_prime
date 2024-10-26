import 'package:word_prime/export.dart';

class ProfileDetailContainer extends StatelessWidget {
  final String detailTitle;
  final int detailCount;
  final String detailIcon;
  final Color detailColor;
  final VoidCallback onTap;
  const ProfileDetailContainer({
    super.key,
    required this.detailTitle,
    required this.detailCount,
    required this.detailIcon,
    required this.detailColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          child: InkWell(
            onTap: () => onTap.call(),
            borderRadius: BorderRadius.circular(50),
            child: Ink(
              padding: AppPaddings.paddingMediumAll,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                detailIcon,
                color: detailColor,
                width: AppSizes.appOverallIconWidth,
                height: AppSizes.appOverallIconHeight,
              ),
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingXSmallLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${detailCount}',
                style: TextStyle(
                  color: detailColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                detailTitle,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
