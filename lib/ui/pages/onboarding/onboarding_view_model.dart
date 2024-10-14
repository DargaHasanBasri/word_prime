import 'package:word_prime/export.dart';

class OnboardingViewModel extends BaseViewModel {
  ValueNotifier<int> currentPage = ValueNotifier(0);

  void nextPage(PageController pageController) {
    if (currentPage.value < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  bool lastPage() {
    if (currentPage.value == 1) return true;
    return false;
  }
}
