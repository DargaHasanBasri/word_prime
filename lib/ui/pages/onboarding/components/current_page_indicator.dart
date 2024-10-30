import 'package:word_prime/export.dart';

class CurrentPageIndicator extends StatelessWidget {
  final ValueNotifier<int> currentIndex;
  final int countPage;

  const CurrentPageIndicator({
    Key? key,
    required this.currentIndex,
    required this.countPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndex,
      builder: (_, __, ___) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            countPage,
            (index) {
              bool isActive = index == currentIndex.value;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  width: isActive ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.cornflowerBlue.withOpacity(
                      isActive ? 1 : 0.5,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
