import 'package:word_prime/export.dart';

class SearchUserInfo extends StatelessWidget {
  final UserModel? userModel;
  final VoidCallback onTapUserInfo;
  const SearchUserInfo({
    super.key,
    required this.userModel,
    required this.onTapUserInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapUserInfo.call(),
      child: Row(
        children: [
          CustomUserCircleAvatar(
            borderPadding: 0,
            profileImgAddress: userModel?.profileImageAddress,
          ),
          SizedBox(width: AppSizes.sizedBoxSmallWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${userModel?.userName ?? ''}',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppSizes.sizedBoxSmallHeight),
              Text(
                'Followers ${userModel?.totalPost ?? '0'}, Follows ${userModel?.totalPost ?? '0'},',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Posts ${userModel?.totalPost ?? '0'}, Score ${userModel?.totalScore ?? '0'}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
