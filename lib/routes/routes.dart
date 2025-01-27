import 'package:word_prime/export.dart';

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
  static const String MyProfileDetails = 'myProfileDetailsProvider';
  static const String MainTab = 'mainTabProvider';
  static const String Home = 'homeProvider';
  static const String Activity = 'activityProvider';
  static const String Tasks = 'tasksProvider';
  static const String TaskList = 'taskListProvider';
  static const String LeaderBoard = 'leaderBoardProvider';
  static const String MyProfile = 'myProfileProvider';
  static const String MyProfileFollowedFollowers =
      'myProfileFollowedFollowersProvider';
  static const String ProfileUserFollowedFollowers =
      'profileUserFollowedFollowersProvider';
  static const String Quiz = 'quizProvider';
  static const String EmailVerification = 'emailVerificationProvider';
  static const String ResetPassword = 'resetPasswordProvider';
  static const String AddWord = 'addWordProvider';
  static const String MyWordList = 'myWordListProvider';
  static const String ProfileUserDetails = 'profileUserDetailsProvider';
  static const String PostDetail = 'postDetailProvider';
  static const String Search = 'searchProvider';
  static const String UpdatePost = 'updatePostProvider';
  static const String QuizSelection = 'quizSelectionProvider';
  static const String TimeUp = 'timeUpProvider';
  static const String QuizDone = 'quizDoneProvider';

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
        final List<dynamic> arguments = settings.arguments as List;
        final ValueNotifier<UserModel?> currentUserModelNotifier =
            arguments[0] as ValueNotifier<UserModel?>;
        final String englishWordLevel = arguments[1] as String;
        return MaterialPageRoute(
          builder: (context) => AddPostProvider(
            currentUserNotifier: currentUserModelNotifier,
            wordLevel: englishWordLevel,
          ),
        );
      case Routes.AddPostSuccessful:
        final String englishWordLevel = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => AddPostSuccessfulProvider(
            wordLevel: englishWordLevel,
          ),
        );
      case Routes.Settings:
        return MaterialPageRoute(
          builder: (context) => const SettingsProvider(),
        );
      case Routes.MyProfileDetails:
        return MaterialPageRoute(
          builder: (context) => const MyProfileDetailsProvider(),
        );
      case Routes.MainTab:
        return MaterialPageRoute(
          builder: (context) => const MainTabProvider(),
        );
      case Routes.Home:
        final ValueNotifier<UserModel?> currentUserNotifier =
            settings.arguments as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => HomeProvider(
            currentUserNotifier: currentUserNotifier,
          ),
        );
      case Routes.Activity:
        final ValueNotifier<UserModel?> currentUserNotifier =
            settings.arguments as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => ActivityProvider(
            currentUserNotifier: currentUserNotifier,
          ),
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
      case Routes.MyProfile:
        final ValueNotifier<UserModel?> userModelNotifier =
            settings.arguments as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) =>
              MyProfileProvider(currentUserNotifier: userModelNotifier),
        );
      case Routes.ProfileUserFollowedFollowers:
        final List<dynamic> arguments = settings.arguments as List;
        final bool isFollowedPage = arguments[0] as bool;
        final String userId = arguments[1] as String;
        final ValueNotifier<UserModel?> currentUserNotifier =
            arguments[2] as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => ProfileUserFollowedFollowersProvider(
            isFollowedPage: isFollowedPage,
            userId: userId,
            currentUserNotifier: currentUserNotifier,
          ),
        );
      case Routes.Quiz:
        final List<dynamic> arguments = settings.arguments as List;
        final String quizType = arguments[0] as String;
        final String languageLevel = arguments[1] as String;
        return MaterialPageRoute(
          builder: (context) => QuizProvider(
            quizType: quizType,
            languageLevel: languageLevel,
          ),
        );
      case Routes.EmailVerification:
        final String userEmail = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => EmailVerificationProvider(
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
      case Routes.AddWord:
        final ValueNotifier<UserModel?> currentUserNotifier =
            settings.arguments as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => AddWordProvider(
            currentUserNotifier: currentUserNotifier,
          ),
        );
      case Routes.MyWordList:
        final List<dynamic> arguments = settings.arguments as List;
        final ValueNotifier<UserModel?> currentUserNotifier =
            arguments[0] as ValueNotifier<UserModel?>;
        final String englishLevel = arguments[1] as String;
        return MaterialPageRoute(
          builder: (context) => MyWordListProvider(
            currentUserNotifier: currentUserNotifier,
            englishLevel: englishLevel,
          ),
        );
      case Routes.ProfileUserDetails:
        final List<dynamic> arguments = settings.arguments as List;
        final String? userId = arguments[0] as String?;
        final ValueNotifier<UserModel?> currentUserModelNotifier =
            arguments[1] as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => ProfileUserDetailsProvider(
            userId: userId,
            currentUserNotifier: currentUserModelNotifier,
          ),
        );
      case Routes.PostDetail:
        final List<dynamic> arguments = settings.arguments as List;
        final PostModel? currentPost = arguments[0] as PostModel?;
        final ValueNotifier<UserModel?> currentUserModelNotifier =
            arguments[1] as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => PostDetailProvider(
            currentPost: currentPost,
            currentUserNotifier: currentUserModelNotifier,
          ),
        );
      case Routes.Search:
        final ValueNotifier<UserModel?> currentUserNotifier =
            settings.arguments as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => SearchProvider(
            currentUserNotifier: currentUserNotifier,
          ),
        );
      case Routes.MyProfileFollowedFollowers:
        final List<dynamic> arguments = settings.arguments as List;
        final bool isFollowedPage = arguments[0] as bool;
        final ValueNotifier<UserModel?> currentUserNotifier =
            arguments[1] as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => MyProfileFollowedFollowersProvider(
            isFollowedPage: isFollowedPage,
            currentUserNotifier: currentUserNotifier,
          ),
        );
      case Routes.UpdatePost:
        final List<dynamic> arguments = settings.arguments as List;
        final ValueNotifier<UserModel?> currentUserNotifier =
            arguments[0] as ValueNotifier<UserModel?>;
        final PostModel? currentPostModel = arguments[1] as PostModel?;
        return MaterialPageRoute(
          builder: (context) => UpdatePostProvider(
            currentUserNotifier: currentUserNotifier,
            currentPostModel: currentPostModel,
          ),
        );
      case Routes.QuizSelection:
        final List<dynamic> arguments = settings.arguments as List;
        final String quizType = arguments[0] as String;
        final ValueNotifier<UserModel?> currentUserNotifier =
            arguments[1] as ValueNotifier<UserModel?>;
        return MaterialPageRoute(
          builder: (context) => QuizSelectionProvider(
            quizType: quizType,
            currentUserNotifier: currentUserNotifier,
          ),
        );
      case Routes.TimeUp:
        return MaterialPageRoute(
          builder: (context) => const TimeUpProvider(),
        );
      case Routes.QuizDone:
        final List<dynamic> arguments = settings.arguments as List;
        final int totalCorrect = arguments[0] as int;
        final int totalWrong = arguments[1] as int;
        final int totalElapsedTime = arguments[2] as int;
        final String quizLevel = arguments[3] as String;
        return MaterialPageRoute(
          builder: (context) => QuizDoneProvider(
            totalCorrect: totalCorrect,
            totalWrong: totalWrong,
            totalElapsedTime: totalElapsedTime,
            quizLevel: quizLevel,
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
