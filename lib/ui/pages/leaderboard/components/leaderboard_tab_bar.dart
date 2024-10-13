import 'package:word_prime/export.dart';

class LeaderboardTabBar extends StatelessWidget {
  final String timeType;
  final VoidCallback onTapAllTime;
  final VoidCallback onTapWeekly;
  const LeaderboardTabBar({
    super.key,
    required this.onTapAllTime,
    required this.onTapWeekly,
    required this.timeType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.metallicBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTapAllTime.call(),
              child: Container(
                padding: AppPaddings.paddingSmallVertical,
                decoration: BoxDecoration(
                  color: timeType == 'allTime'
                      ? AppColors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  LocaleKeys.tasksPage_allTime.locale,
                  style: TextStyle(
                    color: timeType == 'allTime'
                        ? AppColors.mirage
                        : AppColors.santaGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTapWeekly.call(),
              child: Container(
                padding: AppPaddings.paddingSmallVertical,
                decoration: BoxDecoration(
                  color: timeType == 'weekly'
                      ? AppColors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  LocaleKeys.tasksPage_weekly.locale,
                  style: TextStyle(
                    color: timeType == 'weekly'
                        ? AppColors.mirage
                        : AppColors.santaGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
