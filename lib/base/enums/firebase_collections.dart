import 'package:cloud_firestore/cloud_firestore.dart';
enum FirebaseCollections {
  users,
  posts;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
