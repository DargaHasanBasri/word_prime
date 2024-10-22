import 'package:word_prime/export.dart';

class MethodTabBar extends StatelessWidget {
  final String whichMethod;
  final VoidCallback onTapEmailBar;
  final VoidCallback onTapNameBar;
  const MethodTabBar({
    super.key,
    required this.whichMethod,
    required this.onTapEmailBar,
    required this.onTapNameBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTapEmailBar.call(),
              child: Container(
                decoration: whichMethod ==
                        AppLocaleConstants.FORGOT_METHOD_EMAIL
                    ? BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mirage.withOpacity(0.04),
                            offset: Offset(1, 2),
                            blurRadius: 12,
                          ),
                        ],
                      )
                    : BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.forgotPassword_email.locale,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: whichMethod ==
                                AppLocaleConstants.FORGOT_METHOD_EMAIL
                            ? Theme.of(context).colorScheme.secondary
                            : AppColors.santaGrey,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTapNameBar.call(),
              child: Container(
                decoration: whichMethod == AppLocaleConstants.FORGOT_METHOD_NAME
                    ? BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mirage.withOpacity(0.04),
                            offset: Offset(1, 2),
                            blurRadius: 12,
                          ),
                        ],
                      )
                    : BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.forgotPassword_name.locale,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color:
                            whichMethod == AppLocaleConstants.FORGOT_METHOD_NAME
                                ? Theme.of(context).colorScheme.secondary
                                : AppColors.santaGrey,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
