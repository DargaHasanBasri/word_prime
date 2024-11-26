import 'dart:developer';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

final class AppUtility {
  String timeAgo(DateTime? dateTime) {
    if (dateTime != null) {
      final Duration difference = DateTime.now().difference(dateTime);
      if (difference.inDays > 0) {
        return '${difference.inDays} gün önce';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} saat önce';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} dakika önce';
      } else {
        return 'az önce';
      }
    } else {
      log('Datetime null');
      return 'az önce';
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
