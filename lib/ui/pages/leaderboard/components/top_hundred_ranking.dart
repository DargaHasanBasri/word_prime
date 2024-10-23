import 'package:word_prime/export.dart';

class TopHundredRanking extends StatelessWidget {
  final int rankOrder;
  final String profileImgAddress;
  final String userName;
  final int userScore;
  final VoidCallback onTap;
  const TopHundredRanking({
    super.key,
    required this.rankOrder,
    required this.profileImgAddress,
    required this.userName,
    required this.userScore,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.paddingSmallAll,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.rhino.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '${rankOrder + 4}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: AppPaddings.paddingMediumHorizontal,
            child: CustomUserCircleAvatar(
              circleRadius: 20,
              borderColor: Theme.of(context).colorScheme.outline,
              borderWidth: 2,
              borderPadding: 2,
              profileImgAddress: profileImgAddress,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${LocaleKeys.score.locale} ${userScore + 1000}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: AppPaddings.paddingSmallLeft,
              child: CustomButton(
                title: LocaleKeys.follow.locale,
                titleVerticalPadding: 6,
                borderRadius: 8,
                onClick: () => onTap.call(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
