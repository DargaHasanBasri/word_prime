import 'package:word_prime/export.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  final AppRoutes appRoutes = locator<AppRoutes>();

  void showPopupDialog({
    required BuildContext context,
    required Widget child,
  }) {
    showDialog<void>(
      barrierColor: AppColors.mirage.withOpacity(0.74),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
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
