import 'package:cloud_firestore/cloud_firestore.dart';
enum FirebaseCollections {
  users,
  posts,
  quiz;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
