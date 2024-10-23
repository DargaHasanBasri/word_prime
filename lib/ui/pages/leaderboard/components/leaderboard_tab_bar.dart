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
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTapAllTime.call(),
              child: Container(
                padding: AppPaddings.paddingSmallVertical,
                decoration: timeType == 'allTime'
                    ? BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mirage.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      )
                    : BoxDecoration(
                        color: Colors.transparent,
                      ),
                child: Text(
                  LocaleKeys.tasksPage_allTime.locale,
                  style: TextStyle(
                    color: timeType == 'allTime'
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onTertiary,
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
                decoration: timeType == 'weekly'
                    ? BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mirage.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      )
                    : BoxDecoration(
                        color: Colors.transparent,
                      ),
                child: Text(
                  LocaleKeys.tasksPage_weekly.locale,
                  style: TextStyle(
                    color: timeType == 'weekly'
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onTertiary,
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
