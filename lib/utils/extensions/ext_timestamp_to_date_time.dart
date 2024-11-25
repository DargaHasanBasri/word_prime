import 'package:cloud_firestore/cloud_firestore.dart';

extension ExtTimestampToDateTime on Timestamp {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }
}
