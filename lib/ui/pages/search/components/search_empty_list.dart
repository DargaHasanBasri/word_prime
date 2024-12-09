import 'package:word_prime/export.dart';

class SearchEmptyList extends StatelessWidget {
  const SearchEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.imgImgEmptySearchListPath,
          ),
          SizedBox(height: 24),
          Text(
            LocaleKeys.searchPage_emptySearch.locale,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
