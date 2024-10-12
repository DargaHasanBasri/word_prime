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
            borderColor: AppColors.rhino,
            borderWidth: 2,
            profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
          ),
          SizedBox(height: 4),
          Expanded(
            child: Text(
              AppLocaleConstants.DEFAULT_USER_NAME,
              style: TextStyle(
                color: AppColors.mirage,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
