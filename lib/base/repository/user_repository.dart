import 'dart:developer';
import 'package:word_prime/export.dart';

class UserRepository {
  final _userCollectionReference = FirebaseCollections.users.reference;
  User? _currentUser = FirebaseAuth.instance.currentUser;

  /// Pulls the user with a specific userId from Firestore
  Future<UserModel?> fetchUser(String? userId) async {
    try {
      /// Gets the document matching userId in Firestore and converts it to data model
      final response = await _userCollectionReference.doc(userId).withConverter(
        /// Converts data from Firestore to UserModel
        fromFirestore: (snapshot, _) {
          return UserModel().fromFirebase(snapshot);
        },

        /// For data upload to Firestore
        toFirestore: (value, _) {
          return {};
        },
      ).get();

      /// 'response.data()' return represents the data in Firestore
      final userData = response.data();

      /// It is checked whether the data is null or not. If not null, data is returned
      if (userData != null) {
        return userData;
      }

      /// Returns null if user data is not found
      return null;
    } catch (e) {
      /// In case of error, logging is done and null is executed
      log('An error occurred while retrieving user data: $e');
      return null;
    }
  }

  Future<void> updateProfileDetails({
    required String? userName,
    required String? email,
  }) async {
    try {
      final Map<String, dynamic> updatedData = {};

      if (userName != null) {
        updatedData['user_name'] = userName;
        await _currentUser?.updateProfile(
            displayName: userName, photoURL: _currentUser?.photoURL);
        log('Display name updated in Authentication');
      }
      if (email != null) {
        updatedData['email'] = email;
        updatedData['email_verification'] = false;
        await _currentUser?.verifyBeforeUpdateEmail(email);
        log('Email update request sent in Authentication');
      }

      if (updatedData.isNotEmpty) {
        await _userCollectionReference
            .doc(_currentUser?.uid)
            .update(updatedData);
        log('Update success');
      }
    } catch (e) {
      log('Update error: $e');
    }
  }

  Future<List<UserModel?>?> fetchUserByQuery({
    required String searchText,
  }) async {
    try {
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

      List<UserModel?> users = response.docs.map((doc) => doc.data()).toList();

      return users;
    } catch (e) {
      log('An error occurred while retrieving user data: $e');
      return null;
    }
  }
}
