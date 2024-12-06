import 'package:word_prime/export.dart';

class ProfileUserTabBar extends StatelessWidget {
  final ValueNotifier<int> whichIndex;
  const ProfileUserTabBar({
    super.key,
    required this.whichIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        whichIndex.value == 0
            ? Text(
          LocaleKeys.profilePage_posts.locale,
          style: Theme.of(context).textTheme.headlineSmall,
        )
            : whichIndex.value == 1
            ? Text(
          LocaleKeys.profilePage_saved.locale,
          style: Theme.of(context).textTheme.headlineSmall,
        )
            : Text(
          LocaleKeys.profilePage_favorites.locale,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        PopupMenuButton<int>(
          color: Theme.of(context).colorScheme.primary,
          icon: Image.asset(
            AppAssets.icChoicePath,
            height: 24,
            width: 24,
          ),
          onSelected: (int selectedIndex) {
            switch (selectedIndex) {
              case 0:
                whichIndex.value = 0; // Posts
                break;
              case 1:
                whichIndex.value = 1; // Saved
                break;
              case 2:
                whichIndex.value = 2; // Liked
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            PopupMenuItem<int>(
              value: 0,
              child: Text(
                LocaleKeys.profilePage_posts.locale,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Text(
                LocaleKeys.profilePage_saved.locale,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Text(
                LocaleKeys.profilePage_favorites.locale,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
