import 'package:cached_network_image/cached_network_image.dart';
import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/search/components/search_post_interact_items.dart';

class SearchPostWithImage extends StatelessWidget {
  final PostModel? postModel;
  const SearchPostWithImage({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.3),
                      offset: Offset(0, 10),
                      blurRadius: 16,
                    ),
                  ],
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      postModel?.postImageAddress ??
                          AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.sizedBoxMediumWidth),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Text(
                  'Türkçe Kelime : ${postModel?.wordTurkish ?? ''} İngilizce Kelime : ${postModel?.wordEnglish ?? ''}\n'
                  'Cümleler : ${postModel?.sentenceTurkish?[0] ?? ''} ${postModel?.sentenceEnglish?[0] ?? ''}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: AppSizes.sizedBoxSmallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchPostInteractItems(
                    onTabLike: () {},
                    onTabSave: () {},
                    postModel: postModel,
                    isLiked: null,
                    isSaved: null,
                  ),
                  Text(
                    AppUtility().timeAgo(
                      postModel?.createdDate?.toDateTime(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
