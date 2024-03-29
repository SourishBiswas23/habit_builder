import 'package:flutter/material.dart';
import 'package:habit_builder/views/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:habit_builder/views/new_habit_screen/new_habit_screen.dart';
import 'package:habit_builder/views/onboarding/signup_and_login/forgot_password_screen/forgot_password_screen.dart';

import 'views/not_found_screen/not_found_screen.dart';
import 'views/onboarding/introduction_screen/introduction_screen.dart';
import 'views/onboarding/signup_and_login/login_screen/login_screen.dart';
import 'views/onboarding/signup_and_login/signup_screen/signup_screen.dart';
import 'views/onboarding/splash_screen/splash_screen.dart';

enum AppRoute {
  splashScreen,
  notFoundScreen,
  introductionScreen,
  loginScreen,
  signupScreen,
  forgotPasswordScreen,
  bottomNavBarScreen,
  newHabitScreen,
}

class _Paths {
  static const String splashScreen = '/splashScreen';
  static const String notFoundScreen = '/notFoundScreen';
  static const String introductionScreen = '/introductionScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String bottomNavBarScreen = '/bottomNavBarScreen';
  static const String newHabitScreen = '/newHabitScreen';

  static const Map<AppRoute, String> _pathMap = {
    AppRoute.splashScreen: _Paths.splashScreen,
    AppRoute.notFoundScreen: _Paths.notFoundScreen,
    AppRoute.introductionScreen: _Paths.introductionScreen,
    AppRoute.loginScreen: _Paths.loginScreen,
    AppRoute.signupScreen: _Paths.signupScreen,
    AppRoute.forgotPasswordScreen: _Paths.forgotPasswordScreen,
    AppRoute.bottomNavBarScreen: _Paths.bottomNavBarScreen,
    AppRoute.newHabitScreen: _Paths.newHabitScreen,
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
      case _Paths.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case _Paths.signupScreen:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case _Paths.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case _Paths.bottomNavBarScreen:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case _Paths.newHabitScreen:
        return MaterialPageRoute(
          builder: (context) => const NewHabitScreen(),
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
