final class AppAssets {
  AppAssets._();
  static const _basePath = 'assets/images/';

  static String appLogoPath = _imagePath('ic_app_logo');
  static String icSmsPath = _imagePath('ic_sms');
  static String icLockPath = _imagePath('ic_lock');
  static String icCloseEyePath = _imagePath('ic_close_eye');

  static String _imagePath(String fileName) => '$_basePath$fileName.png';
}
