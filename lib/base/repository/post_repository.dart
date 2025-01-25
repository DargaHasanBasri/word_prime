import 'package:word_prime/base/base_firestore.dart';
import 'package:word_prime/base/repository/quiz_repository.dart';
import 'package:word_prime/export.dart';

class PostRepository {
  /// Reference to the 'posts' collection in Firestore.
  final _postCollectionReference = FirebaseCollections.posts.reference;

  /// Reference to the 'users' collection in Firestore.
  final _userCollectionReference = FirebaseCollections.users.reference;

  /// Object representing the currently logged in user.
  User? _currentUser = FirebaseAuth.instance.currentUser;

  /// Logger object for logging operations.
  var _logger = Logger(printer: PrettyPrinter());

  /// Post data is returned from Firestore as type 'List<PostModel?>'.
  Future<List<PostModel?>> fetchPost() async {
    try {
      /// Returns data from the Firestore collection in descending order based
      /// on the 'created_date' field.
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

      /// It turns the incoming data into a list and is assigned to postData.
      final postData = response.docs.map((doc) => doc.data()).toList();

      /// Successful query result log message.
      _logger.i("Posts fetched successfully by date: ${postData[0]}...");

      /// Processed data is returned.
      return postData;
    } catch (e) {
      /// In case of error, a log record is created
      /// and an empty list is returned.
      _logger.e("An error occurred while retrieving post data: $e");
      return [];
    }
  }

  /// Returns 'List<PostModel?>' based on the word the user wants to search for.
  /// 'searchText' holds the word the user wants to search for.
  Future<List<PostModel?>> fetchWordByQuery({
    required String searchText,
  }) async {
    try {
      /// In Firestore, the word 'searchText' is queried
      /// in the 'word_keywords' field and existing ones are returned.
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

      /// It turns the incoming data into a list and is assigned to 'posts'.
      List<PostModel?> posts = response.docs.map((doc) => doc.data()).toList();

      /// Successful query result log message
      _logger.i("The post was successfully fetched based on the word "
          "the user wanted to search for: ${posts[0]}...");

      /// Processed data is returned.
      return posts;
    } catch (e) {
      /// In case of error, a log record is created
      /// and an empty list is returned.
      _logger.e("An error occurred while retrieving search post data: $e");
      return [];
    }
  }

  /// It keeps the information received from the user in postModel and
  /// adds this data to firestore.
  Future<bool> addPost({PostModel? postModel}) async {
    try {
      /// It adds the "postModel" data to the "_postCollectionReference" i.e.
      /// posts collection and _documentReference is returned.
      DocumentReference _documentReference = await _postCollectionReference.add(
        postModel?.toJson(),
      );

      /// The automatic post ID "postId" created by Firestore is assigned.
      /// The 'post_id' field is added to the post document.
      String postId = _documentReference.id;
      await _documentReference.update({'post_id': postId});

      /// The user's "added_posts" id is manually given the value 'postId'
      /// and the values 'post_id' and 'word_level' are added to this sub-collection.
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

      /// Adds "added_words" information via QuizRepository.
      await QuizRepository().addAddedWords(
        model: AddedWordModel(
          addedWordId: postId,
          wordLevel: postModel?.wordLevel,
          wordEn: postModel?.wordEnglish,
          wordTr: postModel?.wordTurkish,
          wordImageAddress: postModel?.postImageAddress,
        ),
      );

      /// Increases the user's total post count by one
      await _userCollectionReference.doc(_currentUser!.uid).update({
        'total_post': FieldValue.increment(1),
      });

      _logger.i("Post upload successful and total post success increment!\n"
          "Added data: ${postModel?.toJson()}");

      /// Returns true if the operation is successful
      return true;
    } catch (e) {
      /// In case of error, the log message is printed and returns false.
      _logger.w("Post upload failed!");
      return false;
    }
  }

  /// Returns posts from the 'added_posts' subcollection based on the
  /// specified 'userId' and 'wordLevel'.
  Future<List<PostModel?>?> fetchAddedPostsByQuery({
    required String userId,
    required String wordLevel,
  }) async {
    /// Using the BaseFirestore class, fetches data based
    /// on the value of 'field' in the 'added_posts' subcollection and
    /// assigns them to 'addedPosts'.
    final addedPosts = BaseFirestore<PostModel>().fetchPostsByQuery(
      userId: userId,
      subCollectionName: 'added_posts',
      field: 'word_level',
      filterValue: wordLevel,
      model: PostModel(),
    );

    /// Incoming data 'List<PostModel?>?' Returns list as 'addedPosts'.
    return addedPosts;
  }

  /// Returns posts from the 'added_posts' subcollection
  /// based on the specified 'userId'.
  Future<List<PostModel?>?> fetchAllAddedPosts({
    required String userId,
  }) async {
    /// Using the BaseFirestore class, it fetches all data from the
    /// 'added_posts' subcollection and assigns them to 'allAddedPosts'.
    final allAddedPosts =
        BaseFirestore<PostModel>().fetchPostsFromSubCollection(
      userId: userId,
      subCollectionName: 'added_posts',
      model: PostModel(),
    );

    /// Incoming data 'List<PostModel?>?' Returns list as 'allAddedPosts'.
    return allAddedPosts;
  }

  /// Performs deletion of the user's 'post' and
  /// this 'post' is deleted from the firestore.
  Future<void> deletePost({required String postId}) async {
    try {
      /// Retrieves the document with the specified postId from firestore.
      final _documentPostReference = _postCollectionReference.doc(postId);

      /// Deletes the document from the global 'posts' collection.
      await _documentPostReference.delete();

      /// Retrieves the document with the specified postId from the
      /// current user's 'added_posts' subcollection from Firestore.
      final _documentAddedPostsReference = _userCollectionReference
          .doc(_currentUser?.uid)
          .collection('added_posts')
          .doc(postId);

      /// Deletes the document from the user's subcollection 'added_posts'.
      await _documentAddedPostsReference.delete();

      /// Current user's 'total_post' value is decremented.
      await _userCollectionReference.doc(_currentUser!.uid).update({
        'total_post': FieldValue.increment(-1),
      });

      /// Successful query result log message.
      _logger.i("Post deletion was successful! Deleted Post ID: $postId");
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w("Post deletion failed! Error: $e");
      rethrow;
    }
  }

  /// Performs the user's 'post' save and this 'post' is
  /// added to 'saved_posts' in firestore.
  /// The ID of the post to be saved is kept with 'postId'.
  /// The level of the post to be saved is kept with 'wordLevel'.
  /// The ID of the user who saved the post is kept with 'userId'.
  Future<void> savePost({
    required String? userId,
    required String? postId,
    required String? wordLevel,
  }) async {
    try {
      /// Creates a reference to the user's 'saved_posts' subcollection.
      final savedPostsReference =
          _userCollectionReference.doc(userId).collection('saved_posts');

      /// The post to be saved is fetched from firestore and
      /// kept in the 'currentDoc' variable
      final currentDoc = await savedPostsReference.doc(postId).get();

      /// 'currentDoc.exists' returns the result of whether the post has been saved
      /// by the user or not. It returns true if the post exists, that is,
      /// the post has already been saved, and false if the post is not saved.
      if (currentDoc.exists) {
        /// If the post is already registered, it will be removed from the records.
        await savedPostsReference.doc(postId).delete();

        /// When the operation is successful, log logging is done.
        _logger.i(
          "Post successfully removed from saves! Saved Post ID: $postId",
        );

        /// Decreases the post's total record count by 1.
        await _postCollectionReference.doc(postId).update({
          'total_saves': FieldValue.increment(-1),
        });
      } else {
        /// If the post is not registered, it will be registered.
        await savedPostsReference.doc(postId).set({
          'post_id': postId,
          'word_level': wordLevel,
        });

        /// When the operation is successful, log logging is done.
        _logger.i("Post saved successfully! Saved Post ID: $postId");
        await _postCollectionReference.doc(postId).update({
          'total_saves': FieldValue.increment(1),
        });
      }
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w("Post save failed! Error: $e");
      rethrow;
    }
  }

  /// Returns posts from the 'added_posts' subcollection based on the
  /// specified 'userId' and 'wordLevel'.
  Future<List<PostModel?>?> fetchSavedPostsByQuery({
    required String userId,
    required String wordLevel,
  }) async {
    /// Using the BaseFirestore class, fetches data based
    /// on the value of 'field' in the 'saved_posts' subcollection and
    /// assigns them to 'savedPosts'.
    final savedPosts = BaseFirestore<PostModel>().fetchPostsByQuery(
      userId: userId,
      subCollectionName: 'saved_posts',
      field: 'word_level',
      filterValue: wordLevel,
      model: PostModel(),
    );

    /// Incoming data 'List<PostModel?>?' Returns list as 'savedPosts'.
    return savedPosts;
  }

  /// Returns posts from the 'saved_posts' subcollection
  /// based on the specified 'userId'.
  Future<List<PostModel?>?> fetchAllSavedPosts({
    required String userId,
  }) async {
    /// Using the BaseFirestore class, it fetches all data from the
    /// 'saved_posts' subcollection and assigns them to 'allSavedPosts'.
    final allSavedPosts =
        BaseFirestore<PostModel>().fetchPostsFromSubCollection(
      userId: userId,
      subCollectionName: 'saved_posts',
      model: PostModel(),
    );

    /// Incoming data 'List<PostModel?>?' Returns list as 'allSavedPosts'.
    return allSavedPosts;
  }

  /// Performs user to add 'comment'.
  /// The ID of the post to which the comment will be added is kept by 'postId'.
  /// The content of the comment is kept by 'commentModel'.
  Future<void> addComment({
    required String? postId,
    required CommentModel commentModel,
  }) async {
    try {
      /// A reference is created to the 'comments' subcollection of the post.
      final commentsReference =
          _postCollectionReference.doc(postId).collection('comments');

      /// We add the comment data to the subcollection and it gets
      /// the reference of the added document.
      DocumentReference _documentReference = await commentsReference.add(
        commentModel.toJson(),
      );

      /// Gets the ID of the newly added document.
      String commentId = _documentReference.id;

      /// Adds its ID as a field to the comment document.
      await _documentReference.update({'comment_id': commentId});

      /// The post's total number of comments increases by one.
      await _postCollectionReference.doc(postId).update({
        'total_comments': FieldValue.increment(1),
      });

      /// A log message is generated regarding the successful operation.
      _logger.i(
        'Comment added successfully! Post ID: $postId,\n'
        'Comment: ${commentModel.toJson()}',
      );
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w('Adding comment failed! Error: $e');
      rethrow;
    }
  }

  /// Returns the comments of the post belonging
  /// to 'PostId' as 'List<CommentModel?>'.
  Future<List<CommentModel?>> fetchPostComments({
    required String? postId,
  }) async {
    try {
      /// Retrieves comments from the post's 'comments' subcollection.
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

      /// Converts incoming data into a list.
      final commentData = response.docs.map((doc) => doc.data()).toList();

      /// A log message is generated regarding the successful operation.
      _logger.i('post comments fetched successfully: $commentData');

      /// Returns incoming data.
      return commentData;
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w('Failed to fetch comments! Error: $e');
      return [];
    }
  }

  /// Performs post liking operations of the user.
  /// 'userId' holds the ID of the user who liked the post.
  /// 'postId' holds the ID of the post to be liked.
  /// 'wordLevel' keeps the word level of the post.
  Future<void> likePost({
    required String? userId,
    required String? postId,
    required String? wordLevel,
  }) async {
    try {
      /// Creates a reference to the user's 'liked_posts' subcollection.
      final likedPostsReference =
          _userCollectionReference.doc(userId).collection('liked_posts');

      /// Returns the doc with postId and is assigned the value 'currentDoc'.
      final currentDoc = await likedPostsReference.doc(postId).get();

      /// 'currentDoc.exists' returns the result of whether the post was liked
      /// by the user. It returns true if the post exists, that is,
      /// if the post has already been liked, and false if the post is not liked.
      if (currentDoc.exists) {
        /// If the post is already liked, it removes the like record.
        await likedPostsReference.doc(postId).delete();

        /// The total number of likes of the post is reduced by one.
        await _postCollectionReference.doc(postId).update({
          'total_likes': FieldValue.increment(-1),
        });
      } else {
        /// If the post has not been liked before, it adds a like record.
        await likedPostsReference.doc(postId).set({
          'post_id': postId,
          'word_level': wordLevel,
        });

        /// Increases the total number of likes of the post by one.
        await _postCollectionReference.doc(postId).update({
          'total_likes': FieldValue.increment(1),
        });

        /// It creates a log message regarding the successful liking process.
        _logger.i('The post was successfully liked! Post ID: $postId');
      }
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w('Post liking failed! Error: $e');
      rethrow;
    }
  }

  /// 'userId' holds the ID of the user to retrieve liked posts.
  Future<List<PostModel?>> fetchAllLikedPosts({required String userId}) async {
    /// Returns liked posts from the subcollection using the BaseFirestore class.
    final allLikedPosts =
        BaseFirestore<PostModel>().fetchPostsFromSubCollection(
      userId: userId,
      subCollectionName: 'liked_posts',
      model: PostModel(),
    );

    /// A list of liked posts is returned.
    return allLikedPosts;
  }

  /// Returns the IDs of liked or saved posts.
  /// 'subCollectionName' holds the name of the subcollection containing
  /// liked or saved posts. 'userId' holds the user's ID to get post IDs.
  Future<List<String?>> fetchLikedOrSavedPostIds({
    required String subCollectionName,
    required String? userId,
  }) async {
    try {
      /// Creates a reference to the corresponding subcollection from the user collection.
      final reference =
          _userCollectionReference.doc(userId).collection(subCollectionName);

      /// Returns all documents in the subcollection.
      final querySnapshotIds = await reference.get();

      /// Converts 'post_id' fields in documents to a list and keeps 'postIds'.
      final postIds = querySnapshotIds.docs
          .map((doc) => doc.data()['post_id'] as String)
          .toList();

      /// If postIds is an empty list, the empty list is returned.
      if (postIds.isEmpty) return [];

      /// A log message is generated regarding the successful operation.
      _logger.i('Id list fetched successfully from $subCollectionName!');

      /// A list of post IDs is returned.
      return postIds;
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w('Id list fetch failed! Error: $e');
      rethrow;
    }
  }

  /// 'model' holds the data of the shipment model that needs to be updated.
  /// 'docId' holds the ID (id) of the document in Firestore of the post that needs to be updated.
  Future<bool> postUpdate({
    required PostModel? model,
    required String? docId,
  }) async {
    /// Using BaseFirestore class the post data is updated and returns bool value.
    return await BaseFirestore<PostModel>().update(
      _postCollectionReference,
      model,
      docId,
    );
  }
}
