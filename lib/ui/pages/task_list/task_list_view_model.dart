import 'package:word_prime/export.dart';

class TaskListViewModel extends BaseViewModel {
  final String whichTaskMethod;
  TaskListViewModel(this.whichTaskMethod);

  ValueNotifier<String> taskMethod = ValueNotifier('');
}
