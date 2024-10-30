import 'package:word_prime/export.dart';

class TaskListViewModel extends BaseViewModel {
  final String whichTaskMethod;
  TaskListViewModel(this.whichTaskMethod);

  final int completedTask = 25;
  final int countTask = 30;

  ValueNotifier<String> taskMethod = ValueNotifier('');
}
