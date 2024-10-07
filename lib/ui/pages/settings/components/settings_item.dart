import 'package:word_prime/export.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTab;
  final String iconAddress;
  const SettingsItem({
    super.key,
    required this.title,
    required this.onTab,
    required this.iconAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            iconAddress,
            width: 24,
            height: 24,
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Image.asset(
            AppAssets.icArrowBackRightPath,
            color: AppColors.santaGrey,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
