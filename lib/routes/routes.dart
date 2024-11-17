import 'package:word_prime/export.dart';
import 'package:word_prime/ui/pages/reset_password/reset_password_provider.dart';

final class Routes {
  const Routes._();
  static const String Splash = 'splashProvider';
  static const String Onboarding = 'onboardingProvider';
  static const String GetStarted = 'getStartedProvider';
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
  static const String FollowerFollow = 'followerFollowProvider';
  static const String Quiz = 'quizProvider';
  static const String EmailVerification = 'emailVerificationProvider';
  static const String ResetPassword = 'resetPasswordProvider';

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
      case Routes.GetStarted:
        return MaterialPageRoute(
          builder: (context) => const GetStartedProvider(),
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
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordMethodProvider(),
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
      case Routes.FollowerFollow:
        final bool isFollow = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) => FollowerFollowProvider(
            isFollow: isFollow,
          ),
        );
      case Routes.Quiz:
        return MaterialPageRoute(
          builder: (context) => const QuizProvider(),
        );
      case Routes.EmailVerification:
        List<dynamic> arguments = settings.arguments as List;
        final String userId = arguments[0] as String;
        final String userEmail = arguments[1] as String;
        return MaterialPageRoute(
          builder: (context) => EmailVerificationProvider(
            userId: userId,
            userEmail: userEmail,
          ),
        );
      case Routes.ResetPassword:
        final String userEmail = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ResetPasswordProvider(
            userEmail: userEmail,
          ),
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
