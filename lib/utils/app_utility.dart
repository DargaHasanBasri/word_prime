import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:word_prime/export.dart';

final class AppUtility {
  String timeAgo(DateTime? dateTime, {bool isAbbreviation = false}) {
    if (dateTime != null) {
      final Duration difference = DateTime.now().difference(dateTime);
      if (difference.inDays >= 7) {
        return '${difference.inDays ~/ 7} '
            '${isAbbreviation ? TimeAgoKeys.weekAbbreviation.localizedText : TimeAgoKeys.weekAgo.localizedText}';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} '
            '${isAbbreviation ? TimeAgoKeys.daysAbbreviation.localizedText : TimeAgoKeys.daysAgo.localizedText}';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} '
            '${isAbbreviation ? TimeAgoKeys.hoursAbbreviation.localizedText : TimeAgoKeys.hoursAgo.localizedText}';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} '
            '${isAbbreviation ? TimeAgoKeys.minutesAbbreviation.localizedText : TimeAgoKeys.minutesAgo.localizedText}';
      } else {
        return '${TimeAgoKeys.justNow.localizedText}';
      }
    } else {
      log('Datetime null');
      return '${LocaleKeys.timeAgoMsg_justNow.locale}';
    }
  }

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

      if (DateUtils.isSameDay(now, dateTime)) {
        return 'Bugün, ${timeFormat.format(dateTime)}';
      } else {
        return fullDateFormat.format(dateTime);
      }
    } else {
      log('Datetime null');
      return 'Geçersiz tarih';
    }
  }

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
