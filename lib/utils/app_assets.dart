final class AppAssets {
  AppAssets._();
  static const _basePath = 'assets/images/';

  static String appLogoPath = _imagePath('ic_app_logo');
  static String icSmsPath = _imagePath('ic_sms');
  static String icLockPath = _imagePath('ic_lock');
  static String icCloseEyePath = _imagePath('ic_close_eye');
  static String icOpenEyePath = _imagePath('ic_open_eye');
  static String icApplePath = _imagePath('ic_apple');
  static String icGooglePath = _imagePath('ic_google');
  static String icUserPath = _imagePath('ic_user');
  static String icArrowBackRightPath = _imagePath('ic_arrow_back_right');
  static String icArrowBackLeftPath = _imagePath('ic_arrow_back_left');
  static String icArrowDownPath = _imagePath('ic_arrow_down');
  static String icArrowUpPath = _imagePath('ic_arrow_up');
  static String icAddPhotoPath = _imagePath('ic_add_photo');
  static String icDarkModePath = _imagePath('ic_dark_mode');
  static String icLightModePath = _imagePath('ic_light_mode');
  static String icFaqsPath = _imagePath('ic_faqs');
  static String icHelpPath = _imagePath('ic_help');
  static String icLanguagePath = _imagePath('ic_language');
  static String icNotificationPath = _imagePath('ic_notification');
  static String icPrivacyPath = _imagePath('ic_privacy');
  static String icMainTabHomePath = _imagePath('ic_main_tab_home');
  static String icMainTabActivityPath = _imagePath('ic_main_tab_activity');
  static String icMainTabWordAddPath = _imagePath('ic_main_tab_word_add');
  static String icMainTabTaskPath = _imagePath('ic_main_tab_task');
  static String icMainTabProfilePath = _imagePath('ic_main_tab_profile');
  static String icActiveLikePath = _imagePath('ic_active_like');
  static String icInactiveLikePath = _imagePath('ic_inactive_like');
  static String icCommentPath = _imagePath('ic_comment');
  static String icActiveSavePath = _imagePath('ic_active_save');
  static String icInactiveSavePath = _imagePath('ic_inactive_save');
  static String icSendPath = _imagePath('ic_send');
  static String icScorePath = _imagePath('ic_score');
  static String icTaskDailyPath = _imagePath('ic_task_daily');
  static String icTaskWeeklyPath = _imagePath('ic_task_weekly');
  static String icRankFirstPath = _imagePath('ic_rank_first');
  static String icSettingsPath = _imagePath('ic_settings');
  static String icClosePath = _imagePath('ic_close');
  static String icLogoutPath = _imagePath('ic_logout');
  static String icEmailVerificationPath = _imagePath('ic_email_verification');
  static String icResetPasswordPath = _imagePath('ic_reset_password');
  static String icChoicePath = _imagePath('ic_choice');
  static String imgSuccessfulPath = _imagePath('img_successful');
  static String imgExampPostPath = _imagePath('img_examp_post');
  static String imgQuizAnalysisPath = _imagePath('img_quiz_analysis');
  static String imgQuizAnalysisIllustrationPath =
      _imagePath('img_quiz_analysis_illustration');
  static String imgImgDeerPath = _imagePath('img_deer');
  static String imgImgBookPath = _imagePath('img_book');
  static String imgImgGetStartedPath = _imagePath('img_get_started');
  static String imgImgEmptyWordListPath = _imagePath('img_empty_word_list');

  static String _imagePath(String fileName) => '$_basePath$fileName.png';
}
