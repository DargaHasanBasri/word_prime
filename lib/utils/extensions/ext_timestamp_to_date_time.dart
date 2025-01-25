import 'package:cloud_firestore/cloud_firestore.dart';

/// It is an extension specific to the Timestamp genre.
/// It is used to convert Timestamp objects
/// from Firebase Firestore into DateTime objects.
extension ExtTimestampToDateTime on Timestamp {
  /// Converts the Timestamp retrieved from Firestore to a DateTime object.
  /// Timestamp holds time information in milliseconds,
  /// while DateTime represents local time.
  DateTime toDateTime() {
    /// With `millisecondsSinceEpoch` it takes the value in milliseconds and
    /// converts it to DateTime.
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }
}
