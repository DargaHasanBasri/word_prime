import 'package:word_prime/export.dart';

class UserRepository {
  /// Reference to the 'users' collection in Firestore.
  final _userCollectionReference = FirebaseCollections.users.reference;

  /// Object representing the currently logged in user.
  User? _currentUser = FirebaseAuth.instance.currentUser;

  /// Logger object for logging operations.
  var _logger = Logger(printer: PrettyPrinter());

  /// Pulls the user with a specific userId from Firestore.
  Future<UserModel?> fetchUser(String? userId) async {
    try {
      /// Gets the document matching userId in Firestore
      /// and converts it to data model.
      /// Converts data from Firestore to UserModel.
      final response = await _userCollectionReference.doc(userId).withConverter(
        fromFirestore: (snapshot, _) {
          return UserModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      /// A log message is generated regarding the successful operation.
      _logger.i('User data fetched successfully');

      /// 'response.data()' return represents the data in Firestore.
      final userData = response.data();

      return userData;
    } catch (e) {
      /// In case of error, logging is done and null is executed.
      _logger.w('An error occurred while retrieving user data: $e');
      return null;
    }
  }

  /// Returns 'List<UserModel?>' based on the username the user wants to search for.
  /// 'searchText' holds the username that the user wants to search for.
  Future<List<UserModel?>> fetchUserByQuery({
    required String searchText,
  }) async {
    try {
      /// Queries users whose user collection contains the text specified
      /// in the 'user_name_keywords' field.
      final response = await _userCollectionReference
          .where('user_name_keywords', arrayContains: searchText)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return UserModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      /// The data from the query result is converted to UserModel type.
      List<UserModel?> users = response.docs.map((doc) => doc.data()).toList();

      /// Successful query result log message
      _logger.i("The user was successfully fetched by the username "
          "the user wanted to search for: ${users[0]}...");

      /// Processed data is returned.
      return users;
    } catch (e) {
      /// In case of error, a log record is created
      /// and an empty list is returned.
      _logger.w('An error occurred while retrieving user data: $e');
      return [];
    }
  }

  Future<void> followUser({required String? targetUserId}) async {
    try {
      /// It is checked whether the user and target user IDs are valid.
      final bool isTrue = _currentUser != null && targetUserId != null;

      /// If there is a valid user and target user ID, the process is started.
      if (isTrue) {
        /// The ID of the current user is obtained.
        final String currentUserId = _currentUser!.uid;

        /// Future.wait is used to perform multiple operations in parallel.
        await Future.wait([
          /// The current user's ID is added to the target user's followers collection.
          _userCollectionReference
              .doc(targetUserId)
              .collection('followers')
              .doc(currentUserId)
              .set({
            'follower_id': currentUserId,
          }),

          /// The target user's ID is added to the current user's followed collection.
          _userCollectionReference
              .doc(currentUserId)
              .collection('followed')
              .doc(targetUserId)
              .set({
            'followed_id': targetUserId,
          }),

          /// The target user's 'total_follower' field is incremented by 1.
          _userCollectionReference
              .doc(targetUserId)
              .update({'total_follower': FieldValue.increment(1)}),

          /// The current user's 'total_follow' field is incremented by 1.
          _userCollectionReference
              .doc(currentUserId)
              .update({'total_follow': FieldValue.increment(1)}),
        ]);
      }

      /// Successful query result log message.
      _logger.i('Adding followers successful!');
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w('Adding followers failed: $e');
      rethrow;
    }
  }

  Future<void> unfollowUser({required String? targetUserId}) async {
    try {
      /// It is checked whether the user and target user IDs are valid.
      final bool isTrue = _currentUser != null && targetUserId != null;

      /// If there is a valid user and target user ID, the process is started.
      if (isTrue) {
        /// The ID of the current user is obtained.
        final String currentUserId = _currentUser!.uid;

        /// Future.wait is used to perform multiple operations in parallel.
        await Future.wait([
          /// The current user's ID is deleted from the target user's followers collection.
          _userCollectionReference
              .doc(targetUserId)
              .collection('followers')
              .doc(currentUserId)
              .delete(),

          /// The target user's ID is deleted from the current user's followed collection.
          _userCollectionReference
              .doc(currentUserId)
              .collection('followed')
              .doc(targetUserId)
              .delete(),

          /// The target user's 'total_follower' field is reduced by 1.
          _userCollectionReference
              .doc(targetUserId)
              .update({'total_follower': FieldValue.increment(-1)}),

          /// The current user's 'total_follow' field is decremented by 1.
          _userCollectionReference
              .doc(currentUserId)
              .update({'total_follow': FieldValue.increment(-1)}),
        ]);
      }

      /// Successful query result log message.
      _logger.i('Unfollowing process was successful!');
    } catch (e) {
      /// Errors that occur during the debugging process are logged.
      _logger.w('Unfollowing failed!: $e');
      rethrow;
    }
  }

  Future<bool> isUserFollowed(String? userId) async {
    /// Checks if userId is null or empty.
    if (userId == null || userId.isEmpty) {
      /// Warning logging is done in case of error.
      _logger.w('userId is null. Cannot check followed status!');

      /// In case of invalid userId, false is returned.
      return false;
    }
    try {
      /// Retrieves the current user's document reference.
      final userDoc = _userCollectionReference.doc(_currentUser?.uid);

      /// Queries whether the userId given by 'followed_id' exists in the 'followed' collection.
      /// It searches for the 'followed ID' with the given user Id and gets only the first result found.
      final querySnapshot = await userDoc
          .collection('followed')
          .where('followed_id', isEqualTo: userId)
          .limit(1)
          .get();

      /// If successful, log recording is made.
      _logger.i('Tracking status check is successful!');

      /// If there is any document in querySnapshot, the user has been tracked.
      /// It returns true value. If there is no document, it returns false.
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      /// In case of error, a log is made and false is returned.
      _logger.w('Error checking followed status! : $e');
      return false;
    }
  }

  /// The ID of the user to be processed is 'userId'.
  /// The bool type 'isFollow' holds the information whether
  /// followers or followed will be fetched.
  Future<List<UserModel?>> fetchFollowedAndFollower({
    required String? userId,
    required bool isFollow,
  }) async {
    /// The isFollow value is used to determine the subcollection name.
    final subCollectionName = isFollow ? 'followed' : 'followers';
    try {
      /// Retrieves all documents in the user's specified subcollection.
      final subCollectionSnapshot = await _userCollectionReference
          .doc(userId)
          .collection(subCollectionName)
          .get();

      /// Extracts the IDs of documents retrieved from the subcollection.
      final userIds = subCollectionSnapshot.docs.map((doc) => doc.id).toList();

      /// If no ID is found, an empty list is returned.
      if (userIds.isEmpty) return [];

      /// It retrieves user data from the main collection based on IDs.
      final userSnapshots = await _userCollectionReference
          .where(FieldPath.documentId, whereIn: userIds)
          .withConverter(
        fromFirestore: (snapshot, _) {
          return UserModel().fromFirebase(snapshot);
        },
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      /// Converts received user data into a list.
      final users = userSnapshots.docs.map((doc) => doc.data()).toList();

      /// If successful, log recording is made.
      _logger.i('Users successfully brought in : ${users[0]}...');

      /// The list of users is returned.
      return users;
    } catch (e) {
      /// In case of error, a log is made and an empty list is returned.
      _logger.w('Error fetching $subCollectionName: $e');
      return [];
    }
  }

  /// 'targetUserId' keeps the target user ID to get the IDs of the followed users.
  Future<List<String?>> fetchFollowedUserIds({
    required String? targetUserId,
  }) async {
    try {
      /// All documents in the 'followed' sub-collection
      /// of the document with the specified user ID are queried.
      final subCollectionSnapshot = await _userCollectionReference
          .doc(targetUserId)
          .collection('followed')
          .get();

      /// The IDs of the documents in the subcollection are extracted.
      final userIds = subCollectionSnapshot.docs.map((doc) => doc.id).toList();

      /// If successful, log recording is made.
      _logger.i('userIds successfully brought in : ${userIds[0]}...');

      /// The received user IDs are returned.
      return userIds;
    } catch (e) {
      /// In case of error, a log is made and an empty list is returned.
      _logger.w('Error fetching followed ids: $e');
      return [];
    }
  }
}
