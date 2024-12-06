import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:word_prime/base/base_model.dart';
import 'package:word_prime/base/enums/firebase_collections.dart';

class BaseFirestore<T extends BaseModel<T>> {
  /// Reference to the 'users' collection in Firestore
  final _userCollectionReference = FirebaseCollections.users.reference;

  /// Reference to the 'posts' collection in Firestore
  final _postCollectionReference = FirebaseCollections.posts.reference;

  /// Fetches items from Firestore by filtering a sub-collection under
  /// a specific user   and retrieving the corresponding documents
  /// from the target collection (e.g., posts)
  /// [userId]: The ID of the user whose sub-collection is being queried
  /// [subCollectionName]: The name of the sub-collection under the user's document
  /// [field]: The field in the sub-collection to filter on (e.g., 'word_level')
  /// [filterValue]: The value to filter by in the specified field
  /// [model]: An instance of the model class that extends BaseModel<T>
  /// used for deserialization. Returns a list of items of type T that match
  /// the criteria or an empty list if no items are found
  Future<List<T?>> fetchItemsByQuery({
    required String userId,
    required String subCollectionName,
    required String field,
    required dynamic filterValue,
    required T model,
  }) async {
    try {
      /// Reference to the specified sub-collection under the user's document
      final reference =
          _userCollectionReference.doc(userId).collection(subCollectionName);

      /// Query the sub-collection to retrieve all documents where
      /// [field] matches [filterValue]
      final querySnapshotIds =
          await reference.where(field, isEqualTo: filterValue).get();

      /// Extract the post IDs from the queried documents
      final postIds = querySnapshotIds.docs
          .map((doc) => doc.data()['post_id'] as String)
          .toList();

      /// If no post IDs are found, return an empty list
      if (postIds.isEmpty) return [];

      /// Query the target collection (e.g., posts) using the list of post IDs.
      /// Use Firestore `whereIn` to fetch all documents with IDs in the list
      final querySnapshotPosts = await _postCollectionReference
          .where(FieldPath.documentId, whereIn: postIds)
          .orderBy('created_date', descending: true)
          .withConverter<T>(
            fromFirestore: (snapshot, _) => model.fromFirebase(snapshot)!,
            toFirestore: (_, __) => {},
          )
          .get();

      /// Map the queried documents to their corresponding model instances
      /// and return as a list.
      final posts = querySnapshotPosts.docs.map((doc) => doc.data()).toList();
      return posts;
    } catch (e) {
      /// Log any errors that occur during the process for debugging
      log('Fetch items by IDs error: $e');
      rethrow;
    }
  }

  Future<List<T?>> fetchItemsFromSubCollection({
    required String userId,
    required String subCollectionName,
    required T model,
  }) async {
    try {
      /// Reference to the specified sub-collection under the user's document
      final reference =
          _userCollectionReference.doc(userId).collection(subCollectionName);

      /// Query the sub-collection to retrieve all documents without filters
      final querySnapshotIds = await reference.get();

      /// Extract the post IDs from the queried documents
      final postIds = querySnapshotIds.docs
          .map((doc) => doc.data()['post_id'] as String)
          .toList();

      /// If no post IDs are found, return an empty list
      if (postIds.isEmpty) return [];

      /// Query the target collection (e.g., posts) using the list of post IDs.
      /// Use Firestore `whereIn` to fetch all documents with IDs in the list
      final querySnapshotPosts = await _postCollectionReference
          .where(FieldPath.documentId, whereIn: postIds)
          .orderBy('created_date', descending: true)
          .withConverter<T>(
            fromFirestore: (snapshot, _) => model.fromFirebase(snapshot)!,
            toFirestore: (_, __) => {},
          )
          .get();

      /// Map the queried documents to their corresponding model instances
      /// and return as a list.
      final posts = querySnapshotPosts.docs.map((doc) => doc.data()).toList();
      return posts;
    } catch (e) {
      /// Log any errors that occur during the process for debugging
      log('Fetch all items from sub-collection error: $e');
      rethrow;
    }
  }
}
