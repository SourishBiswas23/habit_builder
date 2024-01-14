import 'package:flutter/material.dart';
import 'package:habit_builder/views/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:habit_builder/views/new_habit_screen/new_habit_screen.dart';
import 'package:habit_builder/views/onboarding/signup_and_login/forgot_password_screen/forgot_password_screen.dart';
import 'package:habit_builder/views/onboarding/signup_and_login/signup_screen/signup_screen.dart';

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
      home: const NewHabitScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      navigatorKey: AppNavigator.navigatorKey,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerState,
    );
  }
}
