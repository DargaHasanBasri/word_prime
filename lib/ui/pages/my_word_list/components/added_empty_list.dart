import 'package:word_prime/export.dart';

class AddedEmptyList extends StatelessWidget {
  const AddedEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.imgImgEmptyWordListPath),
        Padding(
          padding: AppPaddings.paddingSmallVertical,
          child: Text(
            LocaleKeys.myWordList_title.locale,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          LocaleKeys.myWordList_subTitle.locale,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
