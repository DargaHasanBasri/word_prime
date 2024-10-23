import 'package:word_prime/export.dart';

class InactiveBottomNavigationBarItem extends StatelessWidget {
  final String iconAddress;
  final VoidCallback onTapIcon;
  const InactiveBottomNavigationBarItem({
    super.key,
    required this.iconAddress,
    required this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.transparent,
        onTap: () => onTapIcon.call(),
        child: Ink(
          padding: EdgeInsets.all(10),
          child: Image.asset(
            iconAddress,
            width: AppSizes.appOverallIconWidth,
            height: AppSizes.appOverallIconHeight,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ),
      ),
    );
  }
}
