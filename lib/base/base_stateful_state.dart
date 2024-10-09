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
            borderRadius: BorderRadius.circular(6),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          child: child,
        );
      },
    );
  }
}
