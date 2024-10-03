import 'package:flutter/material.dart';
import 'package:word_prime/ui/pages/splash/splash_provider.dart';

final class Routes {
  const Routes._();
  static const String Splash = 'splashProvider';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Splash:
        return MaterialPageRoute(
          builder: (context) => const SplashProvider(),
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
