final class AppAssets {
  AppAssets._();
  static const _basePath = 'assets/images/';

  static String appLogoPath = _imagePath('ic_app_logo');
  static String icSmsPath = _imagePath('ic_sms');
  static String icLockPath = _imagePath('ic_lock');
  static String icCloseEyePath = _imagePath('ic_close_eye');
  static String icApplePath = _imagePath('ic_apple');
  static String icGooglePath = _imagePath('ic_google');
  static String icUserPath = _imagePath('ic_user');
  static String icArrowBackRightPath = _imagePath('ic_arrow_back_right');
  static String icArrowBackLeftPath = _imagePath('ic_arrow_back_left');
  static String icArrowDownPath = _imagePath('ic_arrow_down');

  static String _imagePath(String fileName) => '$_basePath$fileName.png';
}
