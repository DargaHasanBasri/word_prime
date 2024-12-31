import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:word_prime/base/base_model.dart';
import 'package:word_prime/base/enums/firebase_collections.dart';

class BaseFirestore<T extends BaseModel<T>> {
  /// Creates Firestore database object.
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  /// Reference to the 'users' collection in Firestore
  final _userCollectionReference = FirebaseCollections.users.reference;

  /// Reference to the 'posts' collection in Firestore
  final _postCollectionReference = FirebaseCollections.posts.reference;

  /// Logger object for logging operations,
  var _logger = Logger(printer: PrettyPrinter());

  /// Based on the specified main collection, sub-collection and user ID (userId)
  /// Returns a Firestore `CollectionReference`.
  CollectionReference _getCollectionRef({
    required String mainCollection,
    required String? subCollection,
    required String? userId,
  }) {
    if (subCollection != null && userId != null) {
      return _firestoreInstance
          .collection(mainCollection)
          .doc(userId)
          .collection(subCollection);
    }
    return _firestoreInstance.collection(mainCollection);
  }

  /// [T]: Generic type specifies the type of data to be retrieved. This type
  /// must derive from the `BaseModel` class. If the data is retrieved
  /// successfully, a `List<T>` is returned, otherwise an empty list is returned.
  Future<List<T>> fetchAllItems<T extends BaseModel<T>>({
    required String mainCollection,
    required String? subCollection,
    required T model,
    required String? userId,
  }) async {
    try {
      /// Create collection reference dynamically.
      final collectionReference = _getCollectionRef(
        mainCollection: mainCollection,
        subCollection: subCollection,
        userId: userId,
      );

      /// Firestore converts and retrieves data with `withConverter`.
      final querySnapshot = await collectionReference.withConverter(
        fromFirestore: (snapshot, _) {
          return model.fromFirebase(snapshot) as T;
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      /// Convert incoming data into model via `docs`.
      final items = querySnapshot.docs.map((doc) => doc.data()).toList();

      /// Successful query result log message
      _logger.i(
        "SUCCESS fetch from $mainCollection${subCollection != null ? '/$subCollection' : ''}\n"
        "items count: ${items.length}, ${items[0].toString()}...",
      );

      return items;
    } catch (e) {
      /// Logging in case of error and returning an empty list
      _logger.w(
        "Error fetching from "
        "$mainCollection${subCollection != null ? '/$subCollection' : ''}: $e",
      );
      return [];
    }
  }

  /// Filters and by model It pulls only data from Firestore that fits the filters.
  /// [T]: Generic type specifies the type of data to be retrieved. This type
  /// must derive from the `BaseModel` class.
  /// Data suitable for filters is returned as a `List<T>`.
  /// If no results are found, an empty list is returned.
  Future<List<T>> fetchFilteredAllItems<T extends BaseModel<T>>({
    required String mainCollection,
    required String? subCollection,
    required T model,
    required String? userId,
    required Map<String, dynamic> filters,
  }) async {
    try {
      /// Create collection reference dynamically.
      final collectionReference = _getCollectionRef(
        mainCollection: mainCollection,
        subCollection: subCollection,
        userId: userId,
      );

      /// Firestore converts data with "withConverter".
      Query<T> query = await collectionReference.withConverter(
        fromFirestore: (snapshot, _) {
          return model.fromFirebase(snapshot) as T;
        },
        toFirestore: (value, _) {
          return {};
        },
      );

      /// Adds filters to the query
      filters.forEach((field, value) {
        query = query.where(field, isEqualTo: value);
      });

      /// Run the query and get the results.
      final querySnapshot = await query.get();

      /// Convert incoming data into model via `docs`.
      final items = querySnapshot.docs.map((doc) => doc.data()).toList();

      /// Successful query result log message.
      _logger.i(
          "SUCCESS fetch from $mainCollection${subCollection != null ? '/$subCollection' : ''}\n"
          "items count: ${items.length}, ${items.isNotEmpty ? items[0].toString() : 'No items found'}");

      return items;
    } catch (e) {
      /// Logging in case of error and returning an empty list.
      _logger.w(
          "Error fetching from $mainCollection${subCollection != null ? '/$subCollection' : ''}: $e");
      return [];
    }
  }

  Future<bool> update<T extends BaseModel<T>>(
    CollectionReference collectionRef,
    T? model,
    String? docId,
  ) async {
    try {
      if (model == null || docId == null) return false;
      await collectionRef.doc(docId).update(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

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
  Future<List<T?>> fetchPostsByQuery({
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

  Future<List<T?>> fetchPostsFromSubCollection({
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
