import 'package:flutter/material.dart';
import 'package:habit_builder/views/onboarding/signup_and_login/login_screen/login_screen.dart';

import 'app_theme.dart';
import 'routes.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Builder',
      theme: AppTheme().themeData,
      home: const LoginScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      navigatorKey: AppNavigator.navigatorKey,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerState,
    );
  }
}
