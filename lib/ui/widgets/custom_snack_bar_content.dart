import 'package:word_prime/export.dart';

class CustomSnackBarContent extends StatelessWidget {
  final String text;
  final CustomSnackBarType iconType;
  const CustomSnackBarContent({
    super.key,
    required this.text,
    required this.iconType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: iconType.color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: iconType.color,
        ),
        boxShadow: [
          BoxShadow(
            color: iconType.color.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 18,
            child: Icon(
              iconType.icon,
              color: iconType.color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
