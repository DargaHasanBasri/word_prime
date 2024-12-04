import 'package:cached_network_image/cached_network_image.dart';
import 'package:word_prime/export.dart';

class ProfilePostItem extends StatelessWidget {
  final PostModel? postModel;
  const ProfilePostItem({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cornflowerBlue,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        image: postModel?.postImageAddress != null
            ? DecorationImage(
                image: CachedNetworkImageProvider(
                  postModel?.postImageAddress ??
                      AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                ),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: postModel?.postImageAddress == null
          ? Padding(
              padding: AppPaddings.paddingMediumAll,
              child: _buildWithoutImage(context),
            )
          : null,
    );
  }

  Widget _buildWithoutImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${postModel?.wordTurkish ?? ''}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        Text(
          '${postModel?.sentenceTurkish?[0] ?? ''}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
