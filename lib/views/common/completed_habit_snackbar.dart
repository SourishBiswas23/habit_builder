import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_builder/app_theme.dart';
import 'package:habit_builder/routes.dart';

void showSnackbar() {
  final buildContext = AppNavigator.navigatorKey.currentContext;
  final snackbar = SnackBar(
    backgroundColor: AppTheme.creame,
    content: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 4,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => AppNavigator.scaffoldMessengerState.currentState
                    ?.hideCurrentSnackBar(),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppTheme.eclipse.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.xmark,
                    color: AppTheme.eclipse,
                  ),
                ),
              )
            ],
          ),
          Image.asset(
            'assets/images/habit_completed.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            'CONGRATULATIONS!',
            style: buildContext == null
                ? null
                : Theme.of(buildContext).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            "Fantastic job! You've conquered the habit - a testament to your commitment and resilience. Keep shining!",
            textAlign: TextAlign.center,
            style: buildContext == null
                ? null
                : Theme.of(buildContext).textTheme.bodyLarge,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.morning,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Create New Habit',
                style: buildContext == null
                    ? null
                    : Theme.of(buildContext).textTheme.headlineSmall?.copyWith(
                          fontSize: 18,
                        ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.creame,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Continue',
                style: buildContext == null
                    ? null
                    : Theme.of(buildContext).textTheme.headlineSmall?.copyWith(
                          fontSize: 18,
                        ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  AppNavigator.scaffoldMessengerState.currentState?.showSnackBar(snackbar);
}
