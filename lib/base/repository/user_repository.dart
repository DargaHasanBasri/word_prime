import 'dart:developer';
import 'package:word_prime/export.dart';

class UserRepository {
  final _userCollectionReference = FirebaseCollections.users.reference;

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
}
