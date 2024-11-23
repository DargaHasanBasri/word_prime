import 'dart:developer';
import 'package:word_prime/export.dart';

class PostRepository {
  final _postCollectionReference = FirebaseCollections.posts.reference;

  Future<void> addPost(PostModel? postModel) async {
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
}
