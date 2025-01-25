import 'package:cloud_firestore/cloud_firestore.dart';

/// It is an enum class that represents Firestore collections.
/// It is used to easily manage the names and
/// references of Firestore collections used in the application.
enum FirebaseCollections {
  users,
  posts,
  quiz;

  /// Returns a CollectionReference from Firestore for each collection.
  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
