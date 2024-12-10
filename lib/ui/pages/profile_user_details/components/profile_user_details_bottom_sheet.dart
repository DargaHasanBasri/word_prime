import 'package:word_prime/export.dart';

class ProfileUserDetailsBottomSheet extends StatelessWidget {
  final VoidCallback onTapUnfollow;
  final VoidCallback onTapPoke;
  const ProfileUserDetailsBottomSheet({
    super.key,
    required this.onTapUnfollow,
    required this.onTapPoke,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: AppPaddings.paddingMediumVertical,
            child: Container(
              height: AppSizes.bottomSheetDragHandleHeight,
              width: AppSizes.bottomSheetDragHandleWidth,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          _bottomSheetButton(
            context,
            buttonText: 'UNFOLLOW',
            onTap: () => onTapUnfollow.call(),
          ),
          _bottomSheetButton(
            context,
            buttonText: 'POKE',
            onTap: () => onTapPoke.call(),
          ),
          SizedBox(height: AppSizes.sizedBoxOverallHeight),
        ],
      ),
    );
  }

  Widget _bottomSheetButton(
    BuildContext context, {
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap.call(),
        child: Ink(
          padding: AppPaddings.paddingMediumVertical,
          width: double.infinity,
          color: Colors.transparent,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
