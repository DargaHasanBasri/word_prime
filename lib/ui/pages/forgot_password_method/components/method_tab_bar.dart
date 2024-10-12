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
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.alabaster,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTapEmailBar.call(),
              child: Container(
                decoration: whichMethod == AppLocaleConstants.FORGOT_METHOD_EMAIL
                    ? BoxDecoration(
                        color: AppColors.white,
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
                        color: AppColors.alabaster,
                      ),
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.forgotPassword_email.locale,
                  style: TextStyle(
                    color: whichMethod == AppLocaleConstants.FORGOT_METHOD_EMAIL
                        ? AppColors.mirage
                        : AppColors.santaGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
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
                        color: AppColors.white,
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
                        color: AppColors.alabaster,
                      ),
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.forgotPassword_name.locale,
                  style: TextStyle(
                    color: whichMethod == AppLocaleConstants.FORGOT_METHOD_NAME
                        ? AppColors.mirage
                        : AppColors.santaGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
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
