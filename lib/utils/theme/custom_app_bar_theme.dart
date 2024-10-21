import 'package:word_prime/export.dart';

final class CustomAppBarTheme {
  CustomAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
    toolbarHeight: AppSizes.toolbarHeight,
    scrolledUnderElevation: 0,
    centerTitle: true,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.mirage,
    toolbarHeight: AppSizes.toolbarHeight,
    scrolledUnderElevation: 0,
    centerTitle: true,
  );
}
