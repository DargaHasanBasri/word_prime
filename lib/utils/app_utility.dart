import 'dart:developer';

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
}
