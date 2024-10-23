import 'package:word_prime/export.dart';

class TaskListItem extends StatelessWidget {
  final String taskTitle;
  final int score;
  const TaskListItem({
    super.key,
    required this.taskTitle,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mirage.withOpacity(0.03),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Text(
        taskTitle,
        style: Theme.of(context).textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }
}
