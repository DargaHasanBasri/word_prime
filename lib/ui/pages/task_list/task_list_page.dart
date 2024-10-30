import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/task_list/components/tasks_list_item.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends BaseStatefulState<TaskListPage> {
  late final TaskListViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<TaskListViewModel>(context, listen: false);
    _vm.taskMethod.value = _vm.whichTaskMethod;
    super.initState();
  }

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.tasksPage_activeTasks.locale,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(height: AppSizes.sizedBoxMediumHeight),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return TaskListItem(
              taskTitle: _vm.taskMethod.value == 'Weekly'
                  ? 'W Fundamentals of HTML & CSS'
                  : 'D Fundamentals of HTML & CSS',
              score: 15,
              completedTask: _vm.completedTask,
              countTask: _vm.countTask,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: AppSizes.sizedBoxMediumHeight,
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.rhino,
      leading: Row(
        children: [
          IconButton(
            onPressed: () => appRoutes.popIfBackStackNotEmpty(),
            icon: Image.asset(
              AppAssets.icArrowBackLeftPath,
              width: AppSizes.appOverallIconWidth,
              height: AppSizes.appOverallIconHeight,
            ),
          ),
        ],
      ),
      title: ValueListenableBuilder(
        valueListenable: _vm.taskMethod,
        builder: (_, __, ___) {
          return Text(
            _vm.taskMethod.value == 'Weekly'
                ? LocaleKeys.tasksPage_tasksWeekly.locale
                : LocaleKeys.tasksPage_tasksDaily.locale,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
          );
        },
      ),
    );
  }
}
