import 'package:flutter/material.dart';

import 'views/not_found_screen/not_found_screen.dart';
import 'views/onboarding/introduction_screen/introduction_screen.dart';
import 'views/onboarding/splash_screen/splash_screen.dart';

enum AppRoute {
  splashScreen,
  notFoundScreen,
  introductionScreen,
}

class _Paths {
  static const String splashScreen = '/splashScreen';
  static const String notFoundScreen = '/notFoundScreen';
  static const String introductionScreen = '/introductionScreen';

  static const Map<AppRoute, String> _pathMap = {
    AppRoute.splashScreen: _Paths.splashScreen,
    AppRoute.notFoundScreen: _Paths.notFoundScreen,
    AppRoute.introductionScreen: _Paths.introductionScreen,
  };

  static String of(AppRoute appRoute) => _pathMap[appRoute] ?? notFoundScreen;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerState = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case _Paths.notFoundScreen:
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      case _Paths.introductionScreen:
        return MaterialPageRoute(
          builder: (context) => const IntroductionScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
    }
  }

  static Future? push({required AppRoute appRoute}) {
    return navigatorKey.currentState?.pushNamed(_Paths.of(appRoute));
  }

  static Future? pushReplace({required AppRoute appRoute}) {
    return navigatorKey.currentState?.pushReplacementNamed(_Paths.of(appRoute));
  }

  static void pop() {
    return navigatorKey.currentState?.pop();
  }
}
