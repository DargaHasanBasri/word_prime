import 'package:word_prime/export.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends BaseStatefulState<ProfileUserPage> {
  late final ProfileUserViewModel _vm;

  @override
  void initState() {
    _vm = Provider.of<ProfileUserViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: AppPaddings.appPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppPaddings.paddingMediumTop,
              child: _userInfo(),
            ),
            Padding(
              padding: AppPaddings.paddingLargeTop,
              child: _userProfileMetric(),
            ),
            GridView.builder(
              padding: AppPaddings.appPaddingVertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 16,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(
                        AppAssets.imgExampPostPath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _userProfileMetric() {
    return Container(
      padding: AppPaddings.paddingSmallVertical,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColors.platinum.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Word',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(width: AppSizes.sizedBoxSmallWidth),
              Row(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Score',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: AppSizes.sizedBoxOverallWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Following',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(width: AppSizes.sizedBoxSmallWidth),
              Row(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: AppSizes.sizedBoxSmallWidth),
                  Text(
                    'Followers',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: AppSizes.sizedBoxOverallWidth),
          Expanded(
            child: CustomButton(
              title: 'FOLLOW',
              borderRadius: 16,
              onClick: () {
                appRoutes.navigateTo(Routes.Settings);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomUserCircleAvatar(
              circleRadius: 40,
              borderPadding: 0,
            ),
            SizedBox(width: AppSizes.sizedBoxMediumWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hüseyin Darga',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: AppSizes.sizedBoxXSmallWidth),
                  Text(
                    "Why do we use it? It is a long established fact that a reader will"
                    "be distracted by lorem ipsum lorem ipsum lorem ipsum lorem"
                    " ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum",
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          appRoutes.popIfBackStackNotEmpty();
        },
        icon: Image.asset(
          AppAssets.icArrowBackLeftPath,
          color: Theme.of(context).colorScheme.secondary,
          width: AppSizes.appOverallIconWidth,
          height: AppSizes.appOverallIconHeight,
        ),
      ),
      title: Text(
        'User Name',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
