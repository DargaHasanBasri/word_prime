import 'package:flutter/material.dart';
import 'package:word_prime/routes/routes.dart';

class AppRoutes {
  final GlobalKey<NavigatorState> baseNavigatorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName, {
    GlobalKey<NavigatorState>? key,
    dynamic arguments,
    Function? callback,
  }) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    return theKey.currentState!.pushNamed(routeName, arguments: arguments).then(
      (x) {
        if (callback != null) {
          callback(x);
        }
      },
    );
  }

  Future<dynamic> navigateToReplacement(
    String routeName, {
    GlobalKey<NavigatorState>? key,
    dynamic arguments,
    Function? callback,
  }) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    return theKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments)
        .then(
      (x) {
        if (callback != null) {
          callback(x);
        }
      },
    );
  }

  Future<dynamic> navigateRemoveUntil(
    String routeName, {
    GlobalKey<NavigatorState>? key,
    dynamic arguments,
    Function? callback,
  }) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    return theKey.currentState!
        .pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    )
        .then(
      (x) {
        if (callback != null) {
          callback(x);
        }
      },
    );
  }

  Future<dynamic> popPages(
    int pageNumber, {
    GlobalKey<NavigatorState>? key,
    dynamic arguments,
  }) {
    GlobalKey<NavigatorState>? theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    for (var i = 0; i < pageNumber; i++) {
      if (theKey.currentState!.canPop()) {
        theKey.currentState!.pop(arguments);
      } else {
        navigateRemoveUntil(Routes.Splash, arguments: arguments);
        break;
      }
    }
    return Future.value(arguments);
  }

  Future<dynamic> popIfBackStackNotEmpty({
    GlobalKey<NavigatorState>? key,
    dynamic arguments,
  }) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    if (theKey.currentState!.canPop()) {
      theKey.currentState!.pop(arguments);
    } else {
      navigateRemoveUntil(Routes.Login, arguments: arguments);
    }
    return Future.value(arguments);
  }
}
