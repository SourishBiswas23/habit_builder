import 'package:flutter/material.dart';
import 'package:habit_builder/app_theme.dart';
import 'package:habit_builder/routes.dart';
import 'package:habit_builder/views/splash_screen/splash_screen.dart';

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
      home: const SplashScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      navigatorKey: AppNavigator.navigatorKey,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerState,
    );
  }
}
