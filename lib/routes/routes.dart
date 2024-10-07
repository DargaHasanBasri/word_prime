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
