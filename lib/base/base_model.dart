import 'package:cloud_firestore/cloud_firestore.dart';

/// BaseModel is a generalized model class (abstract).
/// It provides a basic structure for JSON and Firebase operations.
abstract class BaseModel<T> {
  /// An abstract method to create a model object from JSON data.
  T fromJson(Map<String, dynamic> json);

  /// An abstract method to use to convert the model object to JSON format.
  Map<String, dynamic> toJson();

  /// Creates a model object from a DocumentSnapshot from Firebase.
  /// It is used to convert the JSON data returned by Firebase into a model.
  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    /// Retrieves data returned from Firebase.
    final data = snapshot.data();

    /// If the data is null, it returns null.
    if (data == null) {
      return null;
    }

    /// It converts the data into a model object in JSON format and returns it.
    return fromJson(data);
  }
}
