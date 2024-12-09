import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/search/components/search_post_interact_items.dart';

class SearchPostWithoutImage extends StatelessWidget {
  final PostModel? postModel;
  const SearchPostWithoutImage({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Türkçe Kelime : ${postModel?.wordTurkish ?? ''} İngilizce Kelime : ${postModel?.wordEnglish ?? ''}\n'
          'Cümleler : ${postModel?.sentenceTurkish?[0] ?? ''} ${postModel?.sentenceEnglish?[0] ?? ''}',
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
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
              AppUtility().formatDate(
                postModel?.createdDate?.toDateTime(),
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
