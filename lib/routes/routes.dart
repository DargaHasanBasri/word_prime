import 'package:word_prime/export.dart';

final class Routes {
  const Routes._();
  static const String Splash = 'splashProvider';
  static const String Onboarding = 'onboardingProvider';
  static const String Login = 'loginProvider';
  static const String Register = 'registerProvider';
  static const String ForgotPassword = 'forgotPasswordProvider';
  static const String ForgotPasswordMethod = 'forgotPasswordMethodProvider';
  static const String AddPost = 'addPostProvider';
  static const String AddPostSuccessful = 'addPostSuccessfulProvider';
  static const String Settings = 'settingsProvider';
  static const String ProfileDetails = 'profileDetailsProvider';
  static const String MainTab = 'mainTabProvider';
  static const String Home = 'homeProvider';
  static const String Activity = 'activityProvider';
  static const String Tasks = 'tasksProvider';
  static const String TaskList = 'taskListProvider';
  static const String LeaderBoard = 'leaderBoardProvider';
  static const String Profile = 'profileProvider';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Splash:
        return MaterialPageRoute(
          builder: (context) => const SplashProvider(),
        );
      case Routes.Onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingProvider(),
        );
      case Routes.Login:
        return MaterialPageRoute(
          builder: (context) => const LoginProvider(),
        );
      case Routes.Register:
        return MaterialPageRoute(
          builder: (context) => const RegisterProvider(),
        );
      case Routes.ForgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordProvider(),
        );
      case Routes.ForgotPasswordMethod:
        final String methodType = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordMethodProvider(
            whichMethod: methodType,
          ),
        );
      case Routes.AddPost:
        return MaterialPageRoute(
          builder: (context) => const AddPostProvider(),
        );
      case Routes.AddPostSuccessful:
        return MaterialPageRoute(
          builder: (context) => const AddPostSuccessfulProvider(),
        );
      case Routes.Settings:
        return MaterialPageRoute(
          builder: (context) => const SettingsProvider(),
        );
      case Routes.ProfileDetails:
        return MaterialPageRoute(
          builder: (context) => const ProfileDetailsProvider(),
        );
      case Routes.MainTab:
        return MaterialPageRoute(
          builder: (context) => const MainTabProvider(),
        );
      case Routes.Home:
        return MaterialPageRoute(
          builder: (context) => const HomeProvider(),
        );
      case Routes.Activity:
        return MaterialPageRoute(
          builder: (context) => const ActivityProvider(),
        );
      case Routes.Tasks:
        return MaterialPageRoute(
          builder: (context) => const TasksProvider(),
        );
      case Routes.TaskList:
        final String taskMethodType = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => TaskListProvider(
            whichTaskMethod: taskMethodType,
          ),
        );
      case Routes.LeaderBoard:
        return MaterialPageRoute(
          builder: (context) => const LeaderboardProvider(),
        );
      case Routes.Profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileProvider(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No path for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
