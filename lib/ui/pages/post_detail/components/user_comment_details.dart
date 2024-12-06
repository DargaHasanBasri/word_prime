import 'package:word_prime/export.dart';

class UserCommentDetails extends StatelessWidget {
  final CommentModel? commentModel;
  final DateTime? dateTime;
  const UserCommentDetails({
    super.key,
    required this.commentModel,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomUserCircleAvatar(
                circleRadius: 16,
                borderWidth: 0,
                profileImgAddress: commentModel?.userProfileImage,
              ),
              SizedBox(width: AppSizes.sizedBoxSmallWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            '${commentModel?.userName ?? ''}',
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(width: AppSizes.sizedBoxSmallWidth),
                        Text(
                          AppUtility().timeAgo(dateTime, isAbbreviation: true),
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.sizedBoxSmallHeight),
                    Text(
                      '${commentModel?.commentText ?? ''}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: AppPaddings.paddingMediumHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.icInactiveLikePath,
                width: 16,
                height: 16,
              ),
              SizedBox(height: AppSizes.sizedBoxSmallHeight),
              Text(
                '${commentModel?.totalLikes ?? 0}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
