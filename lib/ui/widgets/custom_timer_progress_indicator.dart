import 'package:word_prime/export.dart';

class CustomTimerProgressIndicator extends StatelessWidget {
  final ValueNotifier<int> time;
  const CustomTimerProgressIndicator({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ValueListenableBuilder(
        valueListenable: time,
        builder: (_, __, ___) {
          return Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: 1 - (time.value / AppLocaleConstants.MAX_SECONDS),
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(AppColors.cornflowerBlue),
                backgroundColor: AppColors.white,
              ),
              Center(
                child: Text(
                  '${time.value}',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
