import 'package:word_prime/export.dart';

class TasksProvider extends StatelessWidget {
  const TasksProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksViewModel(),
      child: TasksPage(),
    );
  }
}
