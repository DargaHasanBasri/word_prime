import 'dart:developer';
import 'package:word_prime/export.dart';

class PostRepository {
  final _postCollectionReference = FirebaseCollections.posts.reference;
  final _userCollectionReference = FirebaseCollections.users.reference;
  User? _currentUser = FirebaseAuth.instance.currentUser;

  Future<List<PostModel?>?> fetchPost() async {
    try {
      final response = await _postCollectionReference
          .orderBy('created_date', descending: true)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return PostModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      final postData = response.docs.map((doc) => doc.data()).toList();

      return postData;
    } catch (e) {
      log('An error occurred while retrieving user data: $e');
      return null;
    }
  }

  Future<void> addPost({PostModel? postModel}) async {
    try {
      DocumentReference _documentReference = await _postCollectionReference.add(
        postModel?.toJson(),
      );
      String postId = _documentReference.id;
      await _documentReference.update({'post_id': postId});

      log('Post yükleme işlemi başarılı! Added data: ${postModel?.toJson()}');

      try {
        await _userCollectionReference.doc(_currentUser!.uid).update({
          'total_post': FieldValue.increment(1),
        });
        log("total post success increment");
      } catch (e) {
        log("total post error increment");
        rethrow;
      }
    } catch (e) {
      log('Post yükleme başarısız!');
      rethrow;
    }
  }

  Future<List<PostModel?>?> fetchAddedPosts({
    required String userId,
    required String wordLevel,
  }) async {
    try {
      final querySnapshot = await _postCollectionReference
          .where('user_id', isEqualTo: userId)
          .where('word_level', isEqualTo: wordLevel)
          .orderBy('created_date', descending: true)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return PostModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      final posts = querySnapshot.docs.map((doc) => doc.data()).toList();
      return posts;
    } catch (e) {
      log('An error occurred data: $e');
      return null;
    }
  }

  Future<void> deletePost({required String postId}) async {
    try {
      /// Retrieves the document with the specified postId from firestore
      DocumentReference _documentReference =
          _postCollectionReference.doc(postId);

      /// Deletes the document
      await _documentReference.delete();

      /// Suppresses operation success log
      log('Post silme işlemi başarılı! Silinen Post ID: $postId');

      try {
        await _userCollectionReference.doc(_currentUser!.uid).update({
          'total_post': FieldValue.increment(-1),
        });
        log("total post success decrease");
      } catch (e) {
        log("total post error decrease");
        rethrow;
      }
    } catch (e) {
      /// suppresses transaction failure log
      log('Post silme başarısız! Hata: $e');
      rethrow;
    }
  }

  Future<void> savePost({
    required String? userId,
    required String? postId,
    required String? wordLevel,
  }) async {
    try {
      final savedPostsReference =
          _userCollectionReference.doc(userId).collection('saved_posts');

      await savedPostsReference.doc(postId).set({
        'post_id': postId,
        'word_level': wordLevel,
      });

      log('Post başarıyla kaydedildi! Post ID: $postId');
    } catch (e) {
      log('Post kaydetme başarısız! Hata: $e');
      rethrow;
    }
  }

  Future<List<String>> fetchSavedPostIds({
    required String userId,
    required String wordLevel,
  }) async {
    try {
      final savedPostsRef =
          _userCollectionReference.doc(userId).collection('saved_posts');

      final querySnapshot =
          await savedPostsRef.where('word_level', isEqualTo: wordLevel).get();

      final postIds = querySnapshot.docs
          .map((doc) => doc.data()['post_id'] as String)
          .toList();

      return postIds;
    } catch (e) {
      log('Saved Post Ids fetch error: $e');
      rethrow;
    }
  }

  Future<List<PostModel?>?> fetchPostsByIds(List<String> postIds) async {
    try {
      if (postIds.isEmpty) return [];

      final querySnapshot = await FirebaseCollections.posts.reference
          .where(FieldPath.documentId, whereIn: postIds)
          .orderBy('created_date', descending: true)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return PostModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      final posts = querySnapshot.docs.map((doc) => doc.data()).toList();
      return posts;
    } catch (e) {
      log('Fetch posts by ids error: $e');
      rethrow;
    }
  }

  Future<List<PostModel?>?> fetchSavedPosts({
    required String userId,
    required String wordLevel,
  }) async {
    try {
      final postIds = await fetchSavedPostIds(
        userId: userId,
        wordLevel: wordLevel,
      );

      final posts = await fetchPostsByIds(postIds);

      return posts;
    } catch (e) {
      log('Fetch saved posts error: $e');
      rethrow;
    }
  }
}
