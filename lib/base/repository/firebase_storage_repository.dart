import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageRepository {
  final _storageReference = FirebaseStorage.instance;
  Reference? createImageReference(XFile? selectedFile) {
    try {
      if (selectedFile != null || (selectedFile?.name.isNotEmpty ?? false)) {
        final storageRef = _storageReference.ref();
        final imageRef = storageRef.child(selectedFile!.name);
        log('createImageReference success');
        return imageRef;
      }
    } catch (e) {
      log('createImageReference error : $e');
    }
    return null;
  }
}
