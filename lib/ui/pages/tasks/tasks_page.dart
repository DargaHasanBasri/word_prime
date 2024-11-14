import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/tasks/components/ranking_results.dart';
import 'package:word_prime/ui/pages/tasks/components/tasks_item.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends BaseStatefulState<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppPaddings.appPaddingAll,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        TasksItem(
          backgroundColor: AppColors.neptune,
          iconAddress: AppAssets.icTaskWeeklyPath,
          title: LocaleKeys.tasksPage_tasksWeekly.locale,
          chapterCount: 10,
          onTapStart: () {
            appRoutes.navigateTo(Routes.TaskList, arguments: 'Weekly');
          },
        ),
        Padding(
          padding: AppPaddings.paddingMediumVertical,
          child: TasksItem(
            backgroundColor: AppColors.watermelon,
            iconAddress: AppAssets.icTaskDailyPath,
            title: LocaleKeys.tasksPage_tasksDaily.locale,
            chapterCount: 10,
            onTapStart: () {
              appRoutes.navigateTo(Routes.TaskList, arguments: 'Daily');
            },
          ),
        ),
        RankingResults(
          onTabViewAll: () {
            appRoutes.navigateTo(Routes.LeaderBoard);
          },
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.rhino,
      title: Text(
        '${LocaleKeys.tasksPage_myTasks.locale}',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
