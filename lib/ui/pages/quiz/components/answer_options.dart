import 'package:word_prime/export.dart';

class AnswerOptions extends StatelessWidget {
  final List<String?> options;
  final String? correctOption;
  final ValueNotifier<String?> selectedOption;
  final VoidCallback onCorrectAnswer;
  final VoidCallback onIncorrectAnswer;
  final VoidCallback onClickNext;

  const AnswerOptions({
    super.key,
    required this.options,
    required this.correctOption,
    required this.selectedOption,
    required this.onCorrectAnswer,
    required this.onIncorrectAnswer,
    required this.onClickNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: options.map(
            (option) {
              return Padding(
                padding: AppPaddings.paddingMediumBottom,
                child: ValueListenableBuilder(
                  valueListenable: selectedOption,
                  builder: (_, __, ___) {
                    final isSelected = selectedOption.value == option;
                    final isCorrect = correctOption == option;
                    return GestureDetector(
                      onTap: selectedOption.value == null
                          ? () {
                              selectedOption.value = option;
                              isCorrect
                                  ? onCorrectAnswer.call()
                                  : onIncorrectAnswer.call();
                            }
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.iron,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? isCorrect
                                      ? AppColors.greenishTeal
                                      : AppColors.artyClickRed
                                  : AppColors.iron,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? isCorrect
                                    ? AppColors.greenishTeal
                                    : AppColors.artyClickRed
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            option ?? "",
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.mirage,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ).toList(),
        ),
        ValueListenableBuilder(
          valueListenable: selectedOption,
          builder: (_, __, ___) {
            final isCorrectMsg = selectedOption.value == correctOption;
            final msg = isCorrectMsg
                ? "Doğru Cevap Tebrikler!"
                : "Yanlış cevap! Doğrusu : $correctOption";
            return selectedOption.value != null
                ? Padding(
                    padding: AppPaddings.paddingMediumHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomButton(
                          title: 'NEXT',
                          titleColor: AppColors.mirage,
                          backgroundColor: AppColors.white.withOpacity(0.8),
                          onClick: () => onClickNext.call(),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: AppPaddings.paddingMediumHorizontal,
                          child: Text(
                            "${msg}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox();
          },
        ),
      ],
    );
  }
}
