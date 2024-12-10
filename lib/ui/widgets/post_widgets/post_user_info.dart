import 'package:word_prime/export.dart';

class PostUserInfo extends StatelessWidget {
  final PostModel? postModel;
  final VoidCallback onTabChoice;
  final VoidCallback onTabUserProfile;
  const PostUserInfo({
    super.key,
    required this.postModel,
    required this.onTabChoice,
    required this.onTabUserProfile,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime? dateTime = postModel?.createdDate?.toDateTime();
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onTabUserProfile.call(),
            child: Row(
              children: [
                CustomUserCircleAvatar(
                  circleRadius: 20,
                  borderPadding: 0,
                  profileImgAddress: postModel?.userProfileImage,
                ),
                SizedBox(width: AppSizes.sizedBoxMediumWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postModel?.userName ?? '',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHigh,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${AppUtility().timeAgo(dateTime)}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTabChoice.call(),
          child: Image.asset(
            AppAssets.icChoicePath,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
          ),
        ),
      ],
    );
  }
}
