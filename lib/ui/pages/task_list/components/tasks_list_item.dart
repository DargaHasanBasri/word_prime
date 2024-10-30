import 'package:word_prime/export.dart';

class TaskListItem extends StatelessWidget {
  final String taskTitle;
  final int score;
  final int completedTask;
  final int countTask;

  const TaskListItem({
    super.key,
    required this.taskTitle,
    required this.score,
    required this.completedTask,
    required this.countTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.10),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  taskTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              SizedBox(width: AppSizes.sizedBoxOverallWidth),
              Row(
                children: [
                  Text(
                    '$score',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: AppSizes.sizedBoxXSmallWidth),
                  Image.asset(
                    AppAssets.icScorePath,
                    width: AppSizes.appOverallIconWidth,
                    height: AppSizes.appOverallIconHeight,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppSizes.sizedBoxMediumHeight),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: (completedTask / countTask),
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.cornflowerBlue,
                  backgroundColor: AppColors.white,
                ),
              ),
              SizedBox(width: AppSizes.sizedBoxMediumWidth),
              Text(
                "${completedTask} / ${countTask}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
