import 'package:word_prime/export.dart';
import 'package:word_prime/ui/widgets/custom_timer_progress_indicator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<int> progressIndicatorTimeNotifier;
  final VoidCallback exitOnTap;
  const CustomAppBar({
    super.key,
    required this.progressIndicatorTimeNotifier,
    required this.exitOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.rhino,
      toolbarHeight: AppSizes.toolbarHeight,
      automaticallyImplyLeading: false,
      title: Stack(
        children: [
          _exitButton(),
          Center(
            child: CustomTimerProgressIndicator(
              time: progressIndicatorTimeNotifier,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _scoreBoard(),
          ),
        ],
      ),
    );
  }

  Widget _exitButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: AppColors.white.withOpacity(0.1),
        onTap: () => exitOnTap.call(),
        child: Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: AppColors.white.withOpacity(0.30),
              width: 3,
            ),
          ),
          child: Image.asset(
            AppAssets.icClosePath,
            width: 12,
            height: 12,
          ),
        ),
      ),
    );
  }

  Widget _scoreBoard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2) +
          EdgeInsets.only(right: 2, left: 8),
      decoration: ShapeDecoration(
        shape: StadiumBorder(side: BorderSide.none),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '12',
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 4),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.pastelBlue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              AppAssets.icScorePath,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.toolbarHeight);
}
