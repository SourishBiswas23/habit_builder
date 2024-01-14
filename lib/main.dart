import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_builder/controllers/habit_bloc/habit_bloc.dart';
import 'package:habit_builder/firebase_options.dart';

import 'app_theme.dart';
import 'controllers/auth_bloc/auth_bloc.dart';
import 'controllers/bottom__nav_bar_bloc.dart/bottom_nav_bar_bloc.dart';
import 'routes.dart';
import 'views/onboarding/splash_screen/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => HabitBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Habit Builder',
        theme: AppTheme().themeData,
        home: const SplashScreen(),
        onGenerateRoute: AppNavigator.onGenerateRoute,
        navigatorKey: AppNavigator.navigatorKey,
        scaffoldMessengerKey: AppNavigator.scaffoldMessengerState,
      ),
    );
  }
}
