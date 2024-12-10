import 'dart:developer';
import 'package:word_prime/base/base_firestore.dart';
import 'package:word_prime/export.dart';

class PostRepository {
  final _postCollectionReference = FirebaseCollections.posts.reference;
  final _userCollectionReference = FirebaseCollections.users.reference;
  User? _currentUser = FirebaseAuth.instance.currentUser;

  final _postsHandler = BaseFirestore<PostModel>();

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

  Future<List<PostModel?>?> fetchWordByQuery({
    required String searchText,
  }) async {
    try {
      final response = await _postCollectionReference
          .where('word_keywords', arrayContains: searchText)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return PostModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      List<PostModel?> posts = response.docs.map((doc) => doc.data()).toList();

      return posts;
    } catch (e) {
      log('An error occurred while retrieving post data: $e');
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

      await _userCollectionReference
          .doc(postModel?.userId)
          .collection('added_posts')
          .doc(postId)
          .set(
        {
          'post_id': postId,
          'word_level': postModel?.wordLevel,
        },
      );

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

  Future<List<PostModel?>?> fetchAddedPostsByQuery({
    required String userId,
    required String wordLevel,
  }) async {
    final addedPosts = _postsHandler.fetchPostsByQuery(
      userId: userId,
      subCollectionName: 'added_posts',
      field: 'word_level',
      filterValue: wordLevel,
      model: PostModel(),
    );
    return addedPosts;
  }

  Future<List<PostModel?>?> fetchAllAddedPosts({
    required String userId,
  }) async {
    final allAddedPosts = _postsHandler.fetchPostsFromSubCollection(
      userId: userId,
      subCollectionName: 'added_posts',
      model: PostModel(),
    );
    return allAddedPosts;
  }

  Future<void> deletePost({required String postId}) async {
    try {
      /// Retrieves the document with the specified postId from firestore
      DocumentReference _documentReference =
          _postCollectionReference.doc(postId);

      /// Deletes the document
      await _documentReference.delete();

      DocumentReference _userAddedPostsReference = _userCollectionReference
          .doc(_currentUser?.uid)
          .collection('added_posts')
          .doc(postId);

      await _userAddedPostsReference.delete();

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

      final currentDoc = await savedPostsReference.doc(postId).get();

      if (currentDoc.exists) {
        await savedPostsReference.doc(postId).delete();
        await _postCollectionReference.doc(postId).update({
          'total_saves': FieldValue.increment(-1),
        });
        log("total saves success decrease");
      } else {
        await savedPostsReference.doc(postId).set({
          'post_id': postId,
          'word_level': wordLevel,
        });
        log('Post başarıyla kaydedildi! Post ID: $postId');

        await _postCollectionReference.doc(postId).update({
          'total_saves': FieldValue.increment(1),
        });
        log("total saves success increase");
      }
    } catch (e) {
      log('Post kaydetme başarısız! Hata: $e');
      rethrow;
    }
  }

  Future<List<PostModel?>?> fetchSavedPosts({
    required String userId,
    required String wordLevel,
  }) async {
    final savedPosts = _postsHandler.fetchPostsByQuery(
      userId: userId,
      subCollectionName: 'saved_posts',
      field: 'word_level',
      filterValue: wordLevel,
      model: PostModel(),
    );
    return savedPosts;
  }

  Future<List<PostModel?>?> fetchAllSavedPosts({
    required String userId,
  }) async {
    final allSavedPosts = _postsHandler.fetchPostsFromSubCollection(
      userId: userId,
      subCollectionName: 'saved_posts',
      model: PostModel(),
    );
    return allSavedPosts;
  }

  Future<void> addComment({
    required String? postId,
    required CommentModel? commentModel,
  }) async {
    try {
      final commentsReference =
          _postCollectionReference.doc(postId).collection('comments');

      if (commentModel != null) {
        DocumentReference _documentReference = await commentsReference.add(
          commentModel.toJson(),
        );
        String commentId = _documentReference.id;
        await _documentReference.update({'comment_id': commentId});
      } else {
        log('Yorum ekleme başarısız!');
        return;
      }

      try {
        await _postCollectionReference.doc(postId).update({
          'total_comments': FieldValue.increment(1),
        });
        log("total comments success increase");
      } catch (e) {
        log("total comments error decrease");
        rethrow;
      }

      log('Yorum başarıyla eklendi! Post ID: $postId, Comment: ${commentModel.toJson()}');
    } catch (e) {
      log('Yorum ekleme başarısız! Hata: $e');
      rethrow;
    }
  }

  Future<List<CommentModel?>?> fetchPostComments({
    String? postId,
  }) async {
    try {
      final response = await _postCollectionReference
          .doc(postId)
          .collection('comments')
          .orderBy('created_date', descending: true)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return CommentModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      final commentData = response.docs.map((doc) => doc.data()).toList();

      log('fetch post comments success comments: $commentData');
      return commentData;
    } catch (e) {
      log('An error occurred: $e');
      return null;
    }
  }

  Future<void> likePost({
    required String? userId,
    required String? postId,
    required String? wordLevel,
  }) async {
    try {
      final likedPostsReference =
          _userCollectionReference.doc(userId).collection('liked_posts');

      final currentDoc = await likedPostsReference.doc(postId).get();

      if (currentDoc.exists) {
        await likedPostsReference.doc(postId).delete();
        await _postCollectionReference.doc(postId).update({
          'total_likes': FieldValue.increment(-1),
        });
        log("total likes success decrease");
      } else {
        await likedPostsReference.doc(postId).set({
          'post_id': postId,
          'word_level': wordLevel,
        });
        log('Post başarıyla beğenildi! Post ID: $postId');
        await _postCollectionReference.doc(postId).update({
          'total_likes': FieldValue.increment(1),
        });
        log("total likes success increase");
      }
    } catch (e) {
      log('Post beğenme başarısız! Hata: $e');
      rethrow;
    }
  }

  Future<List<PostModel?>?> fetchAllLikedPosts({
    required String userId,
  }) async {
    final allLikedPosts = _postsHandler.fetchPostsFromSubCollection(
      userId: userId,
      subCollectionName: 'liked_posts',
      model: PostModel(),
    );
    return allLikedPosts;
  }

  Future<List<String?>?> fetchLikedOrSavedPostIds({
    required String subCollectionName,
    required String? userId,
  }) async {
    try {
      final reference =
          _userCollectionReference.doc(userId).collection(subCollectionName);

      final querySnapshotIds = await reference.get();

      final postIds = querySnapshotIds.docs
          .map((doc) => doc.data()['post_id'] as String)
          .toList();

      if (postIds.isEmpty) return [];

      return postIds;
    } catch (e) {
      log('Id list getirme başarısız! Hata: $e');
      rethrow;
    }
  }
}
