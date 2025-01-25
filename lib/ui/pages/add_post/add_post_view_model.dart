import 'dart:developer';
import 'package:word_prime/base/repository/firebase_storage_repository.dart';
import 'package:word_prime/export.dart';

class AddPostViewModel extends BaseViewModel {
  final ValueNotifier<UserModel?> currentUserNotifier;
  final String wordLevel;
  AddPostViewModel(
    this.currentUserNotifier,
    this.wordLevel,
  );

  XFile? _selectedFile;
  ValueNotifier<Uint8List?> selectedImageBytesNotifier = ValueNotifier(null);

  /// Variables in which I store the changes of turkishWord-turkishSentences and
  /// englishWord-englishSentences values in the text form field
  ValueNotifier<String> turkishWordInput = ValueNotifier('');
  ValueNotifier<String> englishWordInput = ValueNotifier('');
  ValueNotifier<String> turkishSentencesInput = ValueNotifier('');
  ValueNotifier<String> englishSentencesInput = ValueNotifier('');

  ValueNotifier<List<String>?> turkishSentences = ValueNotifier([]);
  ValueNotifier<List<String>?> englishSentences = ValueNotifier([]);

  /// Check whether the contents of the turkishWord and englishWord variables are empty
  bool isEmptyInputText() {
    if (turkishWordInput.value.isEmpty || englishWordInput.value.isEmpty)
      return true;
    return false;
  }

  Future<void> addNewPost({
    required VoidCallback showProgress,
    required VoidCallback hideProgress,
    required VoidCallback successAdded,
  }) async {
    try {
      showProgress.call();

      turkishSentences.value?.add(turkishSentencesInput.value);
      englishSentences.value?.add(englishSentencesInput.value);

      String? postUrlPath;
      final imageReference =
          FirebaseStorageRepository().createImageReference(_selectedFile);
      if (imageReference != null && selectedImageBytesNotifier.value != null) {
        await imageReference.putData(selectedImageBytesNotifier.value!);
        postUrlPath = await imageReference.getDownloadURL();
      }
      String? postImageAddress = postUrlPath;

      await PostRepository().addPost(
        postModel: PostModel(
          userId: currentUserNotifier.value?.userId,
          totalComments: 0,
          totalLikes: 0,
          totalSaves: 0,
          wordLevel: wordLevel,
          postImageAddress: postImageAddress,
          userName: currentUserNotifier.value?.userName,
          userProfileImage: currentUserNotifier.value?.profileImageAddress,
          createdDate: Timestamp.now(),
          updatedDate: Timestamp.now(),
          wordEnglish: englishWordInput.value,
          wordTurkish: turkishWordInput.value,
          sentenceEnglish: englishSentences.value,
          sentenceTurkish: turkishSentences.value,
          wordKeywords: [
            turkishWordInput.value.toLowerCase(),
            englishWordInput.value.toLowerCase(),
          ],
        ),
      );
      successAdded.call();
    } catch (e) {
      log('ViewModel An error occurred: $e');
    } finally {
      hideProgress.call();
    }
  }

  Future<void> pickedWordImage() async {
    _selectedFile = await AppUtility().pickImageFromGallery(
      imageSource: ImageSource.gallery,
    );
    if (_selectedFile != null) {
      final selectedImageBytes = await _selectedFile?.readAsBytes();
      selectedImageBytesNotifier.value = selectedImageBytes;
    }
  }
}
