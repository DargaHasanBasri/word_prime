import 'package:word_prime/export.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  final AppRoutes appRoutes = locator<AppRoutes>();
  final ServiceLocalStorage serviceLocalStorage =
      locator<ServiceLocalStorage>();

  void showPopupDialog({
    required BuildContext context,
    required Widget child,
  }) {
    showDialog<void>(
      barrierColor: AppColors.mirage.withOpacity(0.8),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          insetPadding: AppPaddings.appPaddingHorizontal,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: child,
        );
      },
    );
  }

  void showCustomBottomSheet({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: child,
        );
      },
    );
  }
}
