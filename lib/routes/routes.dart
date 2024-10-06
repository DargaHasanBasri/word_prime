import 'package:word_prime/export.dart';

final class Routes {
  const Routes._();
  static const String Splash = 'splashProvider';
  static const String Onboarding = 'onboardingProvider';
  static const String Login = 'loginProvider';
  static const String Register = 'registerProvider';
  static const String ForgotPassword = 'forgotPasswordProvider';

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
