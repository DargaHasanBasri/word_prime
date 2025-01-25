import 'package:word_prime/generated/locale_keys.g.dart';
import 'package:word_prime/utils/extensions/ext_string_localizations.dart';

/// It is an enum class that specifies the message
/// to be shown for the specified time period.
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

  /// Returns the localized text of each enum element.
  String get localizedText {
    switch (this) {
      /// Returns the abbreviated expression for "week".
      case TimeAgoKeys.weekAbbreviation:
        return LocaleKeys.timeAgoMsg_weekAbbreviation.locale;

      /// Returns the message for "week ago".
      case TimeAgoKeys.weekAgo:
        return LocaleKeys.timeAgoMsg_weekAgo.locale;

      /// Returns the abbreviated expression message for "day".
      case TimeAgoKeys.daysAbbreviation:
        return LocaleKeys.timeAgoMsg_daysAbbreviation.locale;

      /// Returns the message "Day ago".
      case TimeAgoKeys.daysAgo:
        return LocaleKeys.timeAgoMsg_daysAgo.locale;

      /// Returns the abbreviated expression message for "hour".
      case TimeAgoKeys.hoursAbbreviation:
        return LocaleKeys.timeAgoMsg_hoursAbbreviation.locale;

      /// Returns the message "Hours ago".
      case TimeAgoKeys.hoursAgo:
        return LocaleKeys.timeAgoMsg_hoursAgo.locale;

      /// Returns the abbreviated expression message for "minutes".
      case TimeAgoKeys.minutesAbbreviation:
        return LocaleKeys.timeAgoMsg_minutesAbbreviation.locale;

      /// Returns the message "Minutes ago".
      case TimeAgoKeys.minutesAgo:
        return LocaleKeys.timeAgoMsg_minutesAgo.locale;

      /// The message "Just now" is returned.
      case TimeAgoKeys.justNow:
        return LocaleKeys.timeAgoMsg_justNow.locale;
    }
  }
}
