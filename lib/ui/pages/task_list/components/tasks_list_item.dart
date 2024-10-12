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
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.softPeach,
              ),
            ),
            child: Text(
              taskTitle,
              style: TextStyle(
                color: AppColors.mirage,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 3,
            ),
          ),
        ),
        SizedBox(width: 24),
        Image.asset(AppAssets.icScorePath),
      ],
    );
  }
}
