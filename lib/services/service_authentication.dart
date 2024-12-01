import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:word_prime/export.dart';

/// Authentication manager service
/// Application login, register and signOut operations manager.
class ServiceAuthentication {
  /// `_firebaseAuth` is used to manage Firebase Authentication transactions
  /// is an object.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> updateAuthUserDetails({
    required String userName,
    required String profileImageAddress,
  }) async {
    User? user = _firebaseAuth.currentUser;

    if (user != null) {
      await user.updateDisplayName(userName);
      await user.updatePhotoURL(profileImageAddress);
      await user.reload();
    }
  }

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
  /// - Returns `UserCredential` if the registration is successful, `null`
  /// if the registration is unsuccessful.
  Future<UserCredential?> register({
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
        await userCredential.user?.sendEmailVerification();
        log('Verification email sent!');

        /// Assigns the user's identity (UID) to the `userId` field
        String uid = userCredential.user!.uid;
        userModel.userId = uid;

        /// Saves user data to Firestore
        await FirebaseCollections.users.reference.doc(userModel.userId).set(
              userModel.toJson(),
            );

        await updateAuthUserDetails(
          userName: userModel.userName!,
          profileImageAddress: userModel.profileImageAddress!,
        );
        log("Firebase Authentication bilgileri güncellendi.");
        return userCredential;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        /// If the password is too weak, it logs the error.
        log("The password provided is too weak.", error: e);
        rethrow;
      } else if (e.code == 'email-already-in-use') {
        /// If email is already in use, it logs the error.
        log("The account already exists for that email.", error: e);
        rethrow;
      } else if (e.code == 'invalid-email') {
        log("E-posta adresi hatalı bir biçimde yazılmış.", error: e);
        rethrow;
      }
    } catch (e) {
      /// Catches all other errors and logs the general error message.
      log("An error occurred", error: e);
      rethrow;
    }
    return null;
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
  Future<UserCredential?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        /// If the user cannot be found via email, an error is logged.
        log("No user found for that email.", error: e);
        rethrow;
      } else if (e.code == 'wrong-password') {
        /// If the password is incorrect, the error is logged.
        log("Wrong password provided for that user.", error: e);
        rethrow;
      }
    } catch (e) {
      /// It catches all other errors and logs the general error message.
      log("An error occurred", error: e);
      rethrow;
    }
    return null;
  }

  /// Logs out the user who is logged in with their email and password.
  Future<void> signOutWithEmailPassword() async {
    await _firebaseAuth.signOut();
    log("Firebase session terminated.");
  }

  Future<UserCredential?> loginWithGoogle() async {
    try {
      /// Opens the user login screen.
      final googleUser = await GoogleSignIn().signIn();

      /// If user cancels login
      if (googleUser == null) {
        log("User canceled Google login.");
        return null;
      }

      final googleAuth = await googleUser.authentication;

      /// Google credentials are created for Firebase.
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      /// Login with Firebase.
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        log("Failed to create Firebase user.");
        return null;
      }

      final userDocRef =
      FirebaseCollections.users.reference.doc(firebaseUser.uid);

      /// Check if the user document already exists.
      final userDocSnapshot = await userDocRef.get();
      if (!userDocSnapshot.exists) {
        /// Saving user information to Firestore if the user is new.
        await userDocRef.set(
          UserModel(
            email: firebaseUser.email ?? googleUser.email,
            profileImageAddress: firebaseUser.photoURL ?? googleUser.photoUrl,
            userId: firebaseUser.uid,
            userName: firebaseUser.displayName ?? googleUser.displayName,
            emailVerification: true,
          ).toJson(),
        );
        log("New user created: ${firebaseUser.uid}");
      } else {
        log("User already exists: ${firebaseUser.uid}");
      }

      log("User logged in successfully: ${firebaseUser.uid}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      /// Firebase authentication errors.
      log("Firebase error: ${e.message}", error: e);
      rethrow;
    } on Exception catch (e) {
      /// It catches all other errors and logs the general error message.
      log("An error occurred", error: e);
      rethrow;
    }
  }

  /// Logs out the user who is logged in with their google.
  Future<void> signOutWithGoogle() async {
    /// Creates an instance of [GoogleSignIn] to manage the user's Google sign-in session.
    /// and handle signing out of Google.
    final googleSignIn = GoogleSignIn();

    /// Sign out of Google Sign-In
    await googleSignIn.signOut();
    log("Google session terminated.");
  }

  Future<void> resendEmailVerificationLink(User? user) async {
    try {
      if (user == null) {
        log('User is null. The verification email could not be sent');
        return;
      }

      if (user.emailVerified) {
        log('Email is already verified');
        return;
      }

      await user.sendEmailVerification();
      log('Verification email sent!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('Bu e-posta adresiyle kayıtlı bir kullanıcı bulunamadı.');
        rethrow;
      } else {
        log('Bir hata oluştu: ${e.message}');
      }
      rethrow;
    } catch (e) {
      log('Bir hata oluştu: $e');
      rethrow;
    }
  }

  Future<bool> checkEmailVerification() async {
    User? user = _firebaseAuth.currentUser;

    await user?.reload();
    user = _firebaseAuth.currentUser;

    if (user != null && user.emailVerified) {
      log('E-posta doğrulandı, Login sayfasına yönlendiriliyor.');
      return true;
    } else {
      log('E-posta henüz doğrulanmadı.');
      return false;
    }
  }

  Future<void> sendResetPasswordLink(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      log('Parola sıfırlama bağlantısı gönderildi.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('Bu e-posta adresiyle kayıtlı bir kullanıcı bulunamadı.');
        rethrow;
      } else {
        log('Bir hata oluştu: ${e.message}');
      }
      rethrow;
    } catch (e) {
      log('Bir hata oluştu: $e');
      rethrow;
    }
  }
}
