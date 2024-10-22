import 'package:word_prime/export.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.sizedBoxUserListItemWidth,
      child: Column(
        children: [
          CustomUserCircleAvatar(
            borderColor: Theme.of(context).colorScheme.outline,
            borderWidth: 2,
            borderPadding: 2,
            profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
          ),
          SizedBox(height: AppSizes.sizedBoxXSmallHeight),
          Expanded(
            child: Text(
              AppLocaleConstants.DEFAULT_USER_NAME,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
