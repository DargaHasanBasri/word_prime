import 'package:word_prime/export.dart';

class PostWithoutImage extends StatelessWidget {
  final PostModel? postModel;
  final VoidCallback? onTabPost;

  const PostWithoutImage({
    super.key,
    required this.postModel,
    required this.onTabPost,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isTranslatePost = ValueNotifier(false);
    return ValueListenableBuilder(
        valueListenable: isTranslatePost,
        builder: (_, __, ___) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => onTabPost?.call(),
                child: Text(
                  'İngilizce Kelime: ${postModel?.wordEnglish ?? ''}\n'
                  'İngilizce Cümle: ${postModel?.sentenceEnglish?[0] ?? ''}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            Theme.of(context).colorScheme.surfaceContainerHigh,
                        fontWeight: FontWeight.w400,
                      ),
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: AppSizes.sizedBoxXSmallHeight),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    isTranslatePost.value = !isTranslatePost.value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: Image.asset(
                      width: AppSizes.appOverallIconWidth,
                      height: AppSizes.appOverallIconHeight,
                      color: Theme.of(context).colorScheme.secondary,
                      isTranslatePost.value
                          ? AppAssets.icArrowUpPath
                          : AppAssets.icArrowDownPath,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isTranslatePost.value,
                child: Text(
                  'Türkçe Kelime: ${postModel?.wordTurkish ?? ''}\n'
                  'Türkçe Cümle: ${postModel?.sentenceTurkish?[0] ?? ''}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            Theme.of(context).colorScheme.surfaceContainerHigh,
                        fontWeight: FontWeight.w400,
                      ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        });
  }
}
