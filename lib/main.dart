import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';
import 'controllers/bottom__nav_bar_bloc.dart/bottom_nav_bar_bloc.dart';
import 'routes.dart';
import 'views/bottom_nav_bar/bottom_nav_bar.dart';

void main(List<String> args) {
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
      ],
      child: MaterialApp(
        title: 'Habit Builder',
        theme: AppTheme().themeData,
        home: const BottomNavBar(),
        onGenerateRoute: AppNavigator.onGenerateRoute,
        navigatorKey: AppNavigator.navigatorKey,
        scaffoldMessengerKey: AppNavigator.scaffoldMessengerState,
      ),
    );
  }
}
