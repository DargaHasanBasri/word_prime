import 'package:word_prime/export.dart';

class QuizViewModel extends BaseViewModel {
  ValueNotifier<String> correctOption = ValueNotifier('APPLE');
  ValueNotifier<String?> selectedOption = ValueNotifier(null);
}
