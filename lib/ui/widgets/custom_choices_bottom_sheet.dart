import 'package:word_prime/export.dart';

class CustomChoicesBottomSheet extends StatelessWidget {
  final VoidCallback onTapUpdate;
  final VoidCallback onTapDelete;
  final VoidCallback onTapShare;
  const CustomChoicesBottomSheet({
    super.key,
    required this.onTapUpdate,
    required this.onTapDelete,
    required this.onTapShare,
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
            buttonText: 'UPDATE',
            onTap: () => onTapUpdate.call(),
          ),
          _bottomSheetButton(
            context,
            buttonText: 'DELETE',
            onTap: () => onTapDelete.call(),
          ),
          _bottomSheetButton(
            context,
            buttonText: 'SHARE',
            onTap: () => onTapShare.call(),
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
