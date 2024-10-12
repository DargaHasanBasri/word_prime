import 'package:word_prime/export.dart';

class ActiveBottomNavigationBarItem extends StatelessWidget {
  final String iconAddress;
  final String pageName;
  const ActiveBottomNavigationBarItem({
    super.key,
    required this.iconAddress,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cornflowerBlue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Image.asset(
              iconAddress,
              width: AppSizes.appOverallIconWidth,
              height: AppSizes.appOverallIconHeight,
              color: AppColors.white,
            ),
            SizedBox(width: 8),
            Text(
              pageName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
