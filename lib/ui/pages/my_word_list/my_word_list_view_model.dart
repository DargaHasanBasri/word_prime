import 'package:word_prime/export.dart';

class MyWordListViewModel extends BaseViewModel {
  final String englishLevel;
  MyWordListViewModel(this.englishLevel);

  final ValueNotifier<bool> isActiveLike = ValueNotifier(false);
  final ValueNotifier<bool> isActiveSave = ValueNotifier(false);
  final ValueNotifier<bool> isActiveComment = ValueNotifier(false);
  final ValueNotifier<bool> isActiveTranslate = ValueNotifier(false);

  ValueNotifier<bool> isSaved = ValueNotifier(false);
}
