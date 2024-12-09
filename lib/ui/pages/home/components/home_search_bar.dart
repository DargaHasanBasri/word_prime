import 'package:word_prime/export.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback onTapSearchBar;
  const HomeSearchBar({
    super.key,
    required this.onTapSearchBar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapSearchBar.call(),
      child: Container(
        padding: AppPaddings.paddingSmallHorizontal,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.icSearchPath,
                color: AppColors.santaGrey,
                width: 24,
                height: 24,
              ),
            ),
            Expanded(
              child: Text(
                LocaleKeys.homePage_searchText.locale,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
