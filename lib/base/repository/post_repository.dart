import 'dart:developer';
import 'package:word_prime/export.dart';

class PostRepository {
  final _postCollectionReference = FirebaseCollections.posts.reference;

  Future<void> addPost({PostModel? postModel}) async {
    try {
      DocumentReference _documentReference = await _postCollectionReference.add(
        postModel?.toJson(),
      );
      String postId = _documentReference.id;
      await _documentReference.update({'post_id': postId});
      log('Post yükleme işlemi başarılı! Added data: ${postModel?.toJson()}');
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
}
