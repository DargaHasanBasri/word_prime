import 'dart:developer';
import 'package:word_prime/export.dart';

/// Authentication manager service
/// Application login, register and signOut operations manager.
class ServiceAuthentication {
  /// `_firebaseAuth` is used to manage Firebase Authentication transactions
  /// is an object.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Creates a new user record.
  /// A new user is registered on Firebase Authentication using the email and
  /// password information in the given 'UserModel' object. If successful,
  /// the user ID (UID) is assigned to the 'userId' field and this information
  /// is saved to Firestore.
  ///
  /// Parameters:
  /// - [userModel]: `UserModel`, which contains the information of the
  /// user to be registered.
  ///
  /// Return:
  /// - Returns `true` if the registration is successful, `false`
  /// if the registration is unsuccessful.
  Future<bool> register({
    required UserModel userModel,
  }) async {
    try {
      /// `UserCredential` is an object returned by user registration or
      /// login provided by Firebase Authentication.
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      if (userCredential.user != null) {
        /// Assigns the user's identity (UID) to the `userId` field
        String uid = userCredential.user!.uid;
        userModel.userId = uid;

        /// Saves user data to Firestore
        FirebaseCollections.users.reference.doc(userModel.userId).set(
              userModel.toJson(),
            );
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        /// If the password is too weak, it logs the error.
        log("The password provided is too weak.", error: e);
      } else if (e.code == 'email-already-in-use') {
        /// If email is already in use, it logs the error.
        log("The account already exists for that email.", error: e);
      }
    } catch (e) {
      /// Catches all other errors and logs the general error message.
      log("An error occurred", error: e);
    }
    return false;
  }

  /// Performs user login.
  /// You can log in with the provided email and password information.
  /// If the login is successful, the user's identification information
  /// (UID) is returned. Returns `null` in case of unsuccessful login.
  ///
  /// Parameters:
  /// - [email]: The user's email address.
  /// - [password]: The user's password.
  ///
  /// Return:
  /// - User's UID on successful login, `null` on unsuccessful login.
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// The user ID (UID) is retrieved and returned.
      String? userId = userCredential.user?.uid;
      return userId;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        /// If the user cannot be found via email, an error is logged.
        log("No user found for that email.", error: e);
      } else if (e.code == 'wrong-password') {
        /// If the password is incorrect, the error is logged.
        log("Wrong password provided for that user.", error: e);
      }
    } catch (e) {
      /// It catches all other errors and logs the general error message.
      log("An error occurred", error: e);
    }
    return null;
  }

  /// Logs the user out of the session.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
