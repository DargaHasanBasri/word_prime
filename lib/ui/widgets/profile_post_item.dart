import 'package:cached_network_image/cached_network_image.dart';
import 'package:word_prime/export.dart';

class ProfilePostItem extends StatelessWidget {
  final PostModel? postModel;
  final VoidCallback onTapPost;
  const ProfilePostItem({
    super.key,
    required this.postModel,
    required this.onTapPost,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapPost.call(),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: postModel?.postImageAddress == null
            ? Padding(
                padding: AppPaddings.paddingMediumAll,
                child: _buildWithoutImage(context),
              )
            : _buildWithImage(context),
      ),
    );
  }

  Widget _buildWithImage(BuildContext context) {
    DateTime? createdDate = postModel?.createdDate?.toDateTime();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            postModel?.postImageAddress ??
                AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: AppPaddings.paddingSmallAll,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .onTertiaryContainer
                    .withOpacity(0.8),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  CustomUserCircleAvatar(
                    circleRadius: 16,
                    borderPadding: 0,
                    profileImgAddress: postModel?.userProfileImage,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${postModel?.userName ?? ''}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${AppUtility().formatDate(createdDate, context)}',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.santaGrey,
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
        ],
      ),
    );
  }

  Widget _buildWithoutImage(BuildContext context) {
    DateTime? createdDate = postModel?.createdDate?.toDateTime();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                '${postModel?.wordTurkish ?? ''}: ${postModel?.sentenceTurkish?[0] ?? ''}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                    ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Row(
          children: [
            CustomUserCircleAvatar(
              circleRadius: 16,
              borderPadding: 0,
              profileImgAddress: postModel?.userProfileImage,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${postModel?.userName ?? ''}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${AppUtility().formatDate(createdDate, context)}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.santaGrey,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
