import 'package:word_prime/generated/locale_keys.g.dart';
import 'package:word_prime/utils/extensions/ext_string_localizations.dart';

enum TimeAgoKeys {
  weekAbbreviation,
  weekAgo,
  daysAbbreviation,
  daysAgo,
  hoursAbbreviation,
  hoursAgo,
  minutesAbbreviation,
  minutesAgo,
  justNow;

  String get localizedText {
    switch (this) {
      case TimeAgoKeys.weekAbbreviation:
        return LocaleKeys.timeAgoMsg_weekAbbreviation.locale;
      case TimeAgoKeys.weekAgo:
        return LocaleKeys.timeAgoMsg_weekAgo.locale;
      case TimeAgoKeys.daysAbbreviation:
        return LocaleKeys.timeAgoMsg_daysAbbreviation.locale;
      case TimeAgoKeys.daysAgo:
        return LocaleKeys.timeAgoMsg_daysAgo.locale;
      case TimeAgoKeys.hoursAbbreviation:
        return LocaleKeys.timeAgoMsg_hoursAbbreviation.locale;
      case TimeAgoKeys.hoursAgo:
        return LocaleKeys.timeAgoMsg_hoursAgo.locale;
      case TimeAgoKeys.minutesAbbreviation:
        return LocaleKeys.timeAgoMsg_minutesAbbreviation.locale;
      case TimeAgoKeys.minutesAgo:
        return LocaleKeys.timeAgoMsg_minutesAgo.locale;
      case TimeAgoKeys.justNow:
        return LocaleKeys.timeAgoMsg_justNow.locale;
    }
  }
}
