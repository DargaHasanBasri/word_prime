import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:word_prime/export.dart';

final class AppUtility {
  String timeAgo(DateTime? dateTime) {
    if (dateTime != null) {
      final Duration difference = DateTime.now().difference(dateTime);
      if (difference.inDays >= 7) {
        return '${difference.inDays ~/ 7} ${LocaleKeys.timeAgoMsg_weekAgo.locale}';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} ${LocaleKeys.timeAgoMsg_daysAgo.locale}';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} ${LocaleKeys.timeAgoMsg_hoursAgo.locale}';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} ${LocaleKeys.timeAgoMsg_minutesAgo.locale}';
      } else {
        return '${LocaleKeys.timeAgoMsg_justNow.locale}';
      }
    } else {
      log('Datetime null');
      return '${LocaleKeys.timeAgoMsg_justNow.locale}';
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
