import 'package:flutter/material.dart';
import 'package:habit_builder/auth/auth.dart';

import '../../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOtherScreens();
  }

  Future<void> navigateToOtherScreens() async {
    final bool isSignedIn = await Auth().isSignedIn();
    if (isSignedIn) {
      AppNavigator.pushReplace(appRoute: AppRoute.bottomNavBarScreen);
    } else {
      AppNavigator.pushReplace(appRoute: AppRoute.loginScreen);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WELCOME TO',
                  style: theme.textTheme.headlineLarge,
                ),
                Text(
                  'MONUMENTAL',
                  style: theme.textTheme.headlineLarge,
                ),
                Text(
                  'HABITS',
                  style: theme.textTheme.headlineLarge,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
