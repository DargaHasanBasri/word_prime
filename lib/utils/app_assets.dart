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
  static String icAddPhotoPath = _imagePath('ic_add_photo');
  static String icDarkModePath = _imagePath('ic_dark_mode');
  static String icFaqsPath = _imagePath('ic_faqs');
  static String icHelpPath = _imagePath('ic_help');
  static String icLanguagePath = _imagePath('ic_language');
  static String icNotificationPath = _imagePath('ic_notification');
  static String icPrivacyPath = _imagePath('ic_privacy');
  static String icMainTabHomePath = _imagePath('ic_main_tab_home');
  static String icMainTabGamePath = _imagePath('ic_main_tab_game');
  static String icMainTabWordAddPath = _imagePath('ic_main_tab_word_add');
  static String icMainTabTaskPath = _imagePath('ic_main_tab_task');
  static String icMainTabProfilePath = _imagePath('ic_main_tab_profile');
  static String icLikePath = _imagePath('ic_like');
  static String icCommentPath = _imagePath('ic_comment');
  static String icSavePath = _imagePath('ic_save');
  static String icSharePath = _imagePath('ic_share');
  static String imgSuccessfulPath = _imagePath('img_successful');

  static String _imagePath(String fileName) => '$_basePath$fileName.png';
}
