import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

/// A class that manages file uploads and referencing with Firebase Storage.
class FirebaseStorageRepository {
  /// Reference to Firebase Storage instance.
  final _storageReference = FirebaseStorage.instance;

  /// Logger object for logging operations,
  var _logger = Logger(printer: PrettyPrinter());

  /// Creates a Firebase Storage reference for the selected file (XFile).
  Reference? createImageReference(XFile? selectedFile) {
    try {
      /// If the file is selected and the file name is not empty, it will enter.
      if (selectedFile != null || (selectedFile?.name.isNotEmpty ?? false)) {
        /// Firebase Storage master reference.
        final storageRef = _storageReference.ref();

        /// Creates a sub reference with the selected file name.
        final imageRef = storageRef.child(selectedFile!.name);

        /// If the operation is successful, it prints a log.
        _logger.i('createImageReference SUCCESS!');

        /// Returns the created reference.
        return imageRef;
      }
    } catch (e) {
      /// Prints a log in case of error.
      _logger.w('createImageReference ERROR: $e');
      return null;
    }

    /// If the file is not selected or an error occurs, null is returned.
    return null;
  }
}
