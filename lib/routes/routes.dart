import 'package:flutter/material.dart';
import 'package:word_prime/ui/pages/login/login_provider.dart';
import 'package:word_prime/ui/pages/onboarding/onboarding_provider.dart';
import 'package:word_prime/ui/pages/splash/splash_provider.dart';

final class Routes {
  const Routes._();
  static const String Splash = 'splashProvider';
  static const String Onboarding = 'onboardingProvider';
  static const String Login = 'loginProvider';

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
