import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:word_prime/export.dart';

/// Contains commonly used helper functions throughout the application.
/// It manages functions such as date and time formatting, time zone calculations,
/// and selecting images for the gallery.
final class AppUtility {
  /// Logger object for logging operations,
  var _logger = Logger(printer: PrettyPrinter());

  /// The timeAgo function calculates the difference between the given date and
  /// now and returns accordingly. The `isAbbreviation` parameter determines
  /// whether to return with abbreviations or the full expression.
  String timeAgo(DateTime? dateTime, {bool isAbbreviation = false}) {
    if (dateTime != null) {
      final Duration difference = DateTime.now().difference(dateTime);
      if (difference.inDays >= 7) {
        /// If there is a difference of more than 1 week, it returns in weeks
        return '${difference.inDays ~/ 7} '
            '${isAbbreviation ? TimeAgoKeys.weekAbbreviation.localizedText : TimeAgoKeys.weekAgo.localizedText}';
      } else if (difference.inDays > 0) {
        /// If there is more than 1 day difference, it will return in days
        return '${difference.inDays} '
            '${isAbbreviation ? TimeAgoKeys.daysAbbreviation.localizedText : TimeAgoKeys.daysAgo.localizedText}';
      } else if (difference.inHours > 0) {
        /// If there is a difference of more than 1 hour, it returns in hours
        return '${difference.inHours} '
            '${isAbbreviation ? TimeAgoKeys.hoursAbbreviation.localizedText : TimeAgoKeys.hoursAgo.localizedText}';
      } else if (difference.inMinutes > 0) {
        /// If there is a difference of more than 1 minute, it returns in minutes
        return '${difference.inMinutes} '
            '${isAbbreviation ? TimeAgoKeys.minutesAbbreviation.localizedText : TimeAgoKeys.minutesAgo.localizedText}';
      } else {
        /// If there is no difference, it returns "now"
        return '${TimeAgoKeys.justNow.localizedText}';
      }
    } else {
      _logger.i('Datetime null');
      return '${LocaleKeys.timeAgoMsg_justNow.locale}';
    }
  }

  /// The formatDate function returns the given date in a specific format
  /// If the date is today, it adds "Today"; otherwise it returns the full date
  String formatDate(DateTime? dateTime, BuildContext context) {
    if (dateTime != null) {
      final DateTime now = DateTime.now();
      final DateFormat timeFormat = DateFormat(
        'hh:mm a',
        context.locale.toString(),
      );
      final DateFormat fullDateFormat = DateFormat(
        'dd MMM yyyy',
        context.locale.toString(),
      );

      /// If the date is today, it adds the time
      if (DateUtils.isSameDay(now, dateTime)) {
        return 'Bugün, ${timeFormat.format(dateTime)}';
      } else {
        return fullDateFormat.format(dateTime);
      }
    } else {
      _logger.i('Datetime null');
      return 'Geçersiz tarih';
    }
  }

  /// pickImageFromGallery function asks the user to select an image and
  /// returns the selected image
  Future<XFile?> pickImageFromGallery({
    required ImageSource imageSource,
  }) async {
    XFile? pickedImage;
    final _picker = ImagePicker();
    try {
      pickedImage = await _picker.pickImage(source: imageSource);
      if (pickedImage != null) return pickedImage;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
