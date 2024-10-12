import 'package:word_prime/export.dart';

class TaskListProvider extends StatelessWidget {
  final String whichTaskMethod;

  const TaskListProvider({
    super.key,
    required this.whichTaskMethod,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskListViewModel(whichTaskMethod),
      child: TaskListPage(),
    );
  }
}
