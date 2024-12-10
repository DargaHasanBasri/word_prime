import 'package:word_prime/export.dart';

class CustomCommentBottomSheet extends StatelessWidget {
  final TextEditingController commentController;
  final VoidCallback onPressSuffixIcon;
  final String? currentUserProfileImage;
  final List<CommentModel?>? comments;

  const CustomCommentBottomSheet({
    super.key,
    required this.commentController,
    required this.onPressSuffixIcon,
    required this.currentUserProfileImage,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDragHandle(context),
          Expanded(
            child: ListView.separated(
              padding: AppPaddings.paddingMediumAll,
              itemCount: comments?.length ?? 0,
              itemBuilder: (context, index) {
                final commentModel = comments?[index];
                return _buildUserCommentDetails(
                  context,
                  commentModel: commentModel,
                  dateTime: commentModel?.createdDate?.toDateTime(),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: AppSizes.sizedBoxMediumHeight,
              ),
            ),
          ),
          Padding(
            padding: AppPaddings.paddingMediumAll,
            child: Row(
              children: [
                CustomUserCircleAvatar(
                  profileImgAddress: currentUserProfileImage,
                  borderWidth: 0,
                  circleRadius: 20,
                ),
                SizedBox(width: AppSizes.sizedBoxSmallWidth),
                Expanded(
                  child: CustomTextFormField(
                    controller: commentController,
                    borderRadius: 60,
                    isAutoTrue: true,
                    hintText: LocaleKeys.commentsHintText.locale,
                    textInputAction: TextInputAction.done,
                    isSuffixIcon: true,
                    suffixIconAddress: AppAssets.icSendPath,
                    onPressSuffixIcon: () => onPressSuffixIcon.call(),
                    onChanged: (String text) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: Container(
            height: AppSizes.bottomSheetDragHandleHeight,
            width: AppSizes.bottomSheetDragHandleWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingSmallBottom,
          child: Text(
            LocaleKeys.comments.locale,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Padding(
          padding: AppPaddings.paddingSmallTop,
          child: Container(
            height: 1,
            color: AppColors.platinum.withOpacity(0.3),
          ),
        ),
      ],
    );
  }

  Widget _buildUserCommentDetails(
    BuildContext context, {
    CommentModel? commentModel,
    DateTime? dateTime,
  }) {
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
