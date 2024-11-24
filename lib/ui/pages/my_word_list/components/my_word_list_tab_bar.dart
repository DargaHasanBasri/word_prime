import 'package:word_prime/export.dart';

class MyWordListTabBar extends StatelessWidget {
  final bool isSaved;
  final VoidCallback onTapAdded;
  final VoidCallback onTapSaved;
  const MyWordListTabBar({
    super.key,
    required this.onTapAdded,
    required this.onTapSaved,
    required this.isSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTapAdded.call(),
              child: Container(
                padding: AppPaddings.paddingSmallVertical,
                decoration: BoxDecoration(
                  color: isSaved
                      ? Colors.transparent
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  LocaleKeys.added.locale,
                  style: TextStyle(
                    color: isSaved
                        ? Theme.of(context).colorScheme.onTertiary
                        : Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTapSaved.call(),
              child: Container(
                padding: AppPaddings.paddingSmallVertical,
                decoration: BoxDecoration(
                  color: isSaved
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  LocaleKeys.saved.locale,
                  style: TextStyle(
                    color: isSaved
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onTertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
