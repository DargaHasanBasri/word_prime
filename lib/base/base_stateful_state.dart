import 'dart:async';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:word_prime/export.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  final AppRoutes appRoutes = locator<AppRoutes>();
  final ServiceLocalStorage serviceLocalStorage =
      locator<ServiceLocalStorage>();

  /// OverlayEntry object used for the loading animation
  /// to be displayed on the screen
  /// Defines the appearance and behavior of the loading screen
  /// that will be displayed
  OverlayEntry? _progressOverlayEntry;

  /// A timer to automatically close the loading screen
  Timer? _timeoutTimer;

  /// Maximum time for the loading screen to appear (in seconds)
  static const int TIMEOUT = 10;

  /// Variable used to track remaining time during countdown
  int _remainingTime = TIMEOUT;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  /// Use to show a loading animation to the user during
  /// long running operations
  void showProgress(BuildContext context) {
    /// If a progress overlay is already displayed, it is not added again
    if (_progressOverlayEntry != null) return;

    /// Create a new OverlayEntry
    _progressOverlayEntry = _createProgressOverlay(context);

    /// Add the newly created entry to the overlay
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_progressOverlayEntry!);
      _startTimer();
    });
  }

  /// Use when an action is completed or the loading animation
  /// is no longer necessary
  void hideProgress() {
    try {
      /// If a progress overlay has been added and is still on the screen, remove it.
      if (_progressOverlayEntry != null) {
        /// Removes the overlay
        _progressOverlayEntry!.remove();

        /// Resets the reference
        _progressOverlayEntry = null;

        /// Stops the timer
        _timeoutTimer?.cancel();

        /// Resets the timer to the initial value
        _remainingTime = TIMEOUT;
      }
    } catch (e) {
      /// In case of any error, the error is caught
      debugPrint('Hide progress error: $e');
    }
  }

  /// When `showProgress` is called it automatically starts the countdown.
  /// If `hideProgress` is not called within a certain time (TIMEOUT),
  /// it will automatically close the loading animation.
  void _startTimer() {
    /// If there is already a timer, cancel it
    _timeoutTimer?.cancel();

    /// Start a new timer
    _timeoutTimer = Timer.periodic(
      /// It runs every second
      const Duration(seconds: 1),
      (Timer timer) {
        if (_remainingTime == 0) {
          _remainingTime = TIMEOUT;

          /// Hide progress overlay and stop timer if time is up
          hideProgress();
          timer.cancel();
        } else {
          /// Decrease the countdown by one
          _remainingTime--;
        }
      },
    );
  }

  /// Used to create a loading screen.
  /// It is called by `showProgress` and added to the screen.
  OverlayEntry _createProgressOverlay(BuildContext context) => OverlayEntry(
        builder: (_) => Stack(
          children: [
            /// Creates a translucent background
            ModalBarrier(
              /// User cannot touch other places
              dismissible: false,

              /// Opacity of the background
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            Center(
              child: SpinKitFadingCircle(
                color: Theme.of(context).colorScheme.secondary,
                size: 50.0,
              ),
            ),
          ],
        ),
      );

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

  void showSnackBar({
    required BuildContext context,
    required Widget content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: content,
      ),
    );
  }
}
