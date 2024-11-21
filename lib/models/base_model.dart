import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) {
      return null;
    }
    return fromJson(data);
  }
}
