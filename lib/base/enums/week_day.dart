import 'package:word_prime/generated/locale_keys.g.dart';
import 'package:word_prime/utils/extensions/ext_string_localizations.dart';

/// Enum representing days of the week.
/// Includes full day names and abbreviations.
enum WeekDay {
  monday,
  mon,
  tuesday,
  tue,
  wednesday,
  wed,
  thursday,
  thu,
  friday,
  fri,
  saturday,
  sat,
  sunday,
  sun,
  other;

  /// Returns the day of the week as localized text.
  String get localizedText {
    switch (this) {
      case WeekDay.monday:
        return LocaleKeys.days_monday.locale;
      case WeekDay.mon:
        return LocaleKeys.days_mon.locale;

      case WeekDay.tuesday:
        return LocaleKeys.days_tuesday.locale;
      case WeekDay.tue:
        return LocaleKeys.days_tue.locale;

      case WeekDay.wednesday:
        return LocaleKeys.days_wednesday.locale;
      case WeekDay.wed:
        return LocaleKeys.days_wed.locale;

      case WeekDay.thursday:
        return LocaleKeys.days_thursday.locale;
      case WeekDay.thu:
        return LocaleKeys.days_thu.locale;

      case WeekDay.friday:
        return LocaleKeys.days_friday.locale;
      case WeekDay.fri:
        return LocaleKeys.days_fri.locale;

      case WeekDay.saturday:
        return LocaleKeys.days_saturday.locale;
      case WeekDay.sat:
        return LocaleKeys.days_sat.locale;

      case WeekDay.sunday:
        return LocaleKeys.days_sunday.locale;
      case WeekDay.sun:
        return LocaleKeys.days_sun.locale;

      case WeekDay.other:
        return LocaleKeys.days_sun.locale;
    }
  }
}
