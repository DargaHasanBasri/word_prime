import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/leaderboard/components/leaderboard_tab_bar.dart';
import 'package:word_prime/ui/pages/leaderboard/components/top_hundred_ranking.dart';
import 'package:word_prime/ui/pages/leaderboard/components/top_three_rankings.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends BaseStatefulState<LeaderboardPage> {
  late final LeaderboardViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<LeaderboardViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ValueListenableBuilder(
      valueListenable: _vm.timeType,
      builder: (_, __, ___) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: AppPaddings.appPaddingHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LeaderboardTabBar(
                      onTapAllTime: () {
                        _vm.timeType.value = 'allTime';
                      },
                      onTapWeekly: () {
                        _vm.timeType.value = 'weekly';
                      },
                      timeType: _vm.timeType.value,
                    ),
                    SizedBox(height: AppSizes.sizedBoxLargeHeight),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TopThreeRankings(
                              profileImgAddress:
                                  AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                              userName: AppLocaleConstants.DEFAULT_USER_NAME,
                              userScore: 12,
                              rankOrder: 2,
                              rankHeight: 32,
                            ),
                          ),
                          Expanded(
                            child: TopThreeRankings(
                              isFirst: true,
                              profileImgAddress:
                                  AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                              userName: AppLocaleConstants.DEFAULT_USER_NAME,
                              userScore: 27,
                              rankOrder: 1,
                              rankHeight: 8,
                            ),
                          ),
                          Expanded(
                            child: TopThreeRankings(
                              profileImgAddress:
                                  AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                              userName: AppLocaleConstants.DEFAULT_USER_NAME,
                              userScore: 8,
                              rankOrder: 3,
                              rankHeight: 42,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: AppPaddings.appPaddingHorizontal,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ListView.separated(
                    itemCount: 10,
                    padding: AppPaddings.appPaddingVertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TopHundredRanking(
                        rankOrder: index,
                        profileImgAddress:
                            AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                        userName: AppLocaleConstants.DEFAULT_USER_NAME,
                        userScore: index,
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: AppSizes.sizedBoxMediumHeight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
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
      title: Text(
        LocaleKeys.tasksPage_leaderboard.locale,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
